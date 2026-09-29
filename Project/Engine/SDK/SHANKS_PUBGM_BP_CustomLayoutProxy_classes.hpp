#pragma once

// WE SUPPORT FUN  (4.1.0) SDKGen by @O_N_E_B_I_E_C_E | @onebiecerr 
// Send Message Me For SDKGen Tool  
// Generate on Wed Nov  5 15:06:04 2025
 
namespace SDK
{
//---------------------------------------------------------------------------
//Classes
//---------------------------------------------------------------------------

// BlueprintGeneratedClass BP_CustomLayoutProxy.BP_CustomLayoutProxy_C
// 0x0000 (0x01C0 - 0x01C0)
class UBP_CustomLayoutProxy_C : public UCustomLayoutProxy
{
public:

	static UClass* StaticClass()
	{
        static UClass *pStaticClass = 0;
        if (!pStaticClass)
            pStaticClass = UObject::FindClass("BlueprintGeneratedClass BP_CustomLayoutProxy.BP_CustomLayoutProxy_C");
		return pStaticClass;
	}


	void AddLayoutDetailCache(bool Invalid, struct FBP_STRUCT_UIElemLayoutDetail* BPStruct);
};


}

