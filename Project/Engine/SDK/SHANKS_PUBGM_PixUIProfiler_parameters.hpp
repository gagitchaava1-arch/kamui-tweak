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

// Function PixUIProfiler.PxProfilerMgr.StartProfiler
struct UPxProfilerMgr_StartProfiler_Params
{
};

// Function PixUIProfiler.PxProfilerMgr.PxProfilerCapabilitySwitch
struct UPxProfilerMgr_PxProfilerCapabilitySwitch_Params
{
	EPxProfilerCapability                              EPxProfilerCapability;                                    // (ConstParm, Parm, ZeroConstructor, IsPlainOldData)
	bool                                               bOpen;                                                    // (ConstParm, Parm, ZeroConstructor, IsPlainOldData)
};

// Function PixUIProfiler.PxProfilerMgr.Print
struct UPxProfilerMgr_Print_Params
{
};

// Function PixUIProfiler.PxProfilerMgr.GetPxProfilerCapability
struct UPxProfilerMgr_GetPxProfilerCapability_Params
{
	EPxProfilerCapability                              EPxProfilerCapability;                                    // (ConstParm, Parm, ZeroConstructor, IsPlainOldData)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ZeroConstructor, ReturnParm, IsPlainOldData)
};

// Function PixUIProfiler.PxProfilerMgr.EndProfiler
struct UPxProfilerMgr_EndProfiler_Params
{
};

// Function PixUIProfiler.PxProfilerMgr.Check
struct UPxProfilerMgr_Check_Params
{
};

}

