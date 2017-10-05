#include <adns9800.h>

adns9800 ADNS_9800(2,10);

void setup() {
  Serial.begin(9800);
  ADNS_9800.initSPI();
  ADNS_9800.powerUp();

  pinMode(2,OUTPUT);
  digitalWrite(2,HIGH);

}


void loop() {  
  
}
