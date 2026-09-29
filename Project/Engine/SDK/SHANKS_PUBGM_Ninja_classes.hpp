#pragma once

// WE SUPPORT FUN  (4.1.0) SDKGen by @O_N_E_B_I_E_C_E | @onebiecerr 
// Send Message Me For SDKGen Tool  
// Generate on Wed Nov  5 15:05:57 2025
 
namespace SDK
{
//---------------------------------------------------------------------------
//Classes
//---------------------------------------------------------------------------

// Class Ninja.BattleFieldCircle
// 0x00A8 (0x05C0 - 0x0518)
class ABattleFieldCircle : public ALuaActor
{
public:
	unsigned char                                      UnknownData00[0x20];                                      // 0x0518(0x0020) MISSED OFFSET
	float                                              CircleInterval;                                           // 0x0538(0x0004) (Edit, BlueprintVisible, ZeroConstructor, IsPlainOldData)
	float                                              CurRadius;                                                // 0x053C(0x0004) (ZeroConstructor, IsPlainOldData)
	struct FName                                       OnlyCheckPlayerTag;                                       // 0x0540(0x0008) (Edit, BlueprintVisible, ZeroConstructor, IsPlainOldData)
	struct FString                                     LuaEventType;                                             // 0x0548(0x0010) (Edit, BlueprintVisible, ZeroConstructor)
	struct FString                                     LuaEventID;                                               // 0x0558(0x0010) (Edit, BlueprintVisible, ZeroConstructor)
	TMap<uint32_t, bool>                               PlayerKeyCache;                                           // 0x0568(0x0050) (ZeroConstructor)
	unsigned char                                      UnknownData01[0x8];                                       // 0x05B8(0x0008) MISSED OFFSET

	static UClass* StaticClass()
	{
        static UClass *pStaticClass = 0;
        if (!pStaticClass)
            pStaticClass = UObject::FindClass("Class Ninja.BattleFieldCircle");
		return pStaticClass;
	}


	void StartMove(const struct FVector& StartCircle, const struct FVector& EndCircle, float MoveTime);
	void SetCircle(const struct FVector& circle);
	void OnRep_CircleMoveInfo();
	bool IsInBlueCircle(class AActor* uActor);
	void InitCircle(const struct FVector& InitCircle);
	TArray<uint32_t> GetAllPlayerInCircle();
	void CircleMove();
	void CheckInCircle();
};


}

