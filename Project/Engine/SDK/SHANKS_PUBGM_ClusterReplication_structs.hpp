#pragma once

// WE SUPPORT FUN  (4.1.0) SDKGen by @O_N_E_B_I_E_C_E | @onebiecerr 
// Send Message Me For SDKGen Tool  
// Generate on Wed Nov  5 15:05:56 2025
 
namespace SDK
{
//---------------------------------------------------------------------------
//Enums
//---------------------------------------------------------------------------

// Enum ClusterReplication.EClusterEntityState
enum class EClusterEntityState : uint8_t
{
	EClusterEntityState__STATE_Original = 0,
	EClusterEntityState__STATE_WithData = 1,
	EClusterEntityState__STATE_WithNoData = 2,
	EClusterEntityState__STATE_MAX = 3
};


// Enum ClusterReplication.EAOIEntityType
enum class EAOIEntityType : uint8_t
{
	EAOIEntityType__Static         = 0,
	EAOIEntityType__Static_UGC     = 1,
	EAOIEntityType__Dynamic        = 2,
	EAOIEntityType__Dynamic_Custom = 3,
	EAOIEntityType__EAOIEntityType_MAX = 4
};



//---------------------------------------------------------------------------
//Script Structs
//---------------------------------------------------------------------------

// ScriptStruct ClusterReplication.ClusterAOIConfig
// 0x0038
struct FClusterAOIConfig
{
	float                                              AOIClusterSize;                                           // 0x0000(0x0004) (Edit, ZeroConstructor, IsPlainOldData)
	float                                              AOIClusterTolerantSize;                                   // 0x0004(0x0004) (Edit, ZeroConstructor, IsPlainOldData)
	int                                                AOIClusterRelativeIterator;                               // 0x0008(0x0004) (Edit, ZeroConstructor, IsPlainOldData)
	int16_t                                            SelectedGroup;                                            // 0x000C(0x0002) (Edit, ZeroConstructor, Transient, IsPlainOldData)
	unsigned char                                      UnknownData00[0x2];                                       // 0x000E(0x0002) MISSED OFFSET
	struct FVector                                     AOIMinPoint;                                              // 0x0010(0x000C) (BlueprintVisible, BlueprintReadOnly, IsPlainOldData)
	struct FVector                                     AOIMaxPoint;                                              // 0x001C(0x000C) (BlueprintVisible, BlueprintReadOnly, IsPlainOldData)
	TArray<int16_t>                                    AOIEntityCounts;                                          // 0x0028(0x0010) (ZeroConstructor)
};

}

