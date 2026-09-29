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

// Function PandoraPickerPlugin.BP_PandoraPickerLibraryLibrary.GetInstance
struct UBP_PandoraPickerLibraryLibrary_GetInstance_Params
{
	class UBP_PandoraPickerLibraryLibrary*             ReturnValue;                                              // (Parm, OutParm, ZeroConstructor, ReturnParm, IsPlainOldData)
};

// Function PandoraPickerPlugin.BP_PandoraPickerLibraryLibrary.BP_SetVideoExportQuality
struct UBP_PandoraPickerLibraryLibrary_BP_SetVideoExportQuality_Params
{
	int                                                Quality;                                                  // (Parm, ZeroConstructor, IsPlainOldData)
};

// Function PandoraPickerPlugin.BP_PandoraPickerLibraryLibrary.BP_PandoraPickerLoadImageTest
struct UBP_PandoraPickerLibraryLibrary_BP_PandoraPickerLoadImageTest_Params
{
	struct FString                                     fImagePath;                                               // (Parm, ZeroConstructor)
	struct FString                                     fOrgImagePath;                                            // (Parm, ZeroConstructor)
	class UTexture2D*                                  orgTex2D;                                                 // (Parm, OutParm, ZeroConstructor, IsPlainOldData)
	class UTexture2D*                                  ReturnValue;                                              // (Parm, OutParm, ZeroConstructor, ReturnParm, IsPlainOldData)
};

// Function PandoraPickerPlugin.BP_PandoraPickerLibraryLibrary.BP_PandoraPickerInit
struct UBP_PandoraPickerLibraryLibrary_BP_PandoraPickerInit_Params
{
	int                                                ReturnValue;                                              // (Parm, OutParm, ZeroConstructor, ReturnParm, IsPlainOldData)
};

// Function PandoraPickerPlugin.BP_PandoraPickerLibraryLibrary.BP_PandoraPickerGetSavedPath
struct UBP_PandoraPickerLibraryLibrary_BP_PandoraPickerGetSavedPath_Params
{
	struct FString                                     strSavePath;                                              // (Parm, OutParm, ZeroConstructor)
};

// Function PandoraPickerPlugin.BP_PandoraPickerLibraryLibrary.BP_OpenImageLibraryWithOrg
struct UBP_PandoraPickerLibraryLibrary_BP_OpenImageLibraryWithOrg_Params
{
	int                                                Width;                                                    // (Parm, ZeroConstructor, IsPlainOldData)
	int                                                Height;                                                   // (Parm, ZeroConstructor, IsPlainOldData)
	struct FString                                     SecretKey;                                                // (Parm, ZeroConstructor)
	struct FString                                     savedPath;                                                // (Parm, ZeroConstructor)
};

// Function PandoraPickerPlugin.BP_PandoraPickerLibraryLibrary.BP_OpenImageLibraryVideo
struct UBP_PandoraPickerLibraryLibrary_BP_OpenImageLibraryVideo_Params
{
	struct FString                                     SecretKey;                                                // (Parm, ZeroConstructor)
};

// Function PandoraPickerPlugin.BP_PandoraPickerLibraryLibrary.BP_OpenImageLibraryNoCut
struct UBP_PandoraPickerLibraryLibrary_BP_OpenImageLibraryNoCut_Params
{
	int                                                Width;                                                    // (Parm, ZeroConstructor, IsPlainOldData)
	int                                                Height;                                                   // (Parm, ZeroConstructor, IsPlainOldData)
	struct FString                                     SecretKey;                                                // (Parm, ZeroConstructor)
	struct FString                                     savedPath;                                                // (Parm, ZeroConstructor)
};

// Function PandoraPickerPlugin.BP_PandoraPickerLibraryLibrary.BP_OpenImageLibrary
struct UBP_PandoraPickerLibraryLibrary_BP_OpenImageLibrary_Params
{
	int                                                Width;                                                    // (Parm, ZeroConstructor, IsPlainOldData)
	int                                                Height;                                                   // (Parm, ZeroConstructor, IsPlainOldData)
	struct FString                                     SecretKey;                                                // (Parm, ZeroConstructor)
	struct FString                                     savedPath;                                                // (Parm, ZeroConstructor)
};

}

