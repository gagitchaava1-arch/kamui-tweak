#pragma once

// WE SUPPORT FUN  (4.1.0) SDKGen by @O_N_E_B_I_E_C_E | @onebiecerr 
// Send Message Me For SDKGen Tool  
// Generate on Wed Nov  5 15:05:52 2025
 
namespace SDK
{
//---------------------------------------------------------------------------
//Classes
//---------------------------------------------------------------------------

// Class GeneralNode.GNNode
// 0x0000 (0x0028 - 0x0028)
class UGNNode : public UObject
{
public:

	static UClass* StaticClass()
	{
        static UClass *pStaticClass = 0;
        if (!pStaticClass)
            pStaticClass = UObject::FindClass("Class GeneralNode.GNNode");
		return pStaticClass;
	}

};


// Class GeneralNode.GNAction
// 0x0020 (0x0048 - 0x0028)
class UGNAction : public UGNNode
{
public:
	EGNRunRole                                         RunRole;                                                  // 0x0028(0x0001) (Edit, ZeroConstructor, IsPlainOldData)
	bool                                               bCanUndo;                                                 // 0x0029(0x0001) (Edit, ZeroConstructor, IsPlainOldData)
	bool                                               bNeedTick;                                                // 0x002A(0x0001) (Edit, ZeroConstructor, IsPlainOldData)
	unsigned char                                      UnknownData00[0x1];                                       // 0x002B(0x0001) MISSED OFFSET
	float                                              TickInterval;                                             // 0x002C(0x0004) (Edit, ZeroConstructor, IsPlainOldData)
	float                                              RunDelay;                                                 // 0x0030(0x0004) (Edit, ZeroConstructor, IsPlainOldData)
	bool                                               bNeedUndo;                                                // 0x0034(0x0001) (Edit, ZeroConstructor, IsPlainOldData)
	unsigned char                                      UnknownData01[0x3];                                       // 0x0035(0x0003) MISSED OFFSET
	float                                              ActionDuration;                                           // 0x0038(0x0004) (Edit, ZeroConstructor, IsPlainOldData)
	bool                                               bTargetOwnerIfNoTarget;                                   // 0x003C(0x0001) (Edit, ZeroConstructor, IsPlainOldData)
	unsigned char                                      UnknownData02[0xB];                                       // 0x003D(0x000B) MISSED OFFSET

	static UClass* StaticClass()
	{
        static UClass *pStaticClass = 0;
        if (!pStaticClass)
            pStaticClass = UObject::FindClass("Class GeneralNode.GNAction");
		return pStaticClass;
	}

};


// Class GeneralNode.GNCondition
// 0x0000 (0x0028 - 0x0028)
class UGNCondition : public UGNNode
{
public:

	static UClass* StaticClass()
	{
        static UClass *pStaticClass = 0;
        if (!pStaticClass)
            pStaticClass = UObject::FindClass("Class GeneralNode.GNCondition");
		return pStaticClass;
	}

};


// Class GeneralNode.GNTargetPicker
// 0x0000 (0x0028 - 0x0028)
class UGNTargetPicker : public UGNNode
{
public:

	static UClass* StaticClass()
	{
        static UClass *pStaticClass = 0;
        if (!pStaticClass)
            pStaticClass = UObject::FindClass("Class GeneralNode.GNTargetPicker");
		return pStaticClass;
	}

};


// Class GeneralNode.GNSharedDelegate
// 0x0018 (0x0040 - 0x0028)
class UGNSharedDelegate : public UObject
{
public:
	class UObject*                                     FunctionOuter;                                            // 0x0028(0x0008) (ZeroConstructor, IsPlainOldData)
	struct FName                                       FunctionName;                                             // 0x0030(0x0008) (ZeroConstructor, IsPlainOldData)
	unsigned char                                      UnknownData00[0x8];                                       // 0x0038(0x0008) MISSED OFFSET

	static UClass* StaticClass()
	{
        static UClass *pStaticClass = 0;
        if (!pStaticClass)
            pStaticClass = UObject::FindClass("Class GeneralNode.GNSharedDelegate");
		return pStaticClass;
	}


	void EventTrigger();
};


// Class GeneralNode.GNSubsystem
// 0x0190 (0x01C0 - 0x0030)
class UGNSubsystem : public UWorldSubsystem
{
public:
	TMap<class UGNNode*, class UGNNode*>               InstancedNodes;                                           // 0x0030(0x0050) (ZeroConstructor)
	TMap<struct FGNUniqueInstancedNodeKey, class UGNNode*> UniqueInstancedNodes;                                     // 0x0080(0x0050) (ZeroConstructor)
	TMap<int, struct FGNActionInstance>                ActionInstances;                                          // 0x00D0(0x0050) (ZeroConstructor)
	TMap<struct FGNSharedDelegateWrap, class UGNSharedDelegate*> DelegateMap;                                              // 0x0120(0x0050) (ZeroConstructor)
	TMap<struct FGNMultiSharedDelegateWrap, class UGNSharedDelegate*> MultiDelegateMap;                                         // 0x0170(0x0050) (ZeroConstructor)

	static UClass* StaticClass()
	{
        static UClass *pStaticClass = 0;
        if (!pStaticClass)
            pStaticClass = UObject::FindClass("Class GeneralNode.GNSubsystem");
		return pStaticClass;
	}

};


// Class GeneralNode.GNTargetFilter
// 0x0000 (0x0028 - 0x0028)
class UGNTargetFilter : public UGNNode
{
public:

	static UClass* StaticClass()
	{
        static UClass *pStaticClass = 0;
        if (!pStaticClass)
            pStaticClass = UObject::FindClass("Class GeneralNode.GNTargetFilter");
		return pStaticClass;
	}

};


}

