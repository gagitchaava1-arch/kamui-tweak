#pragma once

// WE SUPPORT FUN  (4.1.0) SDKGen by @O_N_E_B_I_E_C_E | @onebiecerr 
// Send Message Me For SDKGen Tool  
// Generate on Wed Nov  5 15:05:50 2025
 
#include "../SDK.hpp"

namespace SDK
{
//---------------------------------------------------------------------------
//Parameters
//---------------------------------------------------------------------------

// Function PhotonDestructible.PhotonDestructibleSurfaceComponent.Server_ProcessHit
struct UPhotonDestructibleSurfaceComponent_Server_ProcessHit_Params
{
	struct FPhotonDestructibleSurfaceHitData           HitData;                                                  // (ConstParm, Parm, OutParm, ReferenceParm)
};

// Function PhotonDestructible.PhotonDestructibleSurfaceComponent.OnRep_SurfaceNetData
struct UPhotonDestructibleSurfaceComponent_OnRep_SurfaceNetData_Params
{
};

// Function PhotonDestructible.PhotonDestructibleSurfaceComponent.Client_OnProcessHit
struct UPhotonDestructibleSurfaceComponent_Client_OnProcessHit_Params
{
	struct FPhotonDestructibleSurfaceHitData           HitData;                                                  // (ConstParm, Parm, ReferenceParm)
};

// Function PhotonDestructible.PhotonDestructibleInstancedSurfaceComponent.Server_ProcessHit
struct UPhotonDestructibleInstancedSurfaceComponent_Server_ProcessHit_Params
{
	struct FPhotonDestructibleSurfaceHitData           HitData;                                                  // (ConstParm, Parm, OutParm, ReferenceParm)
};

// Function PhotonDestructible.PhotonDestructibleInstancedSurfaceComponent.OnRep_SurfaceNetData
struct UPhotonDestructibleInstancedSurfaceComponent_OnRep_SurfaceNetData_Params
{
};

// Function PhotonDestructible.PhotonDestructibleInstancedSurfaceComponent.Client_OnProcessHit
struct UPhotonDestructibleInstancedSurfaceComponent_Client_OnProcessHit_Params
{
	struct FPhotonDestructibleSurfaceHitData           HitData;                                                  // (ConstParm, Parm, ReferenceParm)
};

// Function PhotonDestructible.PhotonDestructiblePuppet.TriggerPuppetEvent
struct UPhotonDestructiblePuppet_TriggerPuppetEvent_Params
{
	int                                                EventID;                                                  // (Parm, ZeroConstructor, IsPlainOldData)
};

// Function PhotonDestructible.PhotonDestructiblePuppetContainer.TriggerPuppetEvent
struct UPhotonDestructiblePuppetContainer_TriggerPuppetEvent_Params
{
	struct FString                                     ObjectName;                                               // (Parm, ZeroConstructor)
	int                                                EventID;                                                  // (Parm, ZeroConstructor, IsPlainOldData)
};

// Function PhotonDestructible.PhotonDestructiblePuppetMgr.Client_TriggerPuppetEvent
struct UPhotonDestructiblePuppetMgr_Client_TriggerPuppetEvent_Params
{
	struct FGuid                                       PuppetGUID;                                               // (ConstParm, Parm, ReferenceParm, IsPlainOldData)
	int                                                EventID;                                                  // (Parm, ZeroConstructor, IsPlainOldData)
};

}

