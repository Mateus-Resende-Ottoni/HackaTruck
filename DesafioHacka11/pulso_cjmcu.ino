// Variáveis
const int sensorPin = A0; // Pino analógico conectado ao sensor MQ3
byte sensorValue;          // Sinal de entrada do sensor
int limit = 80;         // Limite para uma determinada entrada ser um batimo cardíaco

void setup() {
  // Iniciar comunicação serial e determinar velocidade em bites por segundos
  Serial.begin(38400);
}

void loop() {
  sensorValue = analogRead(sensorPin); // Ler valor do sensor

  //Serial.println(sensorValue);                    // Envia o valor lido pela porta serial

  if (sensorValue > limit) { // Se contar como batida cardíaca
    Serial.print(sensorValue);
    Serial.println("  _  Doki Doki");
  } else {
      Serial.println(" ");
  //  Serial.println("  _  Not Doki Doki");
  }


  delay(20); // Delay em milissegundos
}
