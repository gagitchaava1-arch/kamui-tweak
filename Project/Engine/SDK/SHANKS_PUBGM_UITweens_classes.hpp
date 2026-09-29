#pragma once

// WE SUPPORT FUN  (4.1.0) SDKGen by @O_N_E_B_I_E_C_E | @onebiecerr 
// Send Message Me For SDKGen Tool  
// Generate on Wed Nov  5 15:05:58 2025
 
namespace SDK
{
//---------------------------------------------------------------------------
//Classes
//---------------------------------------------------------------------------

// Class UITweens.TweenManager
// 0x0028 (0x0050 - 0x0028)
class UTweenManager : public UObject
{
public:
	unsigned char                                      UnknownData00[0x28];                                      // 0x0028(0x0028) MISSED OFFSET

	static UClass* StaticClass()
	{
        static UClass *pStaticClass = 0;
        if (!pStaticClass)
            pStaticClass = UObject::FindClass("Class UITweens.TweenManager");
		return pStaticClass;
	}


	void TweenScale(class UWidget* Widget, const struct FVector2D& from, const struct FVector2D& to, float Timespan, int Type);
	void TweenPosition(class UWidget* Widget, const struct FVector2D& from, const struct FVector2D& to, float Timespan, int Type);
	void TweenAlpha(class UWidget* Widget, float from, float to, float Timespan, int Type);
	void Tick(float DeltaTime);
};


}

