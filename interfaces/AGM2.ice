#ifndef ROBOCOMPAGM2_ICE
#define ROBOCOMPAGM2_ICE

module RoboCompAGM2
{

	struct StringPair
	{
		string first;
		string second;
	};

	sequence<StringPair> StringDictionary;

	struct Node
	{
		StringDictionary attributes;
		int nodeIdentifier;
		string nodeType;
	};

	sequence <Node> NodeSequence;

	struct Edge
	{
		StringDictionary attributes;
		int a;
		int b;
		string edgeType;
	};

	sequence <Edge> EdgeSequence;

	struct World
	{
		NodeSequence nodes;
		EdgeSequence edges;
		int version;
	};

	struct Action
	{
		string name;
		StringDictionary symbols;
	};

	sequence <Action> ActionSequence;

	struct Plan
	{
		ActionSequence actions;
		float cost;
	};

	struct StructuralChangeStruct
	{
		World model;
		Plan changes;
		string sender;
		string log;
	};

	// Agents' API
	interface AGMDSRService
	{
		void structuralChangeProposal(StructuralChangeStruct proposal, int ret); // Ok, Locked, OldModel, InvalidChange
		void symbolUpdate(Node n, int ret);
		void symbolsUpdate(NodeSequence ns, int ret);
		void edgeUpdate(Edge e, int ret);
		void edgesUpdate(EdgeSequence es, int ret);
		void getModel(bool unused, World ret);
		void getNode(int identifier, Node ret);
		void getEdge(Edge input, Edge ret);
	};

	interface AGMDSRTopic
	{
		void structuralChange(World w);
		void symbolsUpdated(NodeSequence modification);
		void edgesUpdated(EdgeSequence modification);
	};



	interface AGMExecutiveService
	{
		void setMission(string path, int ret);
		void getPlan(bool unused, Plan currentPlan);
		void getTarget(bool unused, string target);
		void broadcastModel(bool unusedI, bool unusedR);
		void broadcastPlan(bool unusedI, bool unusedR);
	};


	interface AGMExecutiveTopic
	{
		void planUpdate(Plan newPlan);
	};

};

#endif
