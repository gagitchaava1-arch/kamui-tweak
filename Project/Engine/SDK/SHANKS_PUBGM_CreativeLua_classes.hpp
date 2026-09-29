#pragma once

// WE SUPPORT FUN  (4.1.0) SDKGen by @O_N_E_B_I_E_C_E | @onebiecerr 
// Send Message Me For SDKGen Tool  
// Generate on Wed Nov  5 15:05:56 2025
 
namespace SDK
{
//---------------------------------------------------------------------------
//Classes
//---------------------------------------------------------------------------

// Class CreativeLua.CreativeBridgeLuaVM
// 0x0028 (0x0360 - 0x0338)
class UCreativeBridgeLuaVM : public UCreativeLuaVM
{
public:
	unsigned char                                      UnknownData00[0x8];                                       // 0x0338(0x0008) MISSED OFFSET
	struct FString                                     RegisterUGCVMFunctionHandlerName;                         // 0x0340(0x0010) (ZeroConstructor)
	struct FString                                     UGCVMPostInitFunctionHandlerName;                         // 0x0350(0x0010) (ZeroConstructor)

	static UClass* StaticClass()
	{
        static UClass *pStaticClass = 0;
        if (!pStaticClass)
            pStaticClass = UObject::FindClass("Class CreativeLua.CreativeBridgeLuaVM");
		return pStaticClass;
	}


	void UGCLuaError(int ErrCode);
	void RegisterSluaCallUgcluaEventHandler();
	void PostInit();
};


}

