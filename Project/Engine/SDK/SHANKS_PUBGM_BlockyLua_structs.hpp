#pragma once

// WE SUPPORT FUN  (4.1.0) SDKGen by @O_N_E_B_I_E_C_E | @onebiecerr 
// Send Message Me For SDKGen Tool  
// Generate on Wed Nov  5 15:05:54 2025
 
namespace SDK
{
//---------------------------------------------------------------------------
//Enums
//---------------------------------------------------------------------------

// Enum BlockyLua.ESearchResultVisibleType
enum class ESearchResultVisibleType : uint8_t
{
	ESearchResultVisibleType__SRVT_ShowAll = 0,
	ESearchResultVisibleType__SRVT_OnlyBlocks = 1,
	ESearchResultVisibleType__SRVT_OnlyGraphs = 2,
	ESearchResultVisibleType__SRVT_OnlyPresets = 3,
	ESearchResultVisibleType__SRVT_MAX = 4
};


// Enum BlockyLua.BLOCKYLUA_AUTO_SCROLL_TYPE
enum class EBLOCKYLUA_AUTO_SCROLL_TYPE : uint8_t
{
	BLOCKYLUA_AUTO_SCROLL_TYPE__LEFT_RIGHT = 0,
	BLOCKYLUA_AUTO_SCROLL_TYPE__PING_PONG = 1,
	BLOCKYLUA_AUTO_SCROLL_TYPE__BLOCKYLUA_AUTO_SCROLL_MAX = 2
};



//---------------------------------------------------------------------------
//Script Structs
//---------------------------------------------------------------------------

// ScriptStruct BlockyLua.IntArrayWrapper
// 0x0010
struct FIntArrayWrapper
{
	TArray<int>                                        Values;                                                   // 0x0000(0x0010) (Edit, BlueprintVisible, ZeroConstructor)
};

// ScriptStruct BlockyLua.SlotData
// 0x0020
struct FSlotData
{
	class UBlockBase*                                  LinkedSlotHost;                                           // 0x0000(0x0008) (ZeroConstructor, IsPlainOldData)
	unsigned char                                      UnknownData00[0x18];                                      // 0x0008(0x0018) MISSED OFFSET
};

}

