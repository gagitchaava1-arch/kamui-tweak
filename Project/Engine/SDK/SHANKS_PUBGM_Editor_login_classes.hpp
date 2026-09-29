#pragma once

// WE SUPPORT FUN  (4.1.0) SDKGen by @O_N_E_B_I_E_C_E | @onebiecerr 
// Send Message Me For SDKGen Tool  
// Generate on Wed Nov  5 15:06:07 2025
 
namespace SDK
{
//---------------------------------------------------------------------------
//Classes
//---------------------------------------------------------------------------

// BlueprintGeneratedClass Editor_login.Editor_login_C
// 0x0008 (0x0460 - 0x0458)
class AEditor_login_C : public ALevelScriptActor
{
public:
	struct FPointerToUberGraphFrame                    UberGraphFrame;                                           // 0x0458(0x0008) (Transient, DuplicateTransient)

	static UClass* StaticClass()
	{
        static UClass *pStaticClass = 0;
        if (!pStaticClass)
            pStaticClass = UObject::FindClass("BlueprintGeneratedClass Editor_login.Editor_login_C");
		return pStaticClass;
	}


	void SetFpsByIndex(int idx);
	void InpActEvt_Android_Back_K2Node_InputKeyEvent_12(const struct FKey& Key);
	void InpActEvt_E_K2Node_InputKeyEvent_11(const struct FKey& Key);
	void InpActEvt_BackSpace_K2Node_InputKeyEvent_10(const struct FKey& Key);
	void InpActEvt_B_K2Node_InputKeyEvent_9(const struct FKey& Key);
	void InpActEvt_G_K2Node_InputKeyEvent_8(const struct FKey& Key);
	void InpActEvt_N_K2Node_InputKeyEvent_7(const struct FKey& Key);
	void ReceiveBeginPlay();
	void ExecuteUbergraph_Editor_login(int EntryPoint);
};


}

