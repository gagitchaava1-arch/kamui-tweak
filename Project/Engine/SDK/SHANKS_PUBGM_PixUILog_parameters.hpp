#pragma once

// WE SUPPORT FUN  (4.1.0) SDKGen by @O_N_E_B_I_E_C_E | @onebiecerr 
// Send Message Me For SDKGen Tool  
// Generate on Wed Nov  5 15:05:57 2025
 
#include "../SDK.hpp"

namespace SDK
{
//---------------------------------------------------------------------------
//Parameters
//---------------------------------------------------------------------------

// Function PixUILog.PxLogMgr.PxLogToggleSwitchLevel
struct UPxLogMgr_PxLogToggleSwitchLevel_Params
{
	EPxLogLevels                                       eLogLevel;                                                // (ConstParm, Parm, ZeroConstructor, IsPlainOldData)
	bool                                               beOpen;                                                   // (ConstParm, Parm, ZeroConstructor, IsPlainOldData)
};

// Function PixUILog.PxLogMgr.PxLogToggleSwitchGroup
struct UPxLogMgr_PxLogToggleSwitchGroup_Params
{
	EPxLogGroups                                       eLogGroup;                                                // (ConstParm, Parm, ZeroConstructor, IsPlainOldData)
	bool                                               beOpen;                                                   // (ConstParm, Parm, ZeroConstructor, IsPlainOldData)
};

// Function PixUILog.PxLogMgr.PxLogToggleForceLocalOutPut
struct UPxLogMgr_PxLogToggleForceLocalOutPut_Params
{
	bool                                               beOpen;                                                   // (ConstParm, Parm, ZeroConstructor, IsPlainOldData)
};

// Function PixUILog.PxLogMgr.PxLogEnable
struct UPxLogMgr_PxLogEnable_Params
{
	bool                                               beEnable;                                                 // (ConstParm, Parm, ZeroConstructor, IsPlainOldData)
};

// Function PixUILog.PxLogMgr.Get
struct UPxLogMgr_Get_Params
{
	class UPxLogMgr*                                   ReturnValue;                                              // (Parm, OutParm, ZeroConstructor, ReturnParm, IsPlainOldData)
};

// Function PixUILog.PxLogMgr.DispatchLog
struct UPxLogMgr_DispatchLog_Params
{
	EPxLogGroups                                       eLogGroup;                                                // (ConstParm, Parm, ZeroConstructor, IsPlainOldData)
	EPxLogLevels                                       eLogLevel;                                                // (ConstParm, Parm, ZeroConstructor, IsPlainOldData)
	struct FString                                     strLogContent;                                            // (Parm, ZeroConstructor)
};

}

