// WE SUPPORT FUN  (4.1.0) SDKGen by @O_N_E_B_I_E_C_E | @onebiecerr 
// Send Message Me For SDKGen Tool  
// Generate on Wed Nov  5 15:05:55 2025
 
#include "../SDK.hpp"

namespace SDK
{
//---------------------------------------------------------------------------
//Functions
//---------------------------------------------------------------------------

// Function SceneCaptureWidgetPlugin.SceneCaptureWidget.SetSceneCaptureCameraActor
// (Final, Native, Public, BlueprintCallable)
// Parameters:
// class ASceneCaptureCameraActor* InSceneCaptureCameraActor      (Parm, ZeroConstructor, IsPlainOldData)

void USceneCaptureWidget::SetSceneCaptureCameraActor(class ASceneCaptureCameraActor* InSceneCaptureCameraActor)
{
	static UFunction *pFunc = 0;
	if (!pFunc)
		pFunc  = UObject::FindObject<UFunction>("Function SceneCaptureWidgetPlugin.SceneCaptureWidget.SetSceneCaptureCameraActor");

	USceneCaptureWidget_SetSceneCaptureCameraActor_Params params;
	params.InSceneCaptureCameraActor = InSceneCaptureCameraActor;

	auto flags = pFunc->FunctionFlags;
	pFunc->FunctionFlags |= 0x400;

	UObject *currentObj = (UObject *) this;
	currentObj->ProcessEvent(pFunc, &params);

	pFunc->FunctionFlags = flags;
}


}

