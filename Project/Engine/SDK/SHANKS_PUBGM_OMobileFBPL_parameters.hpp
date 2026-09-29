#pragma once

// WE SUPPORT FUN  (4.1.0) SDKGen by @O_N_E_B_I_E_C_E | @onebiecerr 
// Send Message Me For SDKGen Tool  
// Generate on Wed Nov  5 15:05:55 2025
 
#include "../SDK.hpp"

namespace SDK
{
//---------------------------------------------------------------------------
//Parameters
//---------------------------------------------------------------------------

// Function OMobileFBPL.OMobileFBPL.IsRunningOnBattery
struct UOMobileFBPL_IsRunningOnBattery_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ZeroConstructor, ReturnParm, IsPlainOldData)
};

// Function OMobileFBPL.OMobileFBPL.IsBatteryStateCharging
struct UOMobileFBPL_IsBatteryStateCharging_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ZeroConstructor, ReturnParm, IsPlainOldData)
};

// Function OMobileFBPL.OMobileFBPL.GetVolumeState
struct UOMobileFBPL_GetVolumeState_Params
{
	int                                                ReturnValue;                                              // (Parm, OutParm, ZeroConstructor, ReturnParm, IsPlainOldData)
};

// Function OMobileFBPL.OMobileFBPL.GetDeviceName
struct UOMobileFBPL_GetDeviceName_Params
{
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ZeroConstructor, ReturnParm)
};

// Function OMobileFBPL.OMobileFBPL.GetBatteryTemperature
struct UOMobileFBPL_GetBatteryTemperature_Params
{
	float                                              ReturnValue;                                              // (Parm, OutParm, ZeroConstructor, ReturnParm, IsPlainOldData)
};

// Function OMobileFBPL.OMobileFBPL.GetBatteryLevel
struct UOMobileFBPL_GetBatteryLevel_Params
{
	int                                                ReturnValue;                                              // (Parm, OutParm, ZeroConstructor, ReturnParm, IsPlainOldData)
};

// Function OMobileFBPL.OMobileFBPL.AreHeadphonesPluggedIn
struct UOMobileFBPL_AreHeadphonesPluggedIn_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ZeroConstructor, ReturnParm, IsPlainOldData)
};

}

