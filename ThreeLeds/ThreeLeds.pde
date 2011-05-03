/*
*  My first test with Arduino - Three leds
*  Author: Marko Kaartinen
*  Www: www.markokaartinen.info
*  E-mail: markokaartinen@gmail.com
*/

int yellowPin = 8;
int redPin = 9;
int greenPin = 10;

void setup(){
  pinMode(yellowPin, OUTPUT);
  pinMode(redPin, OUTPUT);
  pinMode(greenPin, OUTPUT);
}

void loop(){
  ledOnAndOff(yellowPin);
  ledOnAndOff(redPin);
  ledOnAndOff(greenPin);
  ledOnAndOff(redPin);
}

void ledOnAndOff(int ledPin){
  digitalWrite(ledPin, HIGH);
  delay(500);
  digitalWrite(ledPin, LOW);
}
