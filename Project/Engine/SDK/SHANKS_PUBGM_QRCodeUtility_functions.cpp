// WE SUPPORT FUN  (4.1.0) SDKGen by @O_N_E_B_I_E_C_E | @onebiecerr 
// Send Message Me For SDKGen Tool  
// Generate on Wed Nov  5 15:05:56 2025
 
#include "../SDK.hpp"

namespace SDK
{
//---------------------------------------------------------------------------
//Functions
//---------------------------------------------------------------------------

// Function QRCodeUtility.ZXingScanner.Encode
// (Final, Native, Static, Public, BlueprintCallable)
// Parameters:
// struct FString                 Text                           (Parm, ZeroConstructor)
// class UTexture2D*              ReturnValue                    (Parm, OutParm, ZeroConstructor, ReturnParm, IsPlainOldData)

class UTexture2D* UZXingScanner::Encode(const struct FString& Text)
{
	static UFunction *pFunc = 0;
	if (!pFunc)
		pFunc  = UObject::FindObject<UFunction>("Function QRCodeUtility.ZXingScanner.Encode");

	UZXingScanner_Encode_Params params;
	params.Text = Text;

	auto flags = pFunc->FunctionFlags;
	pFunc->FunctionFlags |= 0x400;

	static auto defaultObj = StaticClass()->GetDefaultObject();
	defaultObj->ProcessEvent(pFunc, &params);

	pFunc->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function QRCodeUtility.ZXingScanner.Decode
// (Final, Native, Static, Public, HasOutParms, HasDefaults, BlueprintCallable)
// Parameters:
// class UTexture2D*              Texture                        (Parm, ZeroConstructor, IsPlainOldData)
// struct FZXingScanResult        OutResult                      (Parm, OutParm)
// struct FVector4                InRect                         (ConstParm, Parm, OutParm, ReferenceParm, IsPlainOldData)
// bool                           ReturnValue                    (Parm, OutParm, ZeroConstructor, ReturnParm, IsPlainOldData)

bool UZXingScanner::Decode(class UTexture2D* Texture, const struct FVector4& InRect, struct FZXingScanResult* OutResult)
{
	static UFunction *pFunc = 0;
	if (!pFunc)
		pFunc  = UObject::FindObject<UFunction>("Function QRCodeUtility.ZXingScanner.Decode");

	UZXingScanner_Decode_Params params;
	params.Texture = Texture;
	params.InRect = InRect;

	auto flags = pFunc->FunctionFlags;
	pFunc->FunctionFlags |= 0x400;

	static auto defaultObj = StaticClass()->GetDefaultObject();
	defaultObj->ProcessEvent(pFunc, &params);

	pFunc->FunctionFlags = flags;

	if (OutResult != nullptr)
		*OutResult = params.OutResult;

	return params.ReturnValue;
}


}

