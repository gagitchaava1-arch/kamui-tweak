#pragma once

// WE SUPPORT FUN  (4.1.0) SDKGen by @O_N_E_B_I_E_C_E | @onebiecerr 
// Send Message Me For SDKGen Tool  
// Generate on Wed Nov  5 15:05:57 2025
 
namespace SDK
{
//---------------------------------------------------------------------------
//Classes
//---------------------------------------------------------------------------

// Class PixUIProfiler.PxProfilerMgr
// 0x0000 (0x0028 - 0x0028)
class UPxProfilerMgr : public UObject
{
public:

	static UClass* StaticClass()
	{
        static UClass *pStaticClass = 0;
        if (!pStaticClass)
            pStaticClass = UObject::FindClass("Class PixUIProfiler.PxProfilerMgr");
		return pStaticClass;
	}


	static void StartProfiler();
	static void PxProfilerCapabilitySwitch(EPxProfilerCapability EPxProfilerCapability, bool bOpen);
	static void Print();
	static bool GetPxProfilerCapability(EPxProfilerCapability EPxProfilerCapability);
	static void EndProfiler();
	static void Check();
};


}

