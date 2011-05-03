/*
*  My second test with Arduino - Button and leds
*  Author: Marko Kaartinen
*  Www: www.markokaartinen.info
*  E-mail: markokaartinen@gmail.com
*/

int inPin = 2;
int gLed1 = 7;
int gLed2 = 8;
int yLed = 9;
int rLed = 10;
int gLed3 = 11;
int gLed4 = 12;

int state = LOW;
int reading;
int previous = HIGH;

long time = 0;
long debounce = 60;

void setup(){
  pinMode(inPin, INPUT);
  pinMode(gLed1, OUTPUT);
  pinMode(gLed2, OUTPUT);
  pinMode(yLed, OUTPUT);
  pinMode(rLed, OUTPUT);
  pinMode(gLed3, OUTPUT);
  pinMode(gLed4, OUTPUT);
}

void loop(){
  reading = digitalRead(inPin);
  if (reading == HIGH && previous == LOW && millis() - time > debounce) {
    if(state == HIGH){
      state = LOW;
    }else{
      state = HIGH;
    }
    time = millis();
  }
  digitalWrite(gLed1, state);
  delay(50);
  digitalWrite(gLed2, state);
  delay(50);
  digitalWrite(yLed, state);
  delay(50);
  digitalWrite(rLed, state);
  delay(50);
  digitalWrite(gLed3, state);
  delay(50);
  digitalWrite(gLed4, state);
  delay(50);
  previous = reading;
}
