/*
*  Traffic lights
*  Author: Marko Kaartinen
*  Www: www.markokaartinen.info
*  E-mail: markokaartinen@gmail.com
*
*  Traffic lights with pedestrian lights and sound
*  Piezo buzzer code from http://www.arduino.cc/en/Tutorial/Melody
*/

//speakerpin
int speakerPin = 4;

int tempo = 300;

// assign the car lights 
int carRed = 8; 
int carYellow = 9; 
int carGreen = 10; 

// assign the pedestrian lights 
int pedRed = 5; 
int pedGreen = 6;

int button = 2; // button pin 
int crossTime = 10000; // time allowed to cross 
unsigned long changeTime; // time since button pressed

void setup() { 
  pinMode(carRed, OUTPUT); 
  pinMode(carYellow, OUTPUT); 
  pinMode(carGreen, OUTPUT); 
  pinMode(pedRed, OUTPUT); 
  pinMode(pedGreen, OUTPUT); 
  pinMode(button, INPUT);
  pinMode(speakerPin, OUTPUT);
  
  // turn on the green car and red pedestrian lights
  digitalWrite(carGreen, HIGH); 
  digitalWrite(pedRed, HIGH);
}
void loop() { 
  // Read the state of the button (will return LOW or HIGH)
  int state = digitalRead(button); 
  /* check if button is pressed and it is over 5 seconds since last button press */ 
  if (state == HIGH && (millis() - changeTime) > 5000) {
    //small delay
    delay(2000);
    // Call the function to change the lights
    changeLights();
  }
}

void changeLights() { 
  digitalWrite(carGreen, LOW); // car green off 
  digitalWrite(carYellow, HIGH); // car yellow on 
  delay(2000); // wait 2 seconds
  
  digitalWrite(carYellow, LOW); // car yellow off 
  digitalWrite(carRed, HIGH); // car red on 
  delay(1500); // wait 1.5 second till its safe
  
  digitalWrite(pedRed, LOW); // ped red off 
  digitalWrite(pedGreen, HIGH); // ped green on 
  delay(crossTime); // wait for preset time period
  
  // flash the ped green 
  for (int x=0; x<10; x++) {
    digitalWrite(pedGreen, HIGH); 
    delay(500); 
    digitalWrite(pedGreen, LOW); 
    delay(250);
    
    playNote('c', tempo);
    playNote('a', tempo);
    playNote('c', tempo);
  }

  // turn ped red on
  digitalWrite(pedRed, HIGH);  // ped red on
  delay(500);
  
  digitalWrite(carYellow, HIGH); // car yellow on
  digitalWrite(carRed, LOW); // car red off
  delay(1000); 
  
  digitalWrite(carGreen, HIGH); // car green on
  digitalWrite(carYellow, LOW); // car yellow off
  
  // record the time since last change of lights
  changeTime = millis();
}

void playTone(int tone, int duration) {
  for (long i = 0; i < duration * 1000L; i += tone * 2) {
    digitalWrite(speakerPin, HIGH);
    delayMicroseconds(tone);
    digitalWrite(speakerPin, LOW);
    delayMicroseconds(tone);
  }
}

void playNote(char note, int duration) {
  char names[] = { 'c', 'd', 'e', 'f', 'g', 'a', 'b', 'C' };
  int tones[] = { 1915, 1700, 1519, 1432, 1275, 1136, 1014, 956 };

  // play the tone corresponding to the note name
  for (int i = 0; i < 8; i++) {
    if (names[i] == note) {
      playTone(tones[i], duration);
    }
  }
}

