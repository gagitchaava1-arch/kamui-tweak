#pragma once

// WE SUPPORT FUN  (4.1.0) SDKGen by @O_N_E_B_I_E_C_E | @onebiecerr 
// Send Message Me For SDKGen Tool  
// Generate on Wed Nov  5 15:05:57 2025
 
namespace SDK
{
//---------------------------------------------------------------------------
//Enums
//---------------------------------------------------------------------------

// Enum Gamelet.EGameletEnvironment
enum class EGameletEnvironment : uint8_t
{
	Gamelet_Test                   = 0,
	Gamelet_Product                = 1,
	Gamelet_Tyf_Test               = 2,
	Gamelet_Tyf_Product            = 3,
	Gamelet_MAX                    = 4
};


// Enum Gamelet.ECmd
enum class ECmd : uint8_t
{
	ECmdGSendMessageToApp          = 0,
	ECmdS2ESDKInitialized          = 1,
	ECmdS2EOnCgiProcessComplete    = 2,
	ECmdS2EStartPuertsVM           = 3,
	ECmdS2EPrepareGcrpRes          = 4,
	ECmdS2PMin                     = 5,
	ECmdS2PMax                     = 6,
	ECmd_MAX                       = 7
};



}

