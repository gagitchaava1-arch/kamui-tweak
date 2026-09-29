#pragma once

// WE SUPPORT FUN  (4.1.0) SDKGen by @O_N_E_B_I_E_C_E | @onebiecerr 
// Send Message Me For SDKGen Tool  
// Generate on Wed Nov  5 15:06:06 2025
 
namespace SDK
{
//---------------------------------------------------------------------------
//Classes
//---------------------------------------------------------------------------

// WidgetBlueprintGeneratedClass GlobalLuaWidget.GlobalLuaWidget_C
// 0x0000 (0x02C8 - 0x02C8)
class UGlobalLuaWidget_C : public ULuaUserWidget
{
public:

	static UClass* StaticClass()
	{
        static UClass *pStaticClass = 0;
        if (!pStaticClass)
            pStaticClass = UObject::FindClass("WidgetBlueprintGeneratedClass GlobalLuaWidget.GlobalLuaWidget_C");
		return pStaticClass;
	}


	void GetNewLevelTaskData(const struct FString& TaskId, bool* Has, struct FBP_STRUCT_NewLevelTask_type* BP_STRUCT_NewLevelTask_type);
};


}

