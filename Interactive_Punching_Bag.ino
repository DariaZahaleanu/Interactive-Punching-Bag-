/*
  AnalogReadSerial
  Reads an analog input on pin 0, prints the result to the serial monitor.
  Graphical representation is available using serial plotter (Tools > Serial Plotter menu)
  Attach the center pin of a potentiometer to pin A0, and the outside pins to +5V and ground.

  This example code is in the public domain.
*/
const int ledPin1 =  2;
const int ledPin2 =  4;
const int ledPin3 =  6;
const int ledPin4 =  7;
const int leds[] = {ledPin1, ledPin2, ledPin3, ledPin4};
// the setup routine runs once when you press reset:
void setup() {
  // initialize serial communication at 9600 bits per second:
  Serial.begin(9600);
  pinMode(ledPin1, OUTPUT);
  pinMode(ledPin2, OUTPUT);
  pinMode(ledPin3, OUTPUT);
  pinMode(ledPin4, OUTPUT);
}

// the loop routine runs over and over again forever:
void loop() {
  // read the input on analog pin 0:
  int sensorValue = analogRead(A0);
  // print out the value you read:
  Serial.println(sensorValue);
  // delay in between reads for stability
//  if (sensorValue > 100){
//    // If switch is ON,
//  }
    for (int i=0;i<4;i++){
      digitalWrite(leds[i],LOW);
    }
    if (sensorValue > 500 && sensorValue < 650) {
    Serial.write(1);
    digitalWrite(ledPin1, HIGH);   // turn the LED on (HIGH is the voltage level)
                           // wait for a second
    //digitalWrite(ledPin1, LOW);    // turn the LED off by making the voltage LOW
    }
    if (sensorValue > 650 && sensorValue < 800) {
     Serial.write(2);
    digitalWrite(ledPin2, HIGH);   // turn the LED on (HIGH is the voltage level)
                           // wait for a second
    //digitalWrite(ledPin2, LOW);    // turn the LED off by making the voltage LOW
    }
    if (sensorValue > 800 && sensorValue < 950){
      Serial.write(3);
    digitalWrite(ledPin3, HIGH);   // turn the LED on (HIGH is the voltage level)
                           // wait for a second
    //digitalWrite(ledPin3, LOW);    // turn the LED off by making the voltage LOW

    }
    if (sensorValue > 950) {
      Serial.write(4);
    digitalWrite(ledPin4, HIGH);   // turn the LED on (HIGH is the voltage level)
                           // wait for a second
    //digitalWrite(ledPin4, LOW);    // turn the LED off by making the voltage LOW
    // send 1 to Processing
   
  }
  else {                               // If the switch is not ON,
    Serial.write(0);               // send 0 to Processing
  }
  // delay(100);
  
  // Wait 100 milliseconds
  delay(1);
}

