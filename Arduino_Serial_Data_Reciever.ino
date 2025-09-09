// Temperature Humidity Serial Data Reciever - Suhaani Singh
// This program reads temperature and humidity data from a DHT11 sensor
// and prints the values thru the Serial Monitor in CSV format (temperature, humidity).


#include <DHT.h>                                    // include DHT sensor library

#define DHTPIN 2                                    // define digital pin connected to the DHT sensor
#define DHTTYPE DHT11                               // define sensor type (DHT11)

DHT dht(DHTPIN, DHTTYPE);                           // create a DHT object with specified pin and sensor type

void setup() {
  Serial.begin(9600);                               // start serial communication at 9600 baud
  dht.begin();                                      // initialize the DHT sensor
}

void loop() {
  float temperature = dht.readTemperature();        // read temperature in celsius
  float humidity = dht.readHumidity();              // read humidity percentage

  Serial.print(temperature, 1);                     // print temperature with 1 decimal place
  Serial.print(", ");
  Serial.println(humidity, 1);                      // print humidity with 1 decimal place and newline

  delay(2000);                                      // wait 2 seconds before next reading
}



