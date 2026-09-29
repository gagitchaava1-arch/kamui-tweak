#pragma once

// WE SUPPORT FUN  (4.1.0) SDKGen by @O_N_E_B_I_E_C_E | @onebiecerr 
// Send Message Me For SDKGen Tool  
// Generate on Wed Nov  5 15:05:56 2025
 
namespace SDK
{
//---------------------------------------------------------------------------
//Enums
//---------------------------------------------------------------------------

// Enum UgcLua.EEntityType
enum class EEntityType : uint8_t
{
	EEntityType__Invalid           = 0,
	EEntityType__Timer             = 1,
	EEntityType__Trigger           = 2,
	EEntityType__TriggerGroup      = 3,
	EEntityType__Component         = 4,
	EEntityType__ComponentPreset   = 5,
	EEntityType__LightComponent    = 6,
	EEntityType__LightComponentPreset = 7,
	EEntityType__Region            = 8,
	EEntityType__GameplayDevice    = 9,
	EEntityType__GameplayDevicePreset = 10,
	EEntityType__PlayerState       = 11,
	EEntityType__ArmedAICharacter  = 12,
	EEntityType__MonsterCharacter  = 13,
	EEntityType__PlayerPreset      = 14,
	EEntityType__PlayerCharacterPreset = 15,
	EEntityType__ArmedAI           = 16,
	EEntityType__ArmedAIPreset     = 17,
	EEntityType__Monster           = 18,
	EEntityType__MonsterPreset     = 19,
	EEntityType__SkillPreset       = 20,
	EEntityType__BuffPreset        = 21,
	EEntityType__WeaponPreset      = 22,
	EEntityType__WeatherPreset     = 23,
	EEntityType__Item              = 24,
	EEntityType__ItemPreset        = 25,
	EEntityType__Vehicle           = 26,
	EEntityType__VehiclePreset     = 27,
	EEntityType__Effect            = 28,
	EEntityType__EffectPreset      = 29,
	EEntityType__Sound             = 30,
	EEntityType__SoundPreset       = 31,
	EEntityType__LogicObject       = 32,
	EEntityType__LogicObjectPreset = 33,
	EEntityType__TriggerArea       = 34,
	EEntityType__TriggerAreaPreset = 35,
	EEntityType__Marker            = 36,
	EEntityType__Pickup            = 37,
	EEntityType__PickupPreset      = 38,
	EEntityType__ContestedItem     = 39,
	EEntityType__ContestedItemPreset = 40,
	EEntityType__BankProduct       = 41,
	EEntityType__BuildingInstance  = 42,
	EEntityType__Skill             = 43,
	EEntityType__Projectile        = 44,
	EEntityType__ActorSkill        = 45,
	EEntityType__Empower           = 46,
	EEntityType__DropGroupPreset   = 47,
	EEntityType__TreasurePreset    = 48,
	EEntityType__NPC               = 49,
	EEntityType__UObject           = 50,
	EEntityType____MAX             = 51,
	EEntityType__EEntityType_MAX   = 52
};


// Enum UgcLua.EUGCLuaType
enum class EUGCLuaType : uint8_t
{
	EUGCLuaType__LuaNiil           = 0,
	EUGCLuaType__Boolean           = 1,
	EUGCLuaType__Number            = 2,
	EUGCLuaType__String            = 3,
	EUGCLuaType__EUGCLuaType_MAX   = 4
};



}

