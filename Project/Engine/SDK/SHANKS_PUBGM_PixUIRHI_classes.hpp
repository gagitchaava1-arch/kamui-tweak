#pragma once

// WE SUPPORT FUN  (4.1.0) SDKGen by @O_N_E_B_I_E_C_E | @onebiecerr 
// Send Message Me For SDKGen Tool  
// Generate on Wed Nov  5 15:05:57 2025
 
namespace SDK
{
//---------------------------------------------------------------------------
//Classes
//---------------------------------------------------------------------------

// Class PixUIRHI.PxRHIImage
// 0x0000 (0x0028 - 0x0028)
class UPxRHIImage : public UObject
{
public:

	static UClass* StaticClass()
	{
        static UClass *pStaticClass = 0;
        if (!pStaticClass)
            pStaticClass = UObject::FindClass("Class PixUIRHI.PxRHIImage");
		return pStaticClass;
	}


	class UObject* GetHandleObject();
};


// Class PixUIRHI.PxRHIMgr
// 0x0000 (0x0028 - 0x0028)
class UPxRHIMgr : public UObject
{
public:

	static UClass* StaticClass()
	{
        static UClass *pStaticClass = 0;
        if (!pStaticClass)
            pStaticClass = UObject::FindClass("Class PixUIRHI.PxRHIMgr");
		return pStaticClass;
	}


	static bool RHIImageUpdate(class UPxRHIMgr* pPxRHIImage);
	static class UPxRHIMgr* RHIImageFindByObject(class UObject* pCoreObject);
	static bool RHIImageDestroy(class UPxRHIMgr* pPxRHIImage);
	static class UPxRHIImage* RHIImageCreate();
	static class UPxRHIMgr* Get();
};


}

