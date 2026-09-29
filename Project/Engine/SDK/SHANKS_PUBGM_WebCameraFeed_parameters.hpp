#pragma once

// WE SUPPORT FUN  (4.1.0) SDKGen by @O_N_E_B_I_E_C_E | @onebiecerr 
// Send Message Me For SDKGen Tool  
// Generate on Wed Nov  5 15:05:58 2025
 
#include "../SDK.hpp"

namespace SDK
{
//---------------------------------------------------------------------------
//Parameters
//---------------------------------------------------------------------------

// Function WebCameraFeed.WebCameraWidget.UnLockScreenOrientation
struct UWebCameraWidget_UnLockScreenOrientation_Params
{
};

// Function WebCameraFeed.WebCameraWidget.SwitchFrontAndBackCamera
struct UWebCameraWidget_SwitchFrontAndBackCamera_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ZeroConstructor, ReturnParm, IsPlainOldData)
};

// Function WebCameraFeed.WebCameraWidget.SetDeviceId
struct UWebCameraWidget_SetDeviceId_Params
{
	int                                                ID;                                                       // (Parm, ZeroConstructor, IsPlainOldData)
};

// Function WebCameraFeed.WebCameraWidget.SetColorAndOpacity
struct UWebCameraWidget_SetColorAndOpacity_Params
{
	struct FLinearColor                                InColorAndOpacity;                                        // (Parm, IsPlainOldData)
};

// Function WebCameraFeed.WebCameraWidget.SaveAsImage
struct UWebCameraWidget_SaveAsImage_Params
{
	struct FString                                     Filename;                                                 // (Parm, ZeroConstructor)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ZeroConstructor, ReturnParm, IsPlainOldData)
};

// Function WebCameraFeed.WebCameraWidget.ReleaseVideoGrabber
struct UWebCameraWidget_ReleaseVideoGrabber_Params
{
};

// Function WebCameraFeed.WebCameraWidget.LockScreenOrientation
struct UWebCameraWidget_LockScreenOrientation_Params
{
};

// Function WebCameraFeed.WebCameraWidget.InitVideoGrabber
struct UWebCameraWidget_InitVideoGrabber_Params
{
};

// Function WebCameraFeed.WebCameraWidget.GetFrontCameraId
struct UWebCameraWidget_GetFrontCameraId_Params
{
	int                                                ReturnValue;                                              // (Parm, OutParm, ZeroConstructor, ReturnParm, IsPlainOldData)
};

// Function WebCameraFeed.WebCameraWidget.GetBackCameraId
struct UWebCameraWidget_GetBackCameraId_Params
{
	int                                                ReturnValue;                                              // (Parm, OutParm, ZeroConstructor, ReturnParm, IsPlainOldData)
};

}

