import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

/**
 * Simple Read
 * 
 * Read data from the serial port and change the color of a rectangle
 * when a switch connected to a Wiring or Arduino board is pressed and released.
 * This example works with the Wiring / Arduino program that follows below.
 */


import processing.serial.*;
import processing.sound.*;

Serial myPort;  // Create object from Serial class
int val;      // Data received from the serial port
//SoundFile song;
float receivedNumber=0;
int data;

Minim minim;
AudioPlayer player1;
AudioPlayer player2;
AudioPlayer player3;
AudioPlayer player4;


void setup() 
{
  //size(200, 200);
  size(640, 360);
  String portName = Serial.list()[1];
  myPort = new Serial(this, portName, 9600);
  //song1 = new SoundFile(this, "Pharrell Williams - Happy (Official Music Video).mp3");
  //song1=new SoundFile(this, "cranky.mp3" );
  //song2=new SoundFile(this, "angry.mp3");
  //song3=new SoundFile (this, "punch.mp3");
  //song4=new SoundFIle (this, "hereforyou.mp3");

  minim = new Minim(this);{
  player1 = minim.loadFile("cranky.mp3");
  player2 = minim.loadFile("angry.mp3");
  player3 = minim.loadFile("punch.mp3");
  player4 = minim.loadFile("hereforyou.mp3");
  }
}

void draw()
{

  background(255);             // Set background to white

  if (data == 1) 
  {              // If sensor is greater than 700,
    if (player1.isPlaying() == false) {
      println("PLAY!");
      fill(0);  
      player1.rewind();
      player1.play();
    } 
    else
    {
       fill(0);  
    }
  } 
  
  else if (data == 2)
  { 
    if (player2.isPlaying() == false) {
      println("PLAY!");
      fill(0);  
      player2.rewind();
      player2.play();
    } 
    else
    {
       fill(0);  
    }
  }
  else if (data==3)
  {                       // If the serial value is not 0,
    if (player3.isPlaying() == false) {
      println("PLAY!");
      fill(0);  
      player3.rewind();
      player3.play();
    } 
    else
    {
       fill(0);  
    }             // set fill to light gray
  }
  else if(data==4)
  {
  if (player4.isPlaying() == false) {
      println("PLAY!");
      fill(0);  
      player4.rewind();
      player4.play();
    } 
    else
    {
       fill(0);  
    }
  }


  rect(50, 50, 100, 100);
}

void serialEvent(Serial p) { 
  data = p.read(); 
  println(data);
} 
////


/*

 // Wiring / Arduino Code
 // Code for sensing a switch status and writing the value to the serial port.
 
 int switchPin = 4;                       // Switch connected to pin 4
 
 void setup() {
 pinMode(switchPin, INPUT);             // Set pin 0 as an input
 Serial.begin(9600);                    // Start serial communication at 9600 bps
 }
 
 void loop() {
 if (digitalRead(switchPin) >) {  // If switch is ON,
 Serial.write(1);               // send 1 to Processing
 } else {                               // If the switch is not ON,
 Serial.write(0);               // send 0 to Processing
 }
 delay(100);                            // Wait 100 milliseconds
 }
 
 */