// WE SUPPORT FUN  (4.1.0) SDKGen by @O_N_E_B_I_E_C_E | @onebiecerr 
// Send Message Me For SDKGen Tool  
// Generate on Wed Nov  5 15:06:07 2025
 
#include "../SDK.hpp"

namespace SDK
{
//---------------------------------------------------------------------------
//Functions
//---------------------------------------------------------------------------

// Function SettingConfig.SettingConfig_C.ConditionSetFireGyroData
// (Public, BlueprintCallable, BlueprintEvent)

void USettingConfig_C::ConditionSetFireGyroData()
{
	static UFunction *pFunc = 0;
	if (!pFunc)
		pFunc  = UObject::FindObject<UFunction>("Function SettingConfig.SettingConfig_C.ConditionSetFireGyroData");

	USettingConfig_C_ConditionSetFireGyroData_Params params;

	auto flags = pFunc->FunctionFlags;

	UObject *currentObj = (UObject *) this;
	currentObj->ProcessEvent(pFunc, &params);

	pFunc->FunctionFlags = flags;
}


// Function SettingConfig.SettingConfig_C.Init
// (Public, BlueprintCallable, BlueprintEvent)

void USettingConfig_C::Init()
{
	static UFunction *pFunc = 0;
	if (!pFunc)
		pFunc  = UObject::FindObject<UFunction>("Function SettingConfig.SettingConfig_C.Init");

	USettingConfig_C_Init_Params params;

	auto flags = pFunc->FunctionFlags;

	UObject *currentObj = (UObject *) this;
	currentObj->ProcessEvent(pFunc, &params);

	pFunc->FunctionFlags = flags;
}


}

