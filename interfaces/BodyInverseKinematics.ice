//******************************************************************
// 
//  Generated by IDSL to IDL Translator
//  
//  File name: BodyInverseKinematics.idl
//  Source: BodyInverseKinematics.idsl
//  
//******************************************************************   
#ifndef ROBOCOMPBODYINVERSEKINEMATICS_ICE
#define ROBOCOMPBODYINVERSEKINEMATICS_ICE

module RoboCompBodyInverseKinematics{
	exception BIKException{string text;};
	["cpp:comparable"]
	struct Pose6D{
		float x;
					float y;
					float z;
					float rx;
					float ry;
					float rz;
				};
	["cpp:comparable"]
	struct WeightVector{
		float x;
					float y;
					float z;
					float rx;
					float ry;
					float rz;
				};
	["cpp:comparable"]
	struct Axis{
		float x;
					float y;
					float z;
				};
	["cpp:comparable"]
	struct TargetState{
		int elapsedTime;
		int estimatedEndTime;
		bool finish;
	};

	interface BodyInverseKinematics{
		void  setTargetPose6D(string bodyPart, Pose6D target, WeightVector weights, float radius)throws BIKException;
		void  pointAxisTowardsTarget(string bodyPart, Pose6D target, Axis ax, bool axisConstraint, float axisAngleConstraint)throws BIKException;
		void  advanceAlongAxis(string bodyPart, Axis ax, float dist)throws BIKException;
		void  setFingers(float d)throws BIKException;
		void  goHome(string part)throws BIKException;
		void  setRobot(int type)throws BIKException;
		TargetState getState(string part);
	};
};
  
#endif