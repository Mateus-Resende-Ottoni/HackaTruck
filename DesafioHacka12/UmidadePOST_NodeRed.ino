#include <Arduino.h>
#include <ESP8266WiFi.h>
#include <ESP8266HTTPClient.h>

WiFiClient client;
HTTPClient httpClient;

const char *WIFI_SSID = "HackaTruckIoT";
const char *WIFI_PASSWORD = "iothacka";
const char *URL = "http://192.168.128.9:1880/postUmidadeMateus";

int output_value ;
int sensor_pin = A0;
 
void setup(){
    Serial.begin(115200); 
    WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
    while (WiFi.status() != WL_CONNECTED) {
        delay(500);
        Serial.print(".");
    }
    Serial.println("Connected");
    delay(2000);
}

float FazLeituraUmidade(void)
{
    int ValorADC; //Valor lido analogicamente pelo sensor de umidade
    float UmidadePercentual; //valor interpretado de acordo com a escala abaixo
 
     ValorADC = analogRead(0);   //1023 -> 3,3V
     Serial.print("[Leitura ADC] ");
     Serial.println(ValorADC);
 
     //Quanto maior o número lido do ADC, menor a umidade.
     //Sendo assim, calcula-se a porcentagem de umidade por:
     //      
     //   Valor lido                 Umidade percentual
     //      _    0                           _ 100
     //      |                                |   
     //      |                                |   
     //      -   ValorADC                     - UmidadePercentual 
     //      |                                |   
     //      |                                |   
     //     _|_  1023                         _|_ 0
     //
     //   (UmidadePercentual-0) / (100-0)  =  (ValorADC - 1024) / (-1024)
     //      Logo:
     //      UmidadePercentual = 100 * ((1024-ValorADC) / 1024)  
     
    UmidadePercentual = 100 * ((1024-(float)ValorADC) / 1024);
    //  UmidadePercentual = map(ValorADC, 0, 1023, 100, 0);
     Serial.print("[Umidade Percentual] ");
     Serial.print(UmidadePercentual);
     Serial.println("%");
 
     return UmidadePercentual;
}

void loop(){
  float umidade = FazLeituraUmidade();
  String data = "umidade=" + String(umidade);

    httpClient.begin(client, URL);
    httpClient.addHeader("Content-Type", "application/x-www-form-urlencoded");
    httpClient.POST(data);
    String content = httpClient.getString();
    httpClient.end();

    Serial.print(output_value); 
    Serial.print("\n resposta");   
    Serial.println(content);
    delay(5000);
}