import processing.serial.*;

final int rate = 115200;
final int frameX = 30;
final int frameY = 30;
final int frameLen = frameX * frameY;
final float sz = 20;


Serial port; // declare serial port
byte[] FrameBuffer = new byte[900];

// end of frame indicator
int lf = 10;

void setup()
{
  size( 600, 600 ); 

  initSerial();
  background(245);
  frameRate(30);
  noStroke();
  noSmooth();

}



void draw()
{ 
  // check if whole frame recieved and update display
  if(FrameBuffer.length == 901){
  updateFrame(FrameBuffer);
  //save("frame.jpg");
  }
}

void serialEvent(Serial port){ 
  FrameBuffer = port.readBytes();
}

void updateFrame(byte[] data){
  int k = 0;
  for(int i = 0; i<frameX; i++){
    for(int j = 0; j<frameY; j++){
      fill((data[k] & 0x7F)*2); // remove MSB and scale by 2 to get in ture greyscale
      //fill(data[k]);
      rect(sz*i, sz*j, sz, sz);
      k ++;
    }
  }
  }


void initSerial()
{
  //String portName = Serial.list()[0]; 
  String portName = "COM3";
  port = new Serial(this, portName, rate);
  println("Using " + portName + " as serial device.");
  port.bufferUntil(lf);
}