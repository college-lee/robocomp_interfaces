//******************************************************************
// 
//  Generated by RoboCompDSL
//  
//  File name: JoyStick.ice
//  Source: JoyStick.idsl
//  
//****************************************************************** 
#ifndef ROBOCOMPJOYSTICK_ICE
#define ROBOCOMPJOYSTICK_ICE
module RoboCompJoyStick
{
	sequence <byte> JoyStickBufferedData;
	interface JoyStick
	{
		idempotent void readJoyStickBufferedData (out JoyStickBufferedData gbd);
		idempotent void writeJoyStickBufferedData (JoyStickBufferedData gbd);
	};
};

#endif
