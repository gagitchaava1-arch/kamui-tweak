#pragma once

// WE SUPPORT FUN  (4.1.0) SDKGen by @O_N_E_B_I_E_C_E | @onebiecerr 
// Send Message Me For SDKGen Tool  
// Generate on Wed Nov  5 15:05:58 2025
 
namespace SDK
{
//---------------------------------------------------------------------------
//Script Structs
//---------------------------------------------------------------------------

// ScriptStruct TApm.TApmSceneInfo
// 0x0020
struct FTApmSceneInfo
{
	int                                                PerfPriority;                                             // 0x0000(0x0004) (ZeroConstructor, IsPlainOldData)
	int                                                ReportPriority;                                           // 0x0004(0x0004) (ZeroConstructor, IsPlainOldData)
	int                                                ID;                                                       // 0x0008(0x0004) (ZeroConstructor, IsPlainOldData)
	bool                                               IsFinished;                                               // 0x000C(0x0001) (ZeroConstructor, IsPlainOldData)
	unsigned char                                      UnknownData00[0x13];                                      // 0x000D(0x0013) MISSED OFFSET
};

}

