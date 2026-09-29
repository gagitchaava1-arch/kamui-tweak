#pragma once

// WE SUPPORT FUN  (4.1.0) SDKGen by @O_N_E_B_I_E_C_E | @onebiecerr 
// Send Message Me For SDKGen Tool  
// Generate on Wed Nov  5 15:05:58 2025
 
namespace SDK
{
//---------------------------------------------------------------------------
//Classes
//---------------------------------------------------------------------------

// Class PandoraPickerPlugin.BP_PandoraPickerLibraryLibrary
// 0x0020 (0x0048 - 0x0028)
class UBP_PandoraPickerLibraryLibrary : public UBlueprintFunctionLibrary
{
public:
	struct FScriptMulticastDelegate                    m_PickerEventDelegate;                                    // 0x0028(0x0010) (ZeroConstructor, InstancedReference, BlueprintAssignable)
	struct FScriptMulticastDelegate                    m_PickerVideoEventDelegate;                               // 0x0038(0x0010) (ZeroConstructor, InstancedReference, BlueprintAssignable)

	static UClass* StaticClass()
	{
        static UClass *pStaticClass = 0;
        if (!pStaticClass)
            pStaticClass = UObject::FindClass("Class PandoraPickerPlugin.BP_PandoraPickerLibraryLibrary");
		return pStaticClass;
	}


	static class UBP_PandoraPickerLibraryLibrary* GetInstance();
	static void BP_SetVideoExportQuality(int Quality);
	static class UTexture2D* BP_PandoraPickerLoadImageTest(const struct FString& fImagePath, const struct FString& fOrgImagePath, class UTexture2D** orgTex2D);
	static int BP_PandoraPickerInit();
	static void BP_PandoraPickerGetSavedPath(struct FString* strSavePath);
	static void BP_OpenImageLibraryWithOrg(int Width, int Height, const struct FString& SecretKey, const struct FString& savedPath);
	static void BP_OpenImageLibraryVideo(const struct FString& SecretKey);
	static void BP_OpenImageLibraryNoCut(int Width, int Height, const struct FString& SecretKey, const struct FString& savedPath);
	static void BP_OpenImageLibrary(int Width, int Height, const struct FString& SecretKey, const struct FString& savedPath);
};


}

