#pragma once

// WE SUPPORT FUN  (4.1.0) SDKGen by @O_N_E_B_I_E_C_E | @onebiecerr 
// Send Message Me For SDKGen Tool  
// Generate on Wed Nov  5 15:05:52 2025
 
namespace SDK
{
//---------------------------------------------------------------------------
//Enums
//---------------------------------------------------------------------------

// Enum GeneralNode.EGNActionState
enum class EGNActionState : uint8_t
{
	EGNActionState__Uninitialized  = 0,
	EGNActionState__DelayRun       = 1,
	EGNActionState__Running        = 2,
	EGNActionState__Finished       = 3,
	EGNActionState__EGNActionState_MAX = 4
};


// Enum GeneralNode.EGNRunRole
enum class EGNRunRole : uint8_t
{
	EGNRunRole__All                = 0,
	EGNRunRole__Authority          = 1,
	EGNRunRole__Autonomous         = 2,
	EGNRunRole__Simulated          = 3,
	EGNRunRole__AutonomousSimulated = 4,
	EGNRunRole__AutonomousAuthority = 5,
	EGNRunRole__AuthoritySimulated = 6,
	EGNRunRole__EGNRunRole_MAX     = 7
};



//---------------------------------------------------------------------------
//Script Structs
//---------------------------------------------------------------------------

// ScriptStruct GeneralNode.GNUniqueInstancedNodeKey
// 0x0010
struct FGNUniqueInstancedNodeKey
{
	class UObject*                                     Object;                                                   // 0x0000(0x0008) (ZeroConstructor, IsPlainOldData)
	struct FName                                       Key;                                                      // 0x0008(0x0008) (ZeroConstructor, IsPlainOldData)
};

// ScriptStruct GeneralNode.GNContext
// 0x0010
struct FGNContext
{
	class AActor*                                      Owner;                                                    // 0x0000(0x0008) (Edit, BlueprintVisible, ZeroConstructor, IsPlainOldData)
	class UObject*                                     SourceObject;                                             // 0x0008(0x0008) (Edit, BlueprintVisible, ZeroConstructor, IsPlainOldData)
};

// ScriptStruct GeneralNode.GNTargetContext
// 0x0020
struct FGNTargetContext
{
	TArray<class UObject*>                             Targets;                                                  // 0x0000(0x0010) (Edit, BlueprintVisible, ZeroConstructor)
	TArray<struct FVector>                             TargetLocations;                                          // 0x0010(0x0010) (Edit, BlueprintVisible, ZeroConstructor)
};

// ScriptStruct GeneralNode.GNActionInstance
// 0x0070
struct FGNActionInstance
{
	class UGNAction*                                   Action;                                                   // 0x0000(0x0008) (Edit, ZeroConstructor, IsPlainOldData)
	struct FGNContext                                  Context;                                                  // 0x0008(0x0010) (Edit)
	struct FGNTargetContext                            TargetContext;                                            // 0x0018(0x0020) (Edit)
	unsigned char                                      UnknownData00[0x38];                                      // 0x0038(0x0038) MISSED OFFSET
};

// ScriptStruct GeneralNode.GNSharedDelegateWrap
// 0x0018
struct FGNSharedDelegateWrap
{
	unsigned char                                      UnknownData00[0x8];                                       // 0x0000(0x0008) MISSED OFFSET
	class UObject*                                     Outer;                                                    // 0x0008(0x0008) (ZeroConstructor, IsPlainOldData)
	unsigned char                                      UnknownData01[0x8];                                       // 0x0010(0x0008) MISSED OFFSET
};

// ScriptStruct GeneralNode.GNMultiSharedDelegateWrap
// 0x0018
struct FGNMultiSharedDelegateWrap
{
	unsigned char                                      UnknownData00[0x8];                                       // 0x0000(0x0008) MISSED OFFSET
	class UObject*                                     Outer;                                                    // 0x0008(0x0008) (ZeroConstructor, IsPlainOldData)
	unsigned char                                      UnknownData01[0x8];                                       // 0x0010(0x0008) MISSED OFFSET
};

// ScriptStruct GeneralNode.GNComponentPicker
// 0x0010
struct FGNComponentPicker
{
	class UClass*                                      ComponentClass;                                           // 0x0000(0x0008) (Edit, BlueprintVisible, ZeroConstructor, IsPlainOldData)
	struct FName                                       ComponentTag;                                             // 0x0008(0x0008) (Edit, BlueprintVisible, ZeroConstructor, IsPlainOldData)
};

// ScriptStruct GeneralNode.GNActionRunData
// 0x0048
struct FGNActionRunData
{
	class UGNAction*                                   Action;                                                   // 0x0000(0x0008) (Edit, ZeroConstructor, IsPlainOldData)
	TArray<class UGNCondition*>                        Conditions;                                               // 0x0008(0x0010) (Edit, ZeroConstructor)
	TArray<class UGNTargetPicker*>                     TargetPickers;                                            // 0x0018(0x0010) (Edit, ZeroConstructor)
	TArray<class UGNTargetFilter*>                     TargetFilters;                                            // 0x0028(0x0010) (Edit, ZeroConstructor)
	struct FGNContext                                  Context;                                                  // 0x0038(0x0010) (Edit)
};

}

