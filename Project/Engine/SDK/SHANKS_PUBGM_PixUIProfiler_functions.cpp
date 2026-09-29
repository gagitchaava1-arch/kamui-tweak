// WE SUPPORT FUN  (4.1.0) SDKGen by @O_N_E_B_I_E_C_E | @onebiecerr 
// Send Message Me For SDKGen Tool  
// Generate on Wed Nov  5 15:05:57 2025
 
#include "../SDK.hpp"

namespace SDK
{
//---------------------------------------------------------------------------
//Functions
//---------------------------------------------------------------------------

// Function PixUIProfiler.PxProfilerMgr.StartProfiler
// (Final, Native, Static, Public, BlueprintCallable)

void UPxProfilerMgr::StartProfiler()
{
	static UFunction *pFunc = 0;
	if (!pFunc)
		pFunc  = UObject::FindObject<UFunction>("Function PixUIProfiler.PxProfilerMgr.StartProfiler");

	UPxProfilerMgr_StartProfiler_Params params;

	auto flags = pFunc->FunctionFlags;
	pFunc->FunctionFlags |= 0x400;

	static auto defaultObj = StaticClass()->GetDefaultObject();
	defaultObj->ProcessEvent(pFunc, &params);

	pFunc->FunctionFlags = flags;
}


// Function PixUIProfiler.PxProfilerMgr.PxProfilerCapabilitySwitch
// (Final, Native, Static, Public, BlueprintCallable)
// Parameters:
// EPxProfilerCapability          EPxProfilerCapability          (ConstParm, Parm, ZeroConstructor, IsPlainOldData)
// bool                           bOpen                          (ConstParm, Parm, ZeroConstructor, IsPlainOldData)

void UPxProfilerMgr::PxProfilerCapabilitySwitch(EPxProfilerCapability EPxProfilerCapability, bool bOpen)
{
	static UFunction *pFunc = 0;
	if (!pFunc)
		pFunc  = UObject::FindObject<UFunction>("Function PixUIProfiler.PxProfilerMgr.PxProfilerCapabilitySwitch");

	UPxProfilerMgr_PxProfilerCapabilitySwitch_Params params;
	params.EPxProfilerCapability = EPxProfilerCapability;
	params.bOpen = bOpen;

	auto flags = pFunc->FunctionFlags;
	pFunc->FunctionFlags |= 0x400;

	static auto defaultObj = StaticClass()->GetDefaultObject();
	defaultObj->ProcessEvent(pFunc, &params);

	pFunc->FunctionFlags = flags;
}


// Function PixUIProfiler.PxProfilerMgr.Print
// (Final, Native, Static, Public, BlueprintCallable)

void UPxProfilerMgr::Print()
{
	static UFunction *pFunc = 0;
	if (!pFunc)
		pFunc  = UObject::FindObject<UFunction>("Function PixUIProfiler.PxProfilerMgr.Print");

	UPxProfilerMgr_Print_Params params;

	auto flags = pFunc->FunctionFlags;
	pFunc->FunctionFlags |= 0x400;

	static auto defaultObj = StaticClass()->GetDefaultObject();
	defaultObj->ProcessEvent(pFunc, &params);

	pFunc->FunctionFlags = flags;
}


// Function PixUIProfiler.PxProfilerMgr.GetPxProfilerCapability
// (Final, Native, Static, Public, BlueprintCallable)
// Parameters:
// EPxProfilerCapability          EPxProfilerCapability          (ConstParm, Parm, ZeroConstructor, IsPlainOldData)
// bool                           ReturnValue                    (Parm, OutParm, ZeroConstructor, ReturnParm, IsPlainOldData)

bool UPxProfilerMgr::GetPxProfilerCapability(EPxProfilerCapability EPxProfilerCapability)
{
	static UFunction *pFunc = 0;
	if (!pFunc)
		pFunc  = UObject::FindObject<UFunction>("Function PixUIProfiler.PxProfilerMgr.GetPxProfilerCapability");

	UPxProfilerMgr_GetPxProfilerCapability_Params params;
	params.EPxProfilerCapability = EPxProfilerCapability;

	auto flags = pFunc->FunctionFlags;
	pFunc->FunctionFlags |= 0x400;

	static auto defaultObj = StaticClass()->GetDefaultObject();
	defaultObj->ProcessEvent(pFunc, &params);

	pFunc->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function PixUIProfiler.PxProfilerMgr.EndProfiler
// (Final, Native, Static, Public, BlueprintCallable)

void UPxProfilerMgr::EndProfiler()
{
	static UFunction *pFunc = 0;
	if (!pFunc)
		pFunc  = UObject::FindObject<UFunction>("Function PixUIProfiler.PxProfilerMgr.EndProfiler");

	UPxProfilerMgr_EndProfiler_Params params;

	auto flags = pFunc->FunctionFlags;
	pFunc->FunctionFlags |= 0x400;

	static auto defaultObj = StaticClass()->GetDefaultObject();
	defaultObj->ProcessEvent(pFunc, &params);

	pFunc->FunctionFlags = flags;
}


// Function PixUIProfiler.PxProfilerMgr.Check
// (Final, Native, Static, Public, BlueprintCallable)

void UPxProfilerMgr::Check()
{
	static UFunction *pFunc = 0;
	if (!pFunc)
		pFunc  = UObject::FindObject<UFunction>("Function PixUIProfiler.PxProfilerMgr.Check");

	UPxProfilerMgr_Check_Params params;

	auto flags = pFunc->FunctionFlags;
	pFunc->FunctionFlags |= 0x400;

	static auto defaultObj = StaticClass()->GetDefaultObject();
	defaultObj->ProcessEvent(pFunc, &params);

	pFunc->FunctionFlags = flags;
}


}

