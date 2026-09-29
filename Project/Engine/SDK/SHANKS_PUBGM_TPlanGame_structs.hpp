#pragma once

// WE SUPPORT FUN  (4.1.0) SDKGen by @O_N_E_B_I_E_C_E | @onebiecerr 
// Send Message Me For SDKGen Tool  
// Generate on Wed Nov  5 15:05:57 2025
 
namespace SDK
{
//---------------------------------------------------------------------------
//Script Structs
//---------------------------------------------------------------------------

// ScriptStruct TPlanGame.SyncRelevantPlayerTask
// 0x0018
struct FSyncRelevantPlayerTask
{
	int                                                TaskId;                                                   // 0x0000(0x0004) (BlueprintVisible, ZeroConstructor, IsPlainOldData)
	unsigned char                                      UnknownData00[0x4];                                       // 0x0004(0x0004) MISSED OFFSET
	TArray<class AActor*>                              TaskTargets;                                              // 0x0008(0x0010) (BlueprintVisible, ZeroConstructor)
};

// ScriptStruct TPlanGame.XTBetrayInfo
// 0x0008
struct FXTBetrayInfo
{
	bool                                               IsInBetray;                                               // 0x0000(0x0001) (BlueprintVisible, ZeroConstructor, IsPlainOldData)
	unsigned char                                      UnknownData00[0x3];                                       // 0x0001(0x0003) MISSED OFFSET
	int                                                BetrayTime;                                               // 0x0004(0x0004) (BlueprintVisible, ZeroConstructor, IsPlainOldData)
};

// ScriptStruct TPlanGame.PreciousItem
// 0x000C
struct FPreciousItem
{
	int                                                TypeSpecificID;                                           // 0x0000(0x0004) (BlueprintVisible, ZeroConstructor, IsPlainOldData)
	int                                                Count;                                                    // 0x0004(0x0004) (BlueprintVisible, ZeroConstructor, IsPlainOldData)
	int                                                SellPrice;                                                // 0x0008(0x0004) (BlueprintVisible, ZeroConstructor, IsPlainOldData)
};

}

