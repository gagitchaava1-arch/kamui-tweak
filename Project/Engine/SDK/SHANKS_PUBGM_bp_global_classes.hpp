#pragma once

// WE SUPPORT FUN  (4.1.0) SDKGen by @O_N_E_B_I_E_C_E | @onebiecerr 
// Send Message Me For SDKGen Tool  
// Generate on Wed Nov  5 15:06:06 2025
 
namespace SDK
{
//---------------------------------------------------------------------------
//Classes
//---------------------------------------------------------------------------

// ScriptBlueprintGeneratedClass bp_global.bp_global_C
// 0x0078 (0x0538 - 0x04C0)
class Abp_global_C : public ALuaClassObj
{
public:
	class UScriptContextComponent*                     Generated_ScriptContext;                                  // 0x04C0(0x0008) (BlueprintVisible, ZeroConstructor, InstancedReference, IsPlainOldData)
	int                                                GLOBAL_USE_ITEM;                                          // 0x04C8(0x0004) (Edit, BlueprintVisible, ZeroConstructor, IsPlainOldData)
	struct FBP_STRUCT_NATION_SWITCH                    BP_STRUCT_NATION_SWITCH;                                  // 0x04CC(0x0004) (Edit, BlueprintVisible)
	int                                                BP_StartUpType;                                           // 0x04D0(0x0004) (Edit, BlueprintVisible, ZeroConstructor, IsPlainOldData)
	int                                                BP_Share_Platform;                                        // 0x04D4(0x0004) (Edit, BlueprintVisible, ZeroConstructor, IsPlainOldData)
	bool                                               BP_REVIEW_SVR_ENABLE_GM;                                  // 0x04D8(0x0001) (Edit, BlueprintVisible, ZeroConstructor, IsPlainOldData)
	unsigned char                                      UnknownData00[0x3];                                       // 0x04D9(0x0003) MISSED OFFSET
	int                                                BP_Platform;                                              // 0x04DC(0x0004) (Edit, BlueprintVisible, ZeroConstructor, IsPlainOldData)
	bool                                               BP_IsAppleAudit;                                          // 0x04E0(0x0001) (Edit, BlueprintVisible, ZeroConstructor, IsPlainOldData)
	bool                                               BP_IS_EXTERNAL_CHANNEL;                                   // 0x04E1(0x0001) (Edit, BlueprintVisible, ZeroConstructor, IsPlainOldData)
	bool                                               BP_IOS_CHECK;                                             // 0x04E2(0x0001) (Edit, BlueprintVisible, ZeroConstructor, IsPlainOldData)
	unsigned char                                      UnknownData01[0x1];                                       // 0x04E3(0x0001) MISSED OFFSET
	int                                                BP_GlobalSwitchCameraIndex;                               // 0x04E4(0x0004) (Edit, BlueprintVisible, ZeroConstructor, IsPlainOldData)
	int                                                BP_Global_PreviewItemId;                                  // 0x04E8(0x0004) (Edit, BlueprintVisible, ZeroConstructor, IsPlainOldData)
	bool                                               BP_Global_AndroidKey_IsValid;                             // 0x04EC(0x0001) (Edit, BlueprintVisible, ZeroConstructor, IsPlainOldData)
	bool                                               BP_Global_AdvertiseNeedShowtask;                          // 0x04ED(0x0001) (Edit, BlueprintVisible, ZeroConstructor, IsPlainOldData)
	unsigned char                                      UnknownData02[0x2];                                       // 0x04EE(0x0002) MISSED OFFSET
	struct FString                                     BP_GEM_REPORT_SUBEVENT;                                   // 0x04F0(0x0010) (Edit, BlueprintVisible, ZeroConstructor)
	struct FString                                     BP_GEM_REPORT_PARA2;                                      // 0x0500(0x0010) (Edit, BlueprintVisible, ZeroConstructor)
	struct FString                                     BP_GEM_REPORT_PARA1;                                      // 0x0510(0x0010) (Edit, BlueprintVisible, ZeroConstructor)
	bool                                               BP_CHECK_MENU_OPEN_RESULT;                                // 0x0520(0x0001) (Edit, BlueprintVisible, ZeroConstructor, IsPlainOldData)
	unsigned char                                      UnknownData03[0x3];                                       // 0x0521(0x0003) MISSED OFFSET
	int                                                BP_CHECK_MENU_OPEN_ID;                                    // 0x0524(0x0004) (Edit, BlueprintVisible, ZeroConstructor, IsPlainOldData)
	int                                                BP_BA_REASON;                                             // 0x0528(0x0004) (Edit, BlueprintVisible, ZeroConstructor, IsPlainOldData)
	int                                                BP_BA_BUTTON_TYPE;                                        // 0x052C(0x0004) (Edit, BlueprintVisible, ZeroConstructor, IsPlainOldData)
	class USceneComponent*                             DefaultSceneRoot;                                         // 0x0530(0x0008) (BlueprintVisible, ZeroConstructor, IsPlainOldData)

	static UClass* StaticClass()
	{
        static UClass *pStaticClass = 0;
        if (!pStaticClass)
            pStaticClass = UObject::FindClass("ScriptBlueprintGeneratedClass bp_global.bp_global_C");
		return pStaticClass;
	}


	void EventShowPlatWXStartup_NoFetch();
	void EventShowPlatWXStartup();
	void EventShowPlatQQStartup_NoFetch();
	void EventShowPlatQQStartup();
	void EventShowPlatIconTips_NoFetch();
	void EventShowPlatIconTips();
	void EventSetInfo_Push_NoFetch();
	void EventSetInfo_Push();
	void EventSendClickGemReport_NoFetch();
	void EventSendClickGemReport();
	void EventSendBAReport_NoFetch();
	void EventSendBAReport();
	void EventGlobalUseItem_NoFetch();
	void EventGlobalUseItem();
	void EventGlobalCloseItemTips_NoFetch();
	void EventGlobalCloseItemTips();
	void EventFetchNationSwitch_NoFetch();
	void EventFetchNationSwitch();
	void EventFetchInfo_NoFetch();
	void EventFetchInfo();
	void EventComMsgBoxSluaClickUrl_NoFetch();
	void EventComMsgBoxSluaClickUrl();
	void EventClickLobbyEventGemReport_NoFetch();
	void EventClickLobbyEventGemReport();
	void EventCheckIfMenuOpen_NoFetch();
	void EventCheckIfMenuOpen();
	void EventAndroidQuitGame_NoFetch();
	void EventAndroidQuitGame();
	void UserConstructionScript();
};


}

