/*
  adns9800.h 
*/
#ifndef adns9800_h
#define adns9800_h

#include "Arduino.h"
#include <SPI.h>
//#include <adns9800_srom.h>

// define registers
#define PROD_ID 0x00
#define REVISION_ID 0x01
#define MOTION 0x02
#define DELTA_X_L 0x03
#define DELTA_X_H 0x04
#define DELTA_Y_L 0x05
#define DELTA_Y_H 0x06
#define SQUAL 0x07
#define PIXEL_SUM 0x08
#define MAX_PIX 0x09
#define MIN_PIX 0x0a
#define SHUTTER_LOWER 0x0b
#define SHUTTER_UPPER 0x0c
#define FRAME_PERIOD_LOWER 0x0d
#define FRAME_PERIOD_UPPER 0x0e
#define CONFIG_1 0x0f
#define CONFIG_2 0x10
#define FRAME_CAPTURE 0x12
#define SROM_ENABLE 0x13
#define LASER_CTRL0 0x20
#define OBSERVATION 0x24
#define SROM_ID 0x2a
#define CONFIG_IV 0x39
#define POWER_UP_RESET 0x3a
#define SHUTDOWN 0x3b
#define MOTION_BURST 0x50
#define SROM_LOAD_BURST 0x62
#define PIXEL_BURST 0x64

// read/write address
#define WRITE 0x80
#define READ 0x00

struct burst_data {
	byte motion;
	byte observation;
	byte dx_l, dx_h, dy_l, dy_h;
	byte squal;
	byte pixel_sum;
	byte max_pix;
	byte min_pix;
	byte shutter;
	byte frame_period;
	};

class adns9800
{
  public:
    adns9800(int resetPin, int slaveSelectPin);
    int powerUp();
    void srom_upload();
    void writeTo(byte reg, byte value);
    byte readFrom(byte reg, int byteNo);
    void burstRead(struct burst_data *p);
    void captureFrame(byte pdata[][30]);
    int convTwosComp(byte b);
	void initSPI();
	
  private:
	int _resetPin;
	int _slaveSelectPin;

};

#endif