#pragma once

// WE SUPPORT FUN  (4.1.0) SDKGen by @O_N_E_B_I_E_C_E | @onebiecerr 
// Send Message Me For SDKGen Tool  
// Generate on Wed Nov  5 15:05:57 2025
 
namespace SDK
{
//---------------------------------------------------------------------------
//Classes
//---------------------------------------------------------------------------

// Class CommonGameFeatures.ActorRepControlComponent
// 0x0050 (0x0228 - 0x01D8)
class UActorRepControlComponent : public ULuaActorComponent
{
public:
	TMap<int, struct FRepControlGroupData>             ItemRepBlockingUIDMap;                                    // 0x01D8(0x0050) (ZeroConstructor, Transient)

	static UClass* StaticClass()
	{
        static UClass *pStaticClass = 0;
        if (!pStaticClass)
            pStaticClass = UObject::FindClass("Class CommonGameFeatures.ActorRepControlComponent");
		return pStaticClass;
	}


	void ToggleGroupedRepControlByUID(int64_t UID, int ControlMark, int RepControlGroup);
	bool ShouldBlockRepByUID(int64_t UID, int RepControlGroup);
	bool GetControlGroupData(int RepControlGroup, struct FRepControlGroupData* OutData);
};


// Class CommonGameFeatures.RepControlActorBase
// 0x0008 (0x0520 - 0x0518)
class ARepControlActorBase : public ALuaActor
{
public:
	class UActorRepControlComponent*                   CachedBlockingComp;                                       // 0x0518(0x0008) (ExportObject, ZeroConstructor, InstancedReference, IsPlainOldData)

	static UClass* StaticClass()
	{
        static UClass *pStaticClass = 0;
        if (!pStaticClass)
            pStaticClass = UObject::FindClass("Class CommonGameFeatures.RepControlActorBase");
		return pStaticClass;
	}


	bool IsNetRelevantForCustomCheck(class AActor* RealViewer, class AActor* ViewTarget, const struct FVector& SrcLocation);
};


}

