// Temperature and Humidity Reader - Suhaani Singh
// This program reads temperature and humidity values from an Arduino via the serial port
// and displays them as clear, labeled text on a Processing window


import processing.serial.*;                                 // import serial library to communicate with arduino ide 

Serial port;                                                // serial port object to receive data

float temperature = 0;                                      // variable to store temperature value
float humidity = 0;                                         // variable to store humidity value


void setup() {
  size(500, 300);                                           // set size of the display window
  background(0);                                            // set bg color to black

  port = new Serial(this, "COM3", 9600);                    // initialize the serial port with COM3

  textFont(createFont("Arial", 24));                        // set font to Arial, size 24
  textAlign(CENTER);                                        // center-align the text
}


void draw() {
  background(0);                                            // clear the bg every frame

  fill(255, 0, 0);                                          // set text color to red
  textSize(30);
  text("Temperature and Humidity", width / 2, 50);          // display title at top center

  fill(0, 0, 255);                                          // set text color to blue
  textSize(24);

  text("Temperature (C):", width / 2, 120);                 // label for temperature
  text(nf(temperature, 1, 1), width / 2, 150);              // display temperature value with 1 decimal

  text("Humidity (%):", width / 2, 200);                    // label for humidity
  text(nf(humidity, 1, 1), width / 2, 230);                 // display humidity value with 1 decimal

  if (port.available() > 0) {                               // check if data is available on serial port
    String val = port.readStringUntil('\n');                // read string until newline
    if (val != null) {
      String[] list = split(trim(val), ',');                // split data by comma into temperature & humidity
      if (list.length == 2) {
        temperature = float(list[0]);                       // parse temp value
        humidity = float(list[1]);                          // parse humidity value
      }
    }
  }
}
