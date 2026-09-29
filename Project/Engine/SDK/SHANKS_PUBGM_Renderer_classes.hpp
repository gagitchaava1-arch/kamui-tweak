#pragma once

// WE SUPPORT FUN  (4.1.0) SDKGen by @O_N_E_B_I_E_C_E | @onebiecerr 
// Send Message Me For SDKGen Tool  
// Generate on Wed Nov  5 15:05:52 2025
 
namespace SDK
{
//---------------------------------------------------------------------------
//Classes
//---------------------------------------------------------------------------

// Class Renderer.SparseVolumeTextureViewerComponent
// 0x0040 (0x08A0 - 0x0860)
class USparseVolumeTextureViewerComponent : public UPrimitiveComponent
{
public:
	class USparseVolumeTexture*                        SparseVolumeTexturePreview;                               // 0x0860(0x0008) (Edit, BlueprintVisible, ZeroConstructor, IsPlainOldData)
	float                                              Frame;                                                    // 0x0868(0x0004) (Edit, BlueprintVisible, ZeroConstructor, IsPlainOldData)
	float                                              FrameRate;                                                // 0x086C(0x0004) (Edit, BlueprintVisible, ZeroConstructor, IsPlainOldData)
	unsigned char                                      bPlayIng : 1;                                             // 0x0870(0x0001) (Edit, BlueprintVisible)
	unsigned char                                      bLooping : 1;                                             // 0x0870(0x0001) (Edit, BlueprintVisible)
	unsigned char                                      bReversePlayback : 1;                                     // 0x0870(0x0001) (Edit, BlueprintVisible, BlueprintReadOnly)
	unsigned char                                      bBlockingStreamingRequests : 1;                           // 0x0870(0x0001) (Edit, BlueprintVisible, BlueprintReadOnly)
	unsigned char                                      bApplyPerFrameTransforms : 1;                             // 0x0870(0x0001) (Edit, BlueprintVisible, BlueprintReadOnly)
	unsigned char                                      bPivotAtCentroid : 1;                                     // 0x0870(0x0001) (Edit, BlueprintVisible, BlueprintReadOnly)
	unsigned char                                      UnknownData00[0x3];                                       // 0x0871(0x0003) MISSED OFFSET
	float                                              VoxelSize;                                                // 0x0874(0x0004) (Edit, BlueprintVisible, ZeroConstructor, IsPlainOldData)
	ESparseVolumeTexturePreviewAttribute               PreviewAttribute;                                         // 0x0878(0x0001) (Edit, BlueprintVisible, ZeroConstructor, IsPlainOldData)
	unsigned char                                      UnknownData01[0x3];                                       // 0x0879(0x0003) MISSED OFFSET
	int                                                MipLevel;                                                 // 0x087C(0x0004) (Edit, BlueprintVisible, ZeroConstructor, IsPlainOldData)
	float                                              Extinction;                                               // 0x0880(0x0004) (Edit, BlueprintVisible, ZeroConstructor, IsPlainOldData)
	unsigned char                                      UnknownData02[0x1C];                                      // 0x0884(0x001C) MISSED OFFSET

	static UClass* StaticClass()
	{
        static UClass *pStaticClass = 0;
        if (!pStaticClass)
            pStaticClass = UObject::FindClass("Class Renderer.SparseVolumeTextureViewerComponent");
		return pStaticClass;
	}

};


// Class Renderer.SparseVolumeTextureViewer
// 0x0008 (0x0460 - 0x0458)
class ASparseVolumeTextureViewer : public AInfo
{
public:
	class USparseVolumeTextureViewerComponent*         SparseVolumeTextureViewerComponent;                       // 0x0458(0x0008) (Edit, BlueprintVisible, ExportObject, BlueprintReadOnly, ZeroConstructor, EditConst, InstancedReference, IsPlainOldData)

	static UClass* StaticClass()
	{
        static UClass *pStaticClass = 0;
        if (!pStaticClass)
            pStaticClass = UObject::FindClass("Class Renderer.SparseVolumeTextureViewer");
		return pStaticClass;
	}

};


}

