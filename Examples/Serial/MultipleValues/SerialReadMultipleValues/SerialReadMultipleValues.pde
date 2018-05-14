/**
 * Serial read multiple values
 * 
 * Read multiple comma-separated integer values from the serial port
 * and print them out on the console.
 */


import processing.serial.*;

Serial myPort;  // Create object from Serial class
int val;      // Data received from the serial port

void setup() 
{
  size(200, 200);
  println(Serial.list());
  String portName = Serial.list()[1];
  myPort = new Serial(this, portName, 9600);
  myPort.bufferUntil('\n'); // serialEvent() will now be called every time we get a new line character.
}


/** This function is called whenever there is new serial data ready for reading.
* Using this method is cleaner than repeatedly polling the serial port in the
* draw() function.
**/
void serialEvent(Serial p){
  String s = p.readString(); // read a new string from the serial port.
  String[] strings = s.split(","); // split the strings into an array using ',' as a delimiter

  int[] values = new int[strings.length]; // create a new int array to hold the numbers
  for (int i = 0; i < strings.length; i++){
     values[i] = int(strings[i]); // parse the integer value of each string.
     println("Number " + i + " = " + values[i]); // print out the result.
  }
  
}


void draw(){
  
}