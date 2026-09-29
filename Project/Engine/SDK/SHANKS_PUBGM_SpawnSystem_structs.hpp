#pragma once

// WE SUPPORT FUN  (4.1.0) SDKGen by @O_N_E_B_I_E_C_E | @onebiecerr 
// Send Message Me For SDKGen Tool  
// Generate on Wed Nov  5 15:05:51 2025
 
namespace SDK
{
//---------------------------------------------------------------------------
//Enums
//---------------------------------------------------------------------------

// Enum SpawnSystem.ESpeciesOrganization
enum class ESpeciesOrganization : uint8_t
{
	ESpeciesOrganization__Org_Group = 0,
	ESpeciesOrganization__Org_Squad = 1,
	ESpeciesOrganization__Org_Unit = 2,
	ESpeciesOrganization__Org_MAX  = 3
};


// Enum SpawnSystem.ESTSpawnerVolume
enum class ESTSpawnerVolume : uint8_t
{
	ESTSpawnerVolume__ESTSpawnerVolume_None = 0,
	ESTSpawnerVolume__ESTSpawnerVolume_Box = 1,
	ESTSpawnerVolume__ESTSpawnerVolume_Sphere = 2,
	ESTSpawnerVolume__ESTSpawnerVolume_MAX = 3
};


// Enum SpawnSystem.ESpawnSpotType
enum class ESpawnSpotType : uint8_t
{
	ESpawnSpotType__Ground         = 0,
	ESpawnSpotType__Wall           = 1,
	ESpawnSpotType__Air            = 2,
	ESpawnSpotType__ESpawnSpotType_MAX = 3
};


// Enum SpawnSystem.EReadSpeciesData
enum class EReadSpeciesData : uint8_t
{
	EReadSpeciesData__WeightedRandom = 0,
	EReadSpeciesData__Ordered      = 1,
	EReadSpeciesData__ManuallyIndex = 2,
	EReadSpeciesData__EReadSpeciesData_MAX = 3
};


// Enum SpawnSystem.EWaveState
enum class EWaveState : uint8_t
{
	EWaveState__None               = 0,
	EWaveState__WaveSpawning       = 1,
	EWaveState__WaveSpawned        = 2,
	EWaveState__WaveCD             = 3,
	EWaveState__WaveReadyForNext   = 4,
	EWaveState__EWaveState_MAX     = 5
};



//---------------------------------------------------------------------------
//Script Structs
//---------------------------------------------------------------------------

// ScriptStruct SpawnSystem.UnitInitConfig
// 0x0018
struct FUnitInitConfig
{
	struct FName                                       BlackBoardKey;                                            // 0x0000(0x0008) (Edit, BlueprintVisible, ZeroConstructor, IsPlainOldData)
	struct FString                                     Value;                                                    // 0x0008(0x0010) (Edit, BlueprintVisible, ZeroConstructor)
};

// ScriptStruct SpawnSystem.UnitConfig
// 0x0078
struct FUnitConfig
{
	struct FString                                     Desc;                                                     // 0x0000(0x0010) (Edit, ZeroConstructor)
	int                                                ConfigId;                                                 // 0x0010(0x0004) (Edit, BlueprintVisible, ZeroConstructor, IsPlainOldData)
	unsigned char                                      UnknownData00[0x4];                                       // 0x0014(0x0004) MISSED OFFSET
	TArray<struct FUnitInitConfig>                     UnitInitConfig;                                           // 0x0018(0x0010) (Edit, BlueprintVisible, ZeroConstructor)
	int                                                AttrId;                                                   // 0x0028(0x0004) (Edit, BlueprintVisible, ZeroConstructor, IsPlainOldData)
	int                                                DropID;                                                   // 0x002C(0x0004) (Edit, BlueprintVisible, ZeroConstructor, IsPlainOldData)
	struct FSoftClassPath                              BPPath;                                                   // 0x0030(0x0018) (Edit, BlueprintVisible)
	struct FString                                     StrBPPath;                                                // 0x0048(0x0010) (BlueprintVisible, ZeroConstructor)
	bool                                               bTraceGround;                                             // 0x0058(0x0001) (Edit, BlueprintVisible, ZeroConstructor, IsPlainOldData)
	unsigned char                                      UnknownData01[0x7];                                       // 0x0059(0x0007) MISSED OFFSET
	struct FString                                     PreferSpotID;                                             // 0x0060(0x0010) (BlueprintVisible, ZeroConstructor)
	int                                                UnitIndex;                                                // 0x0070(0x0004) (BlueprintVisible, ZeroConstructor, IsPlainOldData)
	unsigned char                                      UnknownData02[0x4];                                       // 0x0074(0x0004) MISSED OFFSET
};

// ScriptStruct SpawnSystem.STSpawnParam
// 0x00D0
struct FSTSpawnParam
{
	struct FUnitConfig                                 UnitConfig;                                               // 0x0000(0x0078) (BlueprintVisible)
	unsigned char                                      UnknownData00[0x8];                                       // 0x0078(0x0008) MISSED OFFSET
	struct FTransform                                  Transform;                                                // 0x0080(0x0030) (BlueprintVisible, IsPlainOldData)
	int                                                AttributeID;                                              // 0x00B0(0x0004) (BlueprintVisible, ZeroConstructor, IsPlainOldData)
	uint32_t                                           SpawnerID;                                                // 0x00B4(0x0004) (ZeroConstructor, IsPlainOldData)
	struct FString                                     SpotID;                                                   // 0x00B8(0x0010) (ZeroConstructor)
	unsigned char                                      UnknownData01[0x8];                                       // 0x00C8(0x0008) MISSED OFFSET
};

// ScriptStruct SpawnSystem.SpawnSpotInfo
// 0x0060
struct FSpawnSpotInfo
{
	struct FTransform                                  Transform;                                                // 0x0000(0x0030) (BlueprintVisible, IsPlainOldData)
	int                                                SpecieSquadIndex;                                         // 0x0030(0x0004) (BlueprintVisible, ZeroConstructor, IsPlainOldData)
	int                                                SpecieUnitIndex;                                          // 0x0034(0x0004) (BlueprintVisible, ZeroConstructor, IsPlainOldData)
	struct FString                                     SpotID;                                                   // 0x0038(0x0010) (BlueprintVisible, ZeroConstructor)
	TArray<struct FUnitInitConfig>                     SpotInitConfig;                                           // 0x0048(0x0010) (BlueprintVisible, ZeroConstructor)
	unsigned char                                      UnknownData00[0x8];                                       // 0x0058(0x0008) MISSED OFFSET
};

// ScriptStruct SpawnSystem.WeightedUnit
// 0x0008
struct FWeightedUnit
{
	int                                                Index;                                                    // 0x0000(0x0004) (Edit, BlueprintVisible, ZeroConstructor, IsPlainOldData)
	int                                                Weight;                                                   // 0x0004(0x0004) (Edit, BlueprintVisible, ZeroConstructor, IsPlainOldData)
};

// ScriptStruct SpawnSystem.SquadConfig
// 0x0040
struct FSquadConfig
{
	struct FString                                     Desc;                                                     // 0x0000(0x0010) (Edit, ZeroConstructor)
	TArray<struct FWeightedUnit>                       Units;                                                    // 0x0010(0x0010) (Edit, BlueprintVisible, ZeroConstructor)
	TArray<struct FUnitInitConfig>                     SquadInitConfig;                                          // 0x0020(0x0010) (Edit, BlueprintVisible, ZeroConstructor)
	struct FString                                     SuggestNumber;                                            // 0x0030(0x0010) (Edit, BlueprintVisible, ZeroConstructor)
};

// ScriptStruct SpawnSystem.WeightedSquad
// 0x0008
struct FWeightedSquad
{
	int                                                Index;                                                    // 0x0000(0x0004) (Edit, BlueprintVisible, ZeroConstructor, IsPlainOldData)
	int                                                Weight;                                                   // 0x0004(0x0004) (Edit, BlueprintVisible, ZeroConstructor, IsPlainOldData)
};

// ScriptStruct SpawnSystem.GroupConfig
// 0x0028
struct FGroupConfig
{
	struct FString                                     Desc;                                                     // 0x0000(0x0010) (Edit, ZeroConstructor)
	TArray<struct FWeightedSquad>                      Squads;                                                   // 0x0010(0x0010) (Edit, BlueprintVisible, ZeroConstructor)
	int                                                Weight;                                                   // 0x0020(0x0004) (Edit, BlueprintVisible, ZeroConstructor, IsPlainOldData)
	unsigned char                                      UnknownData00[0x4];                                       // 0x0024(0x0004) MISSED OFFSET
};

// ScriptStruct SpawnSystem.UnitRatio
// 0x0080
struct FUnitRatio
{
	struct FUnitConfig                                 Unit;                                                     // 0x0000(0x0078) (Edit)
	float                                              Ratio;                                                    // 0x0078(0x0004) (Edit, ZeroConstructor, IsPlainOldData)
	unsigned char                                      UnknownData00[0x4];                                       // 0x007C(0x0004) MISSED OFFSET
};

// ScriptStruct SpawnSystem.SpeciesRatioStruct
// 0x0010
struct FSpeciesRatioStruct
{
	TArray<struct FUnitRatio>                          UnitRatios;                                               // 0x0000(0x0010) (Edit, ZeroConstructor)
};

// ScriptStruct SpawnSystem.SpawnArea
// 0x0020
struct FSpawnArea
{
	struct FVector                                     CenterLocation;                                           // 0x0000(0x000C) (IsPlainOldData)
	ESTSpawnerVolume                                   Shape;                                                    // 0x000C(0x0001) (Edit, ZeroConstructor, IsPlainOldData)
	unsigned char                                      UnknownData00[0x3];                                       // 0x000D(0x0003) MISSED OFFSET
	struct FVector                                     ShapeSize;                                                // 0x0010(0x000C) (Edit, IsPlainOldData)
	bool                                               bInsideArea;                                              // 0x001C(0x0001) (Edit, ZeroConstructor, IsPlainOldData)
	unsigned char                                      UnknownData01[0x3];                                       // 0x001D(0x0003) MISSED OFFSET
};

// ScriptStruct SpawnSystem.STSpawnerDebugData
// 0x0001
struct FSTSpawnerDebugData
{
	unsigned char                                      UnknownData00[0x1];                                       // 0x0000(0x0001) MISSED OFFSET
};

}

