//******************************************************************
// 
//  Generated by IDSL to IDL Translator
//  
//  File name: BodyEchord.idl
//  Source: BodyEchord.idsl
//  
//******************************************************************   
#ifndef ROBOCOMPBODYECHORD_ICE
#define ROBOCOMPBODYECHORD_ICE

module RoboCompBodyEchord{
	enum JointType{SpineBase, SpineMid, Neck, Head, ShoulderLeft, ElbowLeft, WristLeft, HandLeft, ShoulderRight, ElbowRight, WristRight, HandRight, HipLeft, KneeLeft, AnkleLeft, FootLeft, HipRight, KneeRight, AnkleRight, FootRight, SpineShoulder, HandTipLeft, ThumbLeft, HandTipRight, ThumbRight};
	enum stateType{NoTracking, Tracking};
	enum JointTrackingState{NotTracked, Inferred, Tracked};
	["cpp:comparable"]
	struct SkeletonPoint{
		float X;
					float Y;
					float Z;
				};
	["cpp:comparable"]
	struct DepthImagePoint{
		int X;
		int Y;
		int Depth;
	};
	["cpp:comparable"]
	struct ColorImagePoint{
		int X;
		int Y;
		byte R;
		byte G;
		byte B;
	};
	["cpp:comparable"]
	struct Joint{
		JointTrackingState state;
		SkeletonPoint Position;
	};
	dictionary<JointType, Joint>JointList;
	["cpp:comparable"]
	struct TPerson{
		JointList joints;
		SkeletonPoint Position;
		int TrackingId;
		bool trackedState;
	};
	dictionary<int, TPerson>PersonList;

	interface MSKBodyEvent{
		void  newMSKBodyEvent(PersonList people, long timestamp);
	};
};
  
#endif