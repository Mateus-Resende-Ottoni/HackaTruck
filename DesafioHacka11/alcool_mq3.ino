// Variáveis
const int sensorPin = A0; // Pino analógico conectado ao sensor MQ3
int sensorValue; // Para armazenar o valor lido pelo sensor


void setup() {
  // Iniciar comunicação serial e determinar velocidade em bites por segundos
  Serial.begin(115200);
}

void loop() {
  sensorValue = analogRead(sensorPin); // Ler valor do sensor


  Serial.println(sensorValue);                    // Envia o valor lido pela porta serial
  Serial.println(map(sensorValue,0,1023,0,100));  // Envia o valor lido pela porta serial em %


  delay(1500); // Delay em milissegundos
}
