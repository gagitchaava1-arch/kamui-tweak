#include "Project/ImGui/imgui.h"
#include "Project/Extra/Bone.hpp"
#include "Project/Extra/utf.hpp"
#include "Project/Extra/Obfuscate.h"
#include <array>
#include "Project/Main/ESP.hpp"
#include "Project/Offset/Offset.hpp"
#import <UIKit/UIKit.h>

//int DancerValue;
//float DanceValue = 0.0f;
//float IsSpeedSpin = 0.0f;
extern BOOL IsNumberPlayer,IsLine,IsLineAimbot,背敌模式,IsName,IsNation,IsUID,IsDistance,IsTeam,IsHealth,IsAlert360,IsBone,IsWeapon,雷达开关,被瞄开关,IsAimbot,IsBulletTrack,静默开关,倒地开关,IsAR,IsSR,IsSMG,IsShotGun,IsBom,IsBullet,IsArmor,IsRecovery,IsVehicle,IsScope,美化开关,无后开关,聚点开关,瞬击开关,防抖开关,IsIgnoreKnock,IsBox,IsWarningBom,IsDeadBox,IsAirDrop,IsDeveloperMode,IsFov,IsView;
static long GWorld, UName, Engine, PersistentLevel, PlayerController, Character, PlayerCameraManager, ControlRotation, MyHUD, TinyFont, SmallFont, HUD, Canvas, BP_MapUIMarkManager_C, pExtraGameState, PlayerState;
static int MyTeam, playerCount, botCount, pickItemCount;
int AlivePlayerNum, AliveTeamNum, PlayerNum, minutes, seconds, Kill;
static int WeaponId = 0;
static float tDistance = 0, markDistance, markDis;
float IsRadius = 0;
float IsRecoil = 0;
static bool needAdjustAim = false, sniperrifle = false;
static ImVec3 CameraCache, TracktargetPos;
static ImVec2 CanvasSize, markScreenPos;
static ImVec2 rootScreen;
static MinimalViewInfo POV;
bool boquabots = false;
int IsStyle = 0;
int 圆圈模式 = 1;
int IsPart = 0;
int IsMode = 0;
int 雷达大小 = 400;
int 雷达X = 500;
int 雷达Y = 60;
int 人物美化;
int 枪械美化;
long NetDriver;
int 圆圈固定 = 100;
int 预警范围 = 38;
float IsSpeed = 0.0;
float 命中率 = 1.00;
float 压枪速率 = 0;
float IsDistanceAimbot = 0;
float IsDistancePlayer = 750;
float 物资距离 = 500;
float IsThicknessBone = 1.0;
float IsThicknessLine = 1.0;
bool 屏蔽人机=NO;
extern ImFont *FontMenu;
float radiusalert = 125.0f; // Bán kính vòng tròn chỉ hướng
float IsTPPValue = 90.0;
float IsFPPValue = 90.0;
float Health;

ImColor outlineColor = ImColor(0, 0, 0);

ImColor ColorBoneVisible = ImColor(0, 255, 0);
ImColor ColorBoneInvisible = ImColor(255, 0, 0);
ImColor ColorLineVisible = ImColor(0, 255, 0);
ImColor ColorLineInvisible = ImColor(255, 255, 255);
ImColor ColorBoxVisible = ImColor(0, 255, 0);
ImColor ColorBoxInvisible = ImColor(0, 255, 255);

ImColor colorShotGun       = ImColor(255, 102, 102);   // Đỏ hồng tươi
ImColor colorScope         = ImColor(102, 178, 255);   // Xanh thiên thanh
ImColor colorBom           = ImColor(255, 153, 102);   // Cam sáng
ImColor colorSMG           = ImColor(204, 102, 255);   // Tím hoa cà tươi
ImColor colorAR            = ImColor(102, 255, 178);   // Xanh ngọc nhạt
ImColor colorSR            = ImColor(255, 102, 204);   // Hồng sen tươi
ImColor colorRecovery      = ImColor(102, 255, 255);   // Cyan nhạt
ImColor colorArmor         = ImColor(178, 255, 102);   // Xanh lá sáng
ImColor colorBullet        = ImColor(255, 204, 102);   // Vàng cam sáng

const char *kUWorld;
const char *kGNames;
const char *kBonePos;

#pragma mark - 内存读写
static uintptr_t Get_module_base() {
    
    uint32_t count = _dyld_image_count();
    for (int i = 0; i < count; i++) {
        std::string path = (const char *)_dyld_get_image_name(i);
        if (path.find("ShadowTrackerExtra.app/ShadowTrackerExtra") != path.npos) {
            return (uintptr_t)_dyld_get_image_vmaddr_slide(i);
        }
    }
    return 0;
}
static bool IsValidAddress(long address) {
    return address > 0x100000000 && address < 0x2000000000;
}

static uintptr_t GetHexAddr(string address) {
    return (uintptr_t)strtoul(address.c_str(), nullptr, 16);
}

static uintptr_t GetRealOffset(string address) {
    return (Get_module_base() + GetHexAddr(address));
}

bool _read(uintptr_t addr, void *buffer, int len)
{
    if (!IsValidAddress(addr)) return false;
    vm_size_t size = 0;
    kern_return_t error = vm_read_overwrite(mach_task_self(), (vm_address_t)addr, len, (vm_address_t)buffer, &size);
    if(error != KERN_SUCCESS || size != len)
    {
        return false;
    }
    return true;
}

bool _write(uintptr_t addr, void *buffer, int len)
{
if (!IsValidAddress(addr)) return false;
kern_return_t error = vm_write(mach_task_self(), (vm_address_t)addr, (vm_offset_t)buffer, (mach_msg_type_number_t)len);
if(error != KERN_SUCCESS)
{
return false;
}
return true;
}

template<typename T> T Read(uintptr_t address) {
    T data;
    _read(address, reinterpret_cast<void *>(&data), sizeof(T));
    return data;
}

template<typename T> void Write(uintptr_t address, T data) {
_write(address, reinterpret_cast<void *>(&data), sizeof(T));
}


static bool Read_data(long Adder, int Size, void* buff) {
    kern_return_t kret = vm_copy(mach_task_self(), (vm_address_t)Adder, (vm_size_t)Size, (vm_address_t)buff);
    return kret == 0;
}

static uint64_t I64(string address) {
    return (uint64_t)strtoul(address.c_str(), nullptr, 16);
}

#pragma mark - 字符串工具

static bool isEqual(string s1, const char* check) {
    string s2(check);
    return (s1 == s2);
}

static bool isContain(string str, const char* check) {
    size_t found = str.find(check);
    return (found != string::npos);
}

template<typename ... Args>
static string string_format(const string& format, Args ... args){
    size_t size = 1 + snprintf(nullptr, 0, format.c_str(), args ...);  // Extra space for \0
    char bytes[size];
    snprintf(bytes, size, format.c_str(), args ...);
    return string(bytes);
}

#pragma mark - 颜色工具

static ImColor HeadLineColor(bool HeadSight) {
    return !HeadSight ? ColorLineInvisible : ColorLineVisible;
}

static ImColor HeadBoxColor(bool HeadSight) {
    return !HeadSight ? ColorBoxInvisible : ColorBoxVisible;
}

static ImColor BoneColos(bool b1, bool b2) {
    return b1 || b2 ? ColorBoneVisible : ColorBoneInvisible;
}

#pragma mark - 引擎绘制


#pragma mark - 坐标系转换

static FMatrix RotatorToMatrix(FRotator rotation) {
    float radPitch = rotation.Pitch * ((float) M_PI / 180.0f);
    float radYaw = rotation.Yaw * ((float) M_PI / 180.0f);
    float radRoll = rotation.Roll * ((float) M_PI / 180.0f);

    float SP = sinf(radPitch);
    float CP = cosf(radPitch);
    float SY = sinf(radYaw);
    float CY = cosf(radYaw);
    float SR = sinf(radRoll);
    float CR = cosf(radRoll);

    FMatrix matrix;

    matrix[0][0] = (CP * CY);
    matrix[0][1] = (CP * SY);
    matrix[0][2] = (SP);
    matrix[0][3] = 0;

    matrix[1][0] = (SR * SP * CY - CR * SY);
    matrix[1][1] = (SR * SP * SY + CR * CY);
    matrix[1][2] = (-SR * CP);
    matrix[1][3] = 0;

    matrix[2][0] = (-(CR * SP * CY + SR * SY));
    matrix[2][1] = (CY * SR - CR * SP * SY);
    matrix[2][2] = (CR * CP);
    matrix[2][3] = 0;

    matrix[3][0] = 0;
    matrix[3][1] = 0;
    matrix[3][2] = 0;
    matrix[3][3] = 1;

    return matrix;
}

static ImVec2 WorldToScreen(ImVec3 worldLocation, MinimalViewInfo camViewInfo) {
    FMatrix tempMatrix = RotatorToMatrix(camViewInfo.Rotation);

    ImVec3 vAxisX(tempMatrix[0][0], tempMatrix[0][1], tempMatrix[0][2]);
    ImVec3 vAxisY(tempMatrix[1][0], tempMatrix[1][1], tempMatrix[1][2]);
    ImVec3 vAxisZ(tempMatrix[2][0], tempMatrix[2][1], tempMatrix[2][2]);

    ImVec3 vDelta = worldLocation - camViewInfo.Location;

    ImVec3 vTransformed(ImVec3::Dot(vDelta, vAxisY), ImVec3::Dot(vDelta, vAxisZ), ImVec3::Dot(vDelta, vAxisX));

    if (vTransformed.z < 1.0f) vTransformed.z = 1.0f;

    float fov = camViewInfo.FOV;
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    float screenCenterX = (screenSize.width / 2.0f);
    float screenCenterY = (screenSize.height / 2.0f);

    return ImVec2((screenCenterX + vTransformed.x * (screenCenterX / tanf(fov * ((float) M_PI / 360.0f))) / vTransformed.z),
                     (screenCenterY - vTransformed.y * (screenCenterX / tanf(fov * ((float) M_PI / 360.0f))) / vTransformed.z));
}

static bool W2S(ImVec3 worldLocation, MinimalViewInfo camViewInfo, ImVec2& screenPos) {
    FMatrix tempMatrix = RotatorToMatrix(camViewInfo.Rotation);

    ImVec3 vAxisX(tempMatrix[0][0], tempMatrix[0][1], tempMatrix[0][2]);
    ImVec3 vAxisY(tempMatrix[1][0], tempMatrix[1][1], tempMatrix[1][2]);
    ImVec3 vAxisZ(tempMatrix[2][0], tempMatrix[2][1], tempMatrix[2][2]);

    ImVec3 vDelta = worldLocation - camViewInfo.Location;

    ImVec3 vTransformed(ImVec3::Dot(vDelta, vAxisY), ImVec3::Dot(vDelta, vAxisZ), ImVec3::Dot(vDelta, vAxisX));

    // Clamp z để tránh chia cho 0 hoặc âm
    if (vTransformed.z < 0.01f)
        vTransformed.z = 0.01f;

    float fov = camViewInfo.FOV;
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    float screenCenterX = (screenSize.width / 2.0f);
    float screenCenterY = (screenSize.height / 2.0f);

    screenPos = ImVec2(
        (screenCenterX + vTransformed.x * (screenCenterX / tanf(fov * ((float) M_PI / 360.0f))) / vTransformed.z),
        (screenCenterY - vTransformed.y * (screenCenterX / tanf(fov * ((float) M_PI / 360.0f))) / vTransformed.z)
    );

    // Kiểm tra giá trị hợp lệ
    if (!std::isfinite(screenPos.x) || !std::isfinite(screenPos.y))
        return false;

    return true;
}

void Circle3D(ImDrawList *draw, ImVec3 position, float points, float radius, ImColor color)
{
  float step = (float)M_PI * 2.0f / points;

  for (float a = 0; a < (M_PI * 2.0f); a += step)
  {
   ImVec3 start(radius * cosf(a) + position.x, radius * sinf(a) + position.y, position.z);
   ImVec3 end(radius * cosf(a + step) + position.x, radius * sinf(a + step) + position.y, position.z);

ImVec2 start2d, end2d;
if (!W2S(start, POV, start2d) || !W2S(end, POV, end2d))
    return;

draw->AddLine(start2d, end2d, color, 2.0f);

  }
}

static bool GetInsideFov(float ScreenWidth, float ScreenHeight, ImVec2 PlayerBone, float FovRadius) {
    ImVec2 Cenpoint;
    Cenpoint.x = PlayerBone.x - (ScreenWidth / 2);
    Cenpoint.y = PlayerBone.y - (ScreenHeight / 2);
    if (Cenpoint.x * Cenpoint.x + Cenpoint.y * Cenpoint.y <= FovRadius * FovRadius) return true;
    return false;
}

static int GetCenterOffsetForVector(ImVec2 point) {
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    return sqrt(pow(point.x - screenSize.width/2, 2.0) + pow(point.y - screenSize.height/2, 2.0));
}

#pragma mark -ActorsArray Decryption

struct ActorsEncryption {
    uint64_t Enc_1, Enc_2;
    uint64_t Enc_3, Enc_4;
};
struct Encryption_Chunk {
    uint32_t val_1, val_2, val_3, val_4;
    uint32_t val_5, val_6, val_7, val_8;
};
 
uint64_t DecryptActorsArray(uint64_t PersistentLevel, int Actors_Offset, int EncryptedActors_Offset)
{
    PersistentLevel = Read<long>(GWorld + I64(kPersistentLevel));
    if (!IsValidAddress(PersistentLevel)) return 0;
    if (PersistentLevel < 0x10000000) return 0;
     
    if (Read<uint64_t>(PersistentLevel + Actors_Offset) > 0)
        return PersistentLevel + Actors_Offset;
 
    if (Read<uint64_t>(PersistentLevel + EncryptedActors_Offset) > 0)
        return PersistentLevel + EncryptedActors_Offset;
 
    auto Encryption = Read<ActorsEncryption>(PersistentLevel + EncryptedActors_Offset + 0x10);
 
    if (Encryption.Enc_1 > 0)
    {
        auto Enc = Read<Encryption_Chunk>(Encryption.Enc_1 + 0x80);
        return (((((Read<uint8_t>(Encryption.Enc_1 + Enc.val_1)
        |(Read<uint8_t>(Encryption.Enc_1 + Enc.val_2) << 8))
        |(Read<uint8_t>(Encryption.Enc_1 + Enc.val_3) << 0x10)) & 0xFFFFFF)
        |((uint64_t)Read<uint8_t>(Encryption.Enc_1 + Enc.val_4) << 0x18)
        |((uint64_t)Read<uint8_t>(Encryption.Enc_1 + Enc.val_5) << 0x20)) & 0xFFFF00FFFFFFFFFF)
        |((uint64_t)Read<uint8_t>(Encryption.Enc_1 + Enc.val_6) << 0x28)
        |((uint64_t)Read<uint8_t>(Encryption.Enc_1 + Enc.val_7) << 0x30)
        |((uint64_t)Read<uint8_t>(Encryption.Enc_1 + Enc.val_8) << 0x38);
    }
    else if (Encryption.Enc_2 > 0)
    {
        auto Encrypted_Actors = Read<uint64_t>(Encryption.Enc_2);
        if (Encrypted_Actors > 0)
        {
            return ((uint16_t)(Encrypted_Actors - 0x400) & 0xFF00)
            |(uint8_t)(Encrypted_Actors - 0x04)
            |((Encrypted_Actors + 0xFC0000) & 0xFF0000)
            |((Encrypted_Actors - 0x4000000) & 0xFF000000)
            |((Encrypted_Actors + 0xFC00000000) & 0xFF00000000)
            |((Encrypted_Actors + 0xFC0000000000) & 0xFF0000000000)
            |((Encrypted_Actors + 0xFC000000000000) & 0xFF000000000000)
            |((Encrypted_Actors - 0x400000000000000) & 0xFF00000000000000);
        }
    }
    else if (Encryption.Enc_3 > 0)
    {
        auto Encrypted_Actors = Read<uint64_t>(Encryption.Enc_3);
        if (Encrypted_Actors > 0)
            return (Encrypted_Actors >> 0x38) | (Encrypted_Actors << (64 - 0x38));
    }
    else if (Encryption.Enc_4 > 0)
    {
        auto Encrypted_Actors = Read<uint64_t>(Encryption.Enc_4);
        if (Encrypted_Actors > 0)
            return Encrypted_Actors ^ 0xCDCD00;
    }
    return 0;
}

#pragma mark - 游戏数据
static long GetWorldPtr() {
    const auto function_address = reinterpret_cast<void*>(GetRealOffset(kUWorld));
    if (function_address) {
        long world = 0;
        return reinterpret_cast<long(__fastcall*)(long*)>(function_address)(&world);
    }
    return 0;
}

static long GetGnamePtr() {
    const auto function_address = reinterpret_cast<void*>(GetRealOffset(kGNames));
    if (function_address) {
        long gname = 0;
        return reinterpret_cast<long(__fastcall*)(long*)>(function_address)(&gname);
    }
    return 0;
}



static ImVec3 GetBonePos(long actor, const struct FName BoneName) {
    const auto function_address = reinterpret_cast<void*>(GetRealOffset(kBonePos));
    if (function_address) {
        return reinterpret_cast<ImVec3(__fastcall*)(long, const struct FName, const struct ImVec3)>(function_address)(actor, BoneName, ImVec3());
    }
    return ImVec3();
}

static string vm_str(long address, int max_len) {
    std::vector<char> chars(max_len);
    if (!Read_data(address, max_len, chars.data()))
        return "";

    std::string str = "";
    for (int i = 0; i < chars.size(); i++)
    {
        if (chars[i] == '\0')
            break;
        str.push_back(chars[i]);
    }

    chars.clear();
    chars.shrink_to_fit();

    if ((int)str[0] == 0 && str.size() == 1)
        return "";

    return str;
}

static string GetNameByID(uint32_t index) {
    static std::map<uint32_t, std::string> namesCachedMap;
    if (namesCachedMap.count(index) > 0) return namesCachedMap[index];
    std::string name = "";
    
    uint32_t ElementsPerChunk = 16384;
    uint32_t ChunkIndex = index / ElementsPerChunk;
    uint32_t WithinChunkIndex = index % ElementsPerChunk;
    uint8_t *FNameEntryArray = Read<uint8_t *>(UName + ChunkIndex * sizeof(uintptr_t));
    if (!FNameEntryArray) return name;
    
    uint8_t *FNameEntryPtr = Read<uint8_t *>((uintptr_t)FNameEntryArray + WithinChunkIndex * sizeof(uintptr_t));
    if (!FNameEntryPtr) return name;
    
    int32_t name_index = 0;
    if (!Read_data((long)FNameEntryPtr, (sizeof(int32_t) || (name_index & 0x1)), &name_index))return name;
    
    name = vm_str((long)FNameEntryPtr + 0xC, 0xff);
    namesCachedMap[index] = name;
    return name;
}

static string GetFName(long actor) {
    UInt32 FNameID = Read<UInt32>(actor + 0x18);
    if (FNameID < 0 || FNameID >= 2000000) return "";
    if (IsValidAddress(UName)) return GetNameByID(FNameID);
    return "";
}

static string GetPlayerName(long player) {
#if 0
    long PlayerName = Read<long>(player + I64(kPlayerName));
    int length = Read<int>(player + I64(kPlayerName) + 0x8);
    if (length > 32) return "";
    char Name [128];
    FString::UnicodeToUTF_8(Name, (wchar_t*)PlayerName, length);
    return string(Name);
#else
    string n = "";
    long PlayerName = Read<long>(player + I64(kPlayerName));
    if (IsValidAddress(PlayerName)) {
        UTF8 name[32] = "";
        UTF16 buf16[16] = {0};
        Read_data(PlayerName, 28, buf16);
        Utf16_To_Utf8(buf16, name, 28, strictConversion);
        n = string((const char *)name);
    }
    return n;
#endif
}

static string GetPlayerNation(long player) {
#if 0
    long PlayerName = Read<long>(player + I64(kPlayerName));
    int length = Read<int>(player + I64(kPlayerName) + 0x8);
    if (length > 32) return "";
    char Name [128];
    FString::UnicodeToUTF_8(Name, (wchar_t*)PlayerName, length);
    return string(Name);
#else
    string n = "";
    long Nation = Read<long>(player + I64(kNation));
    if (IsValidAddress(Nation)) {
        UTF8 name[32] = "";
        UTF16 buf16[16] = {0};
        Read_data(Nation, 28, buf16);
        Utf16_To_Utf8(buf16, name, 28, strictConversion);
        n = string((const char *)name);
    }
    return n;
#endif
}

static string GetPlayerUID(long player) {
#if 0
    long PlayerName = Read<long>(player + I64(kPlayerName));
    int length = Read<int>(player + I64(kPlayerName) + 0x8);
    if (length > 32) return "";
    char Name [128];
    FString::UnicodeToUTF_8(Name, (wchar_t*)PlayerName, length);
    return string(Name);
#else
    string n = "";
    long UID = Read<long>(player + I64(kPlayerUID));
    if (IsValidAddress(UID)) {
        UTF8 name[32] = "";
        UTF16 buf16[16] = {0};
        Read_data(UID, 28, buf16);
        Utf16_To_Utf8(buf16, name, 28, strictConversion);
        n = string((const char *)name);
    }
    return n;
#endif
}


static ImVec3 GetRelativeLocation(long actor) {
#if 1
    return Read<ImVec3>(Read<long>(actor + I64(kRootComponent)) + I64("0x1C0"));
#else
    return Read<ImVec3>(Read<long>(actor + I64(kRootComponent)) + I64(kRelativeLocation));
#endif
}

static string CameraManagerClassName, PlayerControllerClassName;
static bool (*LineOfSightTo)(void *controller, void *actor, ImVec3 bone_point, bool ischeck);
static bool GetLineOfSightTo(ImVec3 Coord) {
    if (LineOfSightTo == nullptr || !isfinite(Coord .x) || !isfinite(Coord .y) || !isfinite(Coord.z)) {
        return false;
    }
    if (isContain(CameraManagerClassName, "PlayerCameraManager") != 0 && isContain(PlayerControllerClassName, "PlayerController") != 0) {
        return LineOfSightTo(reinterpret_cast<void *>(PlayerController), reinterpret_cast<void *>(PlayerCameraManager), Coord, false);
    }
    return false;
}


static string GetClassName(int FNameID) {
    char *buf = (char *)malloc(64);
   long UName =GetGnamePtr();
    if (FNameID > 0 && FNameID < 2000000) {
        int page = FNameID / 16384;
        int index = FNameID % 16384;
        if (IsValidAddress(UName)) {
            uintptr_t pageAddr = Read<long>(UName + page * sizeof(uintptr_t));
            uintptr_t nameAddr = Read<long>(pageAddr + index * sizeof(uintptr_t)) + 0xC;
            Read_data(nameAddr, 64, buf);
        }
    }
    return buf;
}
static void GetModuleBaseAddress() {
    GWorld = GetWorldPtr();
    UName  = GetGnamePtr();
    if (!IsValidAddress(GWorld) || !IsValidAddress(UName)) return;
    
    PersistentLevel = Read<long>(GWorld + I64(kPersistentLevel));
    if (!IsValidAddress(PersistentLevel)) return;
    
    NetDriver = Read<long>(GWorld + I64(kNetDriver));//38
    if (!IsValidAddress(NetDriver)) return;
    
    long ServerConnection = Read<long>(NetDriver + I64(kServerConnection));//78
    if (!IsValidAddress(ServerConnection)) return;
    
    
    PlayerController = Read<long>(ServerConnection + I64(kPlayerController));
    if (!IsValidAddress(PlayerController)) PlayerController = Read<long>(ServerConnection + I64(klocalPlayerController));
    if (!IsValidAddress(PlayerController)) return;
    

    Character = Read<long>(PlayerController + I64(kPawn));
    
    PlayerCameraManager = Read<long>(PlayerController + I64(kPlayerCameraManager));
    if (!IsValidAddress(PlayerCameraManager)) return;
    
    ControlRotation = PlayerController + I64(kControlRotation);
    
    MyTeam = (int)Read<long>(PlayerController + I64(kMyTeam));
    CameraCache = Read<ImVec3>(PlayerCameraManager + I64(kCameraCache) + 0x10);
    POV = Read<MinimalViewInfo>(PlayerCameraManager + I64(kViewTarget) + 0x10);

    LineOfSightTo = (bool (*)(void *, void *, ImVec3, bool)) (Read<long>(Read<long>(PlayerController + 0x0) + I64(kLineOfSightTo)));
    CameraManagerClassName = GetClassName(Read<int>(PlayerCameraManager + 0x18));
    PlayerControllerClassName = GetClassName(Read<int>(PlayerController + 0x18));
}
static void (*AddControllerYawInput)(void *actot, float val);

//旋转
static void (*AddControllerRollInput)(void *actot, float val);

//移动Y轴
static void (*AddControllerPitchInput)(void *actot, float val);

static bool enabledAimbot = false;
static float get3dDistance(ImVec3 self, ImVec3 object, float divice) {
    ImVec3 xyz;
    xyz.x = self.x - object.x;
    xyz.y = self.y - object.y;
    xyz.z = self.z - object.z;
    return sqrt(pow(xyz.x, 2) + pow(xyz.y, 2) + pow(xyz.z, 2)) / divice;
}
static ImVec2 rotateAngleView(ImVec3 selfCoord, ImVec3 targetCoord) {
    
    float osx = targetCoord.x - selfCoord.x;
    float osy = targetCoord.y- selfCoord.y;
    float osz = targetCoord.z - selfCoord.z;
    
    return {(float) (atan2(osy, osx) * 180 / M_PI), (float) (atan2(osz, sqrt(osx * osx + osy * osy)) * 180 / M_PI)};
}
int 自瞄模式= 0;
static ImVec3 aimObjInfo;
static float getAngleDifference(float angle1, float angle2) {
    float diff = fmod(angle2 - angle1 + 180, 360) - 180;
    return diff < -180 ? diff + 360 : diff;
}
static float change(float num) {
    if (num < 0) {
        return abs(num);
    } else if (num > 0) {
        return num - num * 2;
    }
    return num;
}
bool isHookAngle = false;
static FRotator ToRotator(const ImVec3 &local, const ImVec3 &target) {
    ImVec3 rotation = local - target;
    float hyp = sqrt(rotation.x * rotation.x + rotation.y * rotation.y);
    FRotator newViewAngle;
    
    newViewAngle.Pitch = -atan(rotation.z / hyp) * (180.f / (float) 3.14159265358979323846);
    newViewAngle.Yaw = atan(rotation.y / rotation.x) * (180.f / (float) 3.14159265358979323846);
    newViewAngle.Roll = (float) 0.f;
    if (rotation.x >= 0.f)
        newViewAngle.Yaw += 180.0f;
    return newViewAngle;
}

// 追踪算法
static Tracking bulletTrack(ImVec3 MyLoc, bool isCusimg) {
    FRotator aim_angle;
    Tracking trackData;
    //自己位置
    ImVec3 MyLocation;
    if (isCusimg) {
        MyLocation = MyLoc;
    } else {
        MyLocation = POV.Location;
    }
    
    FRotator TargetRot = ToRotator({MyLocation.x, MyLocation.y, MyLocation.z}, {aimObjInfo.x, aimObjInfo.y, aimObjInfo.z});
    trackData.aim_angle = {TargetRot.Pitch,TargetRot.Yaw,0};
    
    return trackData;
}

//追踪函数原型
void (*UpdateVolleyShootParameters)(void *shootWeaponAddr, ImVec3 TargetLoc, ImVec3* StartLoc, Rotator* BulletRot, ImVec3* BulletDir);

void NewBulletTracking(void *shootWeaponAddr,ImVec3 TargetLoc, ImVec3* StartLoc, Rotator* BulletRot, ImVec3* BulletDir) {
    if (isHookAngle) {
        Tracking angle = bulletTrack(*StartLoc, true);
        BulletRot->x = angle.aim_angle.x;
        BulletRot->y = angle.aim_angle.y;
    }
    return UpdateVolleyShootParameters(shootWeaponAddr, TargetLoc, StartLoc, BulletRot, BulletDir);
}
bool intaa1=NO;
static void SetControlRotation(long Object,  ImVec3 AimPos) {
    bool bIsAIs = false;
    bIsAIs = Read<bool>(Object + I64(kbIsAI)) != 0;
    if(boquabots){
        if(bIsAIs){
            return;
            
        }
    }
    float Health = Read<float>(Object + I64(kHealth));
    long WeaponManagerComponent = Read<long>(Character + I64(kWeaponManagerComponent));
    if (!IsValidAddress(WeaponManagerComponent)) return;
    long CurrentWeaponReplicated = Read<long>(WeaponManagerComponent + I64(kCurrentWeaponReplicated));
    if (!IsValidAddress(CurrentWeaponReplicated)) return;
    long ShootWeaponComponent = Read<long>(CurrentWeaponReplicated + I64(kShootWeaponComponent));
    if (!IsValidAddress(ShootWeaponComponent)) return;
    long ShootWeaponEntityComp = Read<long>(CurrentWeaponReplicated + I64(kShootWeaponEntityComp));
    if (!IsValidAddress(ShootWeaponEntityComp)) return;
    bool bIsWeaponFiring = Read<bool>(Character + I64(kbIsWeaponFiring));
    bool bIsGunADS = Read<bool>(Character + I64(kbIsGunADS));
    int ShootMode = Read<int>(CurrentWeaponReplicated + I64(kShootMode));
    long MeshContainer = Read<long>(Character + 0x1a38);
    if (IsMode == 0) {
        if (ShootMode >= 1020) enabledAimbot = Read<int>(Character + I64(kbIsWeaponFiring)) == 1;
        else enabledAimbot = Read<int>(Character + I64(kbIsGunADS)) == 257 || Read<int>(Character + I64(kbIsGunADS)) == 1;
    } else if (IsMode == 1) {
        enabledAimbot = Read<int>(Character + I64(kbIsWeaponFiring)) == 1;
    } else if (IsMode == 2) {
        enabledAimbot = Read<int>(Character + I64(kbIsGunADS)) == 257 || Read<int>(Character + I64(kbIsGunADS)) == 1;
    } else if (IsMode == 3) {
        enabledAimbot = Read<int>(Character + I64(kbIsGunADS)) == 257 || Read<int>(Character + I64(kbIsGunADS)) == 1 || Read<int>(Character + I64(kbIsWeaponFiring)) == 1;
    } else if (IsMode == 4) {
        enabledAimbot = true;
    }
    if (enabledAimbot) {
        long RootComponent = Read<long>(Object + I64(kRootComponent));
        if (!IsValidAddress(RootComponent)) return;
        long selfFunction = Read<long>(Character + 0);
        
        // 函数偏移
        AddControllerYawInput = (void (*)(void *, float)) (Read<long>(selfFunction + I64(kYaw)));
        AddControllerRollInput = (void (*)(void *, float)) (Read<long>(selfFunction + I64(kRoll)));
        AddControllerPitchInput = (void (*)(void *, float)) (Read<long>(selfFunction + I64(kPitch)));
         
         
        long ControlRotation = PlayerController + I64(kControlRotation);
       
        
      
        // 子弹飞行时间
        float BulletFireSpeed = Read<float>(ShootWeaponEntityComp +I64(kBulletFireSpeed));
        float secFlyTime = get3dDistance(POV.Location, AimPos, BulletFireSpeed) * 1.2;
         
        ImVec3 Velocity;
        long CurrentVehicle = Read<long>(Object + I64(kCurrentVehicle));
        if (IsValidAddress(CurrentVehicle)) {
            ImVec3 LinearVelocity = Read<ImVec3>(CurrentVehicle + I64(kRepMovement));
            Velocity = LinearVelocity;
        } else {
            ImVec3 ComponentVelocity = Read<ImVec3>(RootComponent + I64(kComponentVelocity));
            Velocity = ComponentVelocity;
        }
         
        AimPos.x += Velocity.x * secFlyTime;
        AimPos.y += Velocity.y * secFlyTime;
        AimPos.z += Velocity.z * secFlyTime;
        string className = GetClassName(Read<int>(ShootWeaponEntityComp + 0x18));
        ImVec2 aimbotMouse = rotateAngleView(POV.Location, AimPos);
        float ScopeFov = Read<float>(Character + I64(kScopeFov));
        if (Read<int>(Character + I64(kbIsWeaponFiring)) == 1) {
            float recoil = Read<float>(ShootWeaponEntityComp + I64(kRecoilKickADS));
            float recoilTimes = IsRecoil - get3dDistance(POV.Location, AimPos, 10000);
            recoilTimes += get3dDistance(POV.Location, AimPos, 10000) * 0.2;
            if (ShootMode >= 1020) aimbotMouse.y -= recoilTimes * recoil;
        }
         if (!isfinite(aimbotMouse.x) || !isfinite(aimbotMouse.y)) {
             return;
         }
         ImVec2 aimbotMouseMove;
         
         aimbotMouseMove.x = change(getAngleDifference(aimbotMouse.x, Read<float>(ControlRotation + 0x4)) * IsSpeed);
         aimbotMouseMove.y = change(getAngleDifference(aimbotMouse.y, Read<float>(ControlRotation)) *IsSpeed);
         
         if (!isfinite(aimbotMouseMove.x) || !isfinite(aimbotMouseMove.y)) {
             return;
         }
        if(IsAimbot){
           if (IsIgnoreKnock == YES && Health == 0) {
                           return;
           }else {
                 if (AddControllerYawInput != NULL) {
                     AddControllerYawInput(reinterpret_cast<void *>(Character), aimbotMouseMove.x);
                 }
                 if (AddControllerPitchInput != NULL) {
                     AddControllerPitchInput(reinterpret_cast<void *>(Character), aimbotMouseMove.y);
                 }
                 if (AddControllerRollInput != NULL) {
                     AddControllerRollInput(reinterpret_cast<void *>(Character), 0);
                 }
           }
        }
     }
    bool bIsPressingFireBtn = Read<int>(Character + I64(kbIsWeaponFiring)) == 1;
  
    if (IsBulletTrack) {
    if (AimPos.x != 0 && AimPos.y != 0 && AimPos.z != 0 < (IsRadius)) {
            if (bIsPressingFireBtn || bIsGunADS || 静默开关) {
                    if (ShootWeaponEntityComp) {
                        aimObjInfo = AimPos;
                        isHookAngle = true;
                        uintptr_t shootWeaponVtable = Read<long>(ShootWeaponComponent + 0x0);
                        if (IsIgnoreKnock == YES && Health == 0) {
                                        return;
                                    } else {
                        if (UpdateVolleyShootParameters == nullptr) {
                            *(uintptr_t *) &UpdateVolleyShootParameters = Read<long>(shootWeaponVtable + 0x4f0);
                        }
                       
                        if (UpdateVolleyShootParameters != nullptr) {
                            *(uintptr_t *) (shootWeaponVtable + 0x4f0) = (uintptr_t)NewBulletTracking;
                        }
                    }
                }
            }
        } else {
            isHookAngle = false;
        }
    }else {
        isHookAngle = false;
    }
}
float currentAimRadius = 160;
float targetAimRadius = 160;
float transitionSpeed = 3; // 调整这个值来控制过渡的速度
static void SetAimRadius(float distance) {
    if (distance <= 1) {
        targetAimRadius = 100; // 近处目标的视觉范围较大
    } else if (distance >= 160) {
        targetAimRadius = 100; // 远处目标的视觉范围较小
    } else {
//        float t = (distance - 1) / (40 - 1);
//        targetAimRadius = 200 - t * (160 - 15); // 在0米到40米之间线性插值
    }
    
    if (currentAimRadius != targetAimRadius) {


        // 根据过渡速度调整半径
        float step = transitionSpeed;
        if (currentAimRadius < targetAimRadius) {
            currentAimRadius = fmin(currentAimRadius + step, targetAimRadius);
        } else {
            currentAimRadius = fmax(currentAimRadius - step, targetAimRadius);
        }
        IsRadius = currentAimRadius;
    }
}

void drawUnclosedRect(ImDrawList *draw, float center_x, float center_y, float center_w, float center_h, ImColor rgb, float thickness) {
draw->AddLine(ImVec2{center_x-(center_w/2),center_y-(center_h/2)},ImVec2{center_x-(center_w/4),center_y-(center_h/2)},ImGui::ColorConvertFloat4ToU32(rgb),1.0f);

draw->AddLine(ImVec2{center_x+(center_w/2),center_y-(center_h/2)},ImVec2{center_x+(center_w/4),center_y-(center_h/2)},ImGui::ColorConvertFloat4ToU32(rgb),1.0f);

draw->AddLine(ImVec2{center_x-(center_w/2),center_y+(center_h/2)},ImVec2{center_x-(center_w/4),center_y+(center_h/2)},ImGui::ColorConvertFloat4ToU32(rgb),1.0f);

draw->AddLine(ImVec2{center_x+(center_w/2),center_y+(center_h/2)},ImVec2{center_x+(center_w/4),center_y+(center_h/2)},ImGui::ColorConvertFloat4ToU32(rgb),1.0f);

draw->AddLine(ImVec2{center_x-(center_w/2),center_y-(center_h/2)},ImVec2{center_x-(center_w/2),center_y-(center_h/4)},ImGui::ColorConvertFloat4ToU32(rgb),1.0f);

draw->AddLine(ImVec2{center_x+(center_w/2),center_y-(center_h/2)},ImVec2{center_x+(center_w/2),center_y-(center_h/4)},ImGui::ColorConvertFloat4ToU32(rgb),1.0f);

draw->AddLine(ImVec2{center_x-(center_w/2),center_y+(center_h/2)},ImVec2{center_x-(center_w/2),center_y+(center_h/4)},ImGui::ColorConvertFloat4ToU32(rgb),1.0f);

draw->AddLine(ImVec2{center_x+(center_w/2),center_y+(center_h/2)},ImVec2{center_x+(center_w/2),center_y+(center_h/4)},ImGui::ColorConvertFloat4ToU32(rgb),1.0f);
}
static void DrawDirectionIndicator(ImDrawList* draw, ImVec2 center, ImVec2 targetPos, ImColor color, float size = 10.0f) {
    // Tính vector hướng từ trung tâm đến mục tiêu
    ImVec2 dir = ImVec2(targetPos.x - center.x, targetPos.y - center.y);
    
    // Chuẩn hóa vector
    float length = sqrt(dir.x * dir.x + dir.y * dir.y);
    if (length > 0) {
        dir.x /= length;
        dir.y /= length;
    }
    
    ImVec2 edgePos = ImVec2(center.x + dir.x * radiusalert, center.y + dir.y * radiusalert);
    
    // Tính toán các điểm tam giác
    ImVec2 perpendicular = ImVec2(-dir.y, dir.x); // Vector vuông góc
    
    ImVec2 p1 = ImVec2(edgePos.x + dir.x * size, edgePos.y + dir.y * size);
    ImVec2 p2 = ImVec2(edgePos.x + perpendicular.x * size - dir.x * size, 
                            edgePos.y + perpendicular.y * size - dir.y * size);
    ImVec2 p3 = ImVec2(edgePos.x - perpendicular.x * size - dir.x * size, 
                            edgePos.y - perpendicular.y * size - dir.y * size);
    if(IsStyle == 1) {
        draw->AddCircle(edgePos, 8.0f, color, 0, 6.0f);
    }
    if(IsStyle == 0) {
        draw->AddTriangle(ImVec2(p1.x, p1.y), ImVec2(p2.x, p2.y), ImVec2(p3.x, p3.y), color);
    }
    //draw->AddTriangle(ImVec2(p1.x, p1.y), ImVec2(p2.x, p2.y), ImVec2(p3.x, p3.y), ImColor(255, 255, 255));
}
static bool isScreenVisible(ImVec2 LocationScreen) {
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    if (LocationScreen.x > 0 && LocationScreen.x < screenSize.width &&
        LocationScreen.x > 0 && LocationScreen.y < screenSize.height) return true;
    else return false;
}
static void GetVehicleData(ImDrawList *draw, long vehicle, const char* name) {
    long VehicleCommon = Read<long>(vehicle + I64(kVehicleCommon));
    if (!IsValidAddress(VehicleCommon)) return;
    float dw = 40;
    float lineHeight = 2.0;
    float spaceHeight = 1.0;
    float rectHeight = lineHeight * 2 + spaceHeight;
    
    int HP = Read<float>(VehicleCommon + I64(kHP));
    float HPMax = Read<float>(VehicleCommon + I64(kHPMax));
    float Health = HP / HPMax * 100;

    float Fuel = Read<float>(VehicleCommon + I64(kFuel));
    float FuelMax = Read<float>(VehicleCommon + I64(kFuelMax));
    int Oil = Fuel / FuelMax * 100;

    float Health1 = Health / 100;
    float Oil1 = Oil / 100;

    ImVec3 worldLocation = GetRelativeLocation(vehicle);
    ImVec2 screenLocation = WorldToScreen(worldLocation, POV);

    int distance = ImVec3::Distance(worldLocation, POV.Location) / 100;
    if (Health != 0 && distance >= 10) {
        std::string str = std::string(name) + " (" + std::to_string(distance) + "M)";
        DrawTextWithOutlineX(draw, ImVec2(screenLocation.x - FontMenu->CalcTextSizeA(IsFontDraw, FLT_MAX, 0.0f, str.c_str()).x / 2, screenLocation.y), str, IsFontDraw, ImColor(255, 255, 0), outlineColor, drawOutline, FontMenu);
        std::string strs = IsEnglish == 0 ? "\uf52f: " + std::to_string(Oil) + "% & Health: " + std::to_string(HP) + ")" :  "(\uf52f: " + std::to_string(Oil) + "% & Máu: " + std::to_string(HP) + ")";
        DrawTextWithOutlineX(draw, ImVec2(screenLocation.x - FontMenu->CalcTextSizeA(IsFontDraw, FLT_MAX, 0.0f, strs.c_str()).x / 2, screenLocation.y + 11.0), strs, IsFontDraw, ImColor(255, 255, 0), outlineColor, drawOutline, FontMenu);
    }
}
static void GetSuppliesData(ImDrawList *draw, long Object, const char* name, ImColor color) {
    ImVec3 worldLocation = GetRelativeLocation(Object);
    ImVec2 screenLocation = WorldToScreen(worldLocation, POV);
    int distance = ImVec3::Distance(worldLocation, POV.Location) / 100;
    std::string str = std::string(name) + " (" + std::to_string(distance) + "M)";
    if (isEqual(name, IsEnglish == 0 ? "Dead Box" : "Hòm Xác") && distance > 80) return;
    if (distance <= 物资距离) {
        DrawTextWithOutlineX(draw, ImVec2(screenLocation.x - FontMenu->CalcTextSizeA(IsFontDraw, FLT_MAX, 0.0f, str.c_str()).x / 2, screenLocation.y), str, IsFontDraw, color, outlineColor, drawOutline, FontMenu);
    }
}

    

static void GetThrowData(ImDrawList *draw, long Object,const char* name) {
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    bool Item = Read<bool>(Object + I64(kbHidden));
    if (Item) return;
    ImVec3 worldLocation = GetRelativeLocation(Object);
    ImVec2 screenLocation = WorldToScreen(worldLocation, POV);
    int distance = ImVec3::Distance(worldLocation, POV.Location) / 100;
    if (distance <= 500.f) {
        //Circle3D(draw, worldLocation, 360, 500, ImColor(0, 255, 0));
        //Circle3D(draw, worldLocation, 360, 375, ImColor(255, 255, 0));
        //Circle3D(draw, worldLocation, 360, 250, ImColor(255, 0, 0));
        std::string str1;
        if(IsEnglish == 0){
    if (name == "Grenade") {
        str1 = "\uf1e2";
        Circle3D(draw, worldLocation, 360, 500, ImColor(255, 0, 0));
    } else if (name == "Burn") {
        str1 = "\uf06d";
        Circle3D(draw, worldLocation, 360, 375, ImColor(255, 255, 0));
    } else if (name == "Smoke") {
        str1 = "\uf0c2";
        Circle3D(draw, worldLocation, 360, 500, ImColor(0, 255, 0));
    } else if (name == "Stun") {
        str1 = "\uf0e7";
        Circle3D(draw, worldLocation, 360, 500, ImColor(0, 255, 0));
    } else {
        str1 = ""; // hoặc biểu tượng mặc định nếu không khớp
    }} else {
        if (name == "Lựu Đạn") {
        str1 = "\uf1e2";
        Circle3D(draw, worldLocation, 360, 500, ImColor(255, 0, 0));
    } else if (name == "Bom Xăng") {
        str1 = "\uf06d";
        Circle3D(draw, worldLocation, 360, 375, ImColor(255, 255, 0));
    } else if (name == "Bom Khói") {
        str1 = "\uf0c2";
        Circle3D(draw, worldLocation, 360, 500, ImColor(0, 255, 0));
    } else if (name == "Bom Choáng") {
        str1 = "\uf0e7";
        Circle3D(draw, worldLocation, 360, 500, ImColor(0, 255, 0));
    } else {
        str1 = ""; // hoặc biểu tượng mặc định nếu không khớp
    }
        
    }
        DrawTextWithOutlineX(draw, ImVec2(screenLocation.x - FontMenu->CalcTextSizeA(IsFontDraw * 1.5, FLT_MAX, 0.0f, str1.c_str()).x / 2, screenLocation.y - 5), str1, IsFontDraw * 1.5, ImColor(255, 255, 255), outlineColor, drawOutline, FontMenu);
        std::string str = std::string(name) + " (" + std::to_string(distance) + "M)";
        DrawTextWithOutlineX(draw, ImVec2(screenLocation.x - FontMenu->CalcTextSizeA(IsFontDraw, FLT_MAX, 0.0f, str.c_str()).x / 2, screenLocation.y + 12.5), str, IsFontDraw, ImColor(255, 0, 0), outlineColor, drawOutline, FontMenu);
    }
    if (distance <= 20.0f) {
        std::string strs = IsEnglish == 0 ? "\uf071 Warning " + std::string(name) + " \uf071" : "\uf071 Cảnh Báo " + std::string(name) + " \uf071";
        DrawTextWithOutlineX(draw, ImVec2(screenSize.width / 2 - FontMenu->CalcTextSizeA(IsFontDraw * 2, FLT_MAX, 0.0f, strs.c_str()).x / 2, 90.0), strs, IsFontDraw * 2, ImColor(255, 0, 0), outlineColor, drawOutline, FontMenu);
    }
}
static void GetData(ImDrawList *draw, long Object, const char* name) {
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    ImVec3 worldLocation = GetRelativeLocation(Object);
    ImVec2 screenLocation = WorldToScreen(worldLocation, POV);
    int distance = ImVec3::Distance(worldLocation, POV.Location) / 100;
    std::string str = std::string(name) + " (" + std::to_string(distance) + "M)";
    DrawTextWithOutlineX(draw, ImVec2(screenLocation.x - FontMenu->CalcTextSizeA(IsFontDraw, FLT_MAX, 0.0f, str.c_str()).x / 2, screenLocation.y), str, IsFontDraw, ImColor(255, 255, 255), outlineColor, drawOutline, FontMenu);
}
static void GetDatas(ImDrawList *draw, long Object, const char* name) {
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    ImVec3 worldLocation = GetRelativeLocation(Object);
    ImVec2 screenLocation = WorldToScreen(worldLocation, POV);
    int distance = ImVec3::Distance(worldLocation, POV.Location) / 100;
    std::string str = std::string(name) + " (" + std::to_string(distance) + "M)";
    DrawTextWithOutlineX(draw, ImVec2(screenLocation.x - FontMenu->CalcTextSizeA(IsFontDraw, FLT_MAX, 0.0f, str.c_str()).x / 2, screenLocation.y), str, IsFontDraw, ImColor(255, 0, 0), outlineColor, drawOutline, FontMenu);
}

static void GetPlayerInfo(ImDrawList *draw, long player, ImVec2 rootScreen, string playerName, string playerNation, string playerUID, float Health, float NearDeathBreath, int distance, bool isAI, int TeamID) {
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    ImVec2 center(screenSize.width/2, screenSize.height/2);
    //ImVec3 HeadWorldLocation = GetBonePos(player, "Head");
    ImVec3 HeadWorldLocation = GetBonePos(player, FName("Head"));
    HeadWorldLocation.z += 20.f;
    ImVec2 HeadScreenPos = WorldToScreen(HeadWorldLocation, POV);
    bool HeadSight = GetLineOfSightTo(HeadWorldLocation);
    ImVec3 LocationWorldPos = GetRelativeLocation(player);
    ImVec2 LocationScreen = WorldToScreen(LocationWorldPos, POV);
        bool isWeaponId = false;
    long  WeaponManagerComponent = Read<long>(player + I64(kWeaponManagerComponent));
    long CurrentWeaponReplicated = Read<long>(WeaponManagerComponent + I64(kCurrentWeaponReplicated));
    long ShootWeaponEntityComponent = Read<long>(CurrentWeaponReplicated + I64(kShootWeaponEntityComp));
    string WeaponName = GetWeaponIDName(Read<int>(ShootWeaponEntityComponent + I64(kWeaponId)));
    string text = string_format("%s", WeaponName.c_str());
    std::string str = text;
    ImVec2 Playersize;
    if (IsStyle == 0) {
    ImVec2 width = WorldToScreen(ImVec3(LocationWorldPos.x,LocationWorldPos.y,LocationWorldPos.z + 100), POV);
    ImVec2 height = WorldToScreen(ImVec3(LocationWorldPos.x,LocationWorldPos.y,LocationWorldPos.z + 100),POV);
    Playersize.x = (LocationScreen.y - width.y) / 2;
    Playersize.y = LocationScreen.y - height.y;
    } else {
    ImVec2 width = WorldToScreen(ImVec3(LocationWorldPos.x,LocationWorldPos.y,LocationWorldPos.z + 120 + (distance / 1.5)), POV);
    ImVec2 height = WorldToScreen(ImVec3(LocationWorldPos.x,LocationWorldPos.y,LocationWorldPos.z + 120 + (distance / 1.5)), POV);
    Playersize.x = (LocationScreen.y - width.y) / 2;
    Playersize.y = LocationScreen.y - height.y;
    }
    
    float BarWidth = 37.5;
    float BarHeight = 12.5;
    if(IsAlert360){
    if (!isScreenVisible(LocationScreen)) {
        if (Health > 0) {
        DrawDirectionIndicator(draw, center, LocationScreen, HeadSight ? ImColor(0, 255, 0) : ImColor(255, 0, 0), 7.5f);
        } else {
        DrawDirectionIndicator(draw, center, LocationScreen, ImColor(255, 255, 255), 7.5f);
        }
    }
    }
    if(IsHealth){
    if(IsStyle == 0) {
    //if (IsHealth) {
    float filled = (BarWidth * 2) * (Health > 0 ? Health : NearDeathBreath) / 100;
    float barX = LocationScreen.x - BarWidth;
    float barY = LocationScreen.y - Playersize.y - 5 - BarHeight;
    float barH = BarHeight;
    float tipSize = 4.0f; // Độ dài đầu nhọn

    // Tạo các điểm của đa giác (thanh máu có hai đầu nhọn)
    std::vector<ImVec2> healthBarPoints = {
        ImVec2(barX - tipSize, barY + barH / 2),                      // Mũi trái
        ImVec2(barX, barY),                                           // Góc trên trái
        ImVec2(barX + filled, barY),                                  // Góc trên phải
        ImVec2(barX + filled + tipSize, barY + barH / 2),             // Mũi phải
        ImVec2(barX + filled, barY + barH),                           // Góc dưới phải
        ImVec2(barX, barY + barH)                                     // Góc dưới trái
    };

    ImColor fillColor = (Health > 0)
        ? (isAI ? ImColor(0, 255, 0, 85) : ImColor(255, 0, 0, 85))
        : ImColor(255, 255, 255, 85);
    ImColor filledColor = (Health > 0)
        ? (isAI ? ImColor(0, 255, 0, 255) : ImColor(255, 0, 0, 255))
        : ImColor(255, 255, 255, 255);

    draw->AddConvexPolyFilled(healthBarPoints.data(), healthBarPoints.size(), fillColor);

    // Viền khung trắng (tương tự hình dạng)
    std::vector<ImVec2> borderPoints = {
        ImVec2(barX - tipSize, barY + barH / 2),
        ImVec2(barX, barY),
        ImVec2(barX + (BarWidth * 2), barY),
        ImVec2(barX + (BarWidth * 2) + tipSize, barY + barH / 2),
        ImVec2(barX + (BarWidth * 2), barY + barH),
        ImVec2(barX, barY + barH)
    };

    draw->AddPolyline(borderPoints.data(), borderPoints.size(), filledColor, true, 1.0f);
//}
    }
    if (IsStyle == 1) {
        // ===== Style 1 mới =====
        float barHeight = Playersize.y * 2; // chiều cao bằng box
        float barWidth = 3.0f;              // độ rộng thanh máu
        float barX = LocationScreen.x - Playersize.x - barWidth - 0.75; // sát mép trái box
        float barY = LocationScreen.y - Playersize.y;
        float filledHeight = (Health > 0 ? Health : NearDeathBreath) / 100.0f * barHeight;

        ImColor bgColor = ImColor(0, 0, 0, 175);
        ImColor fillColor = (Health > 0) ? ImColor(0, 255, 0, 255) : ImColor(255, 0, 0, 255);

        // Thanh nền
        draw->AddRectFilled(ImVec2(barX, barY), ImVec2(barX + barWidth, barY + barHeight), bgColor, 1.0f);

        // Thanh máu
        draw->AddRectFilled(ImVec2(barX, barY + (barHeight - filledHeight)), ImVec2(barX + barWidth, barY + barHeight), fillColor, 1.0f);
    }
    }
    if (IsStyle == 0) {
    if(IsNation || IsTeam){
    float barX = LocationScreen.x - BarWidth;
    float barY = LocationScreen.y - Playersize.y - 5 - BarHeight;
    float barWidthTotal = BarWidth * 2;
    float barHeight = BarHeight;

    // Team ID (nằm bên trong, mép trái)
    if(IsTeam){
        std::string str = std::to_string(TeamID);
        ImVec2 textSize = FontMenu->CalcTextSizeA(IsFontDraw - 1, FLT_MAX, 0.0f, str.c_str());
        float textX = barX + 2.0f; // cách mép trái 2px
        float textY = barY + (barHeight - textSize.y) / 2;
        DrawTextWithOutlineX(draw, ImVec2(textX, textY), str, IsFontDraw - 1, ImColor(255, 255, 255), outlineColor, drawOutline, FontMenu);
    }

    // Nation (nằm bên trong, mép phải)
    if(IsNation){
        std::string str = playerNation;
        ImVec2 textSize = FontMenu->CalcTextSizeA(IsFontDraw - 1, FLT_MAX, 0.0f, str.c_str());
        float textX = barX + barWidthTotal - textSize.x - 2.0f; // cách mép phải 2px
        float textY = barY + (barHeight - textSize.y) / 2;
        DrawTextWithOutlineX(draw, ImVec2(textX, textY), str, IsFontDraw - 1, ImColor(255, 255, 255), outlineColor, drawOutline, FontMenu);
    }
}

    if(IsName){
        std::string str = isAI ? "\uf544" : playerName;
        DrawTextWithOutlineX(draw, ImVec2(LocationScreen.x - FontMenu->CalcTextSizeA(IsFontDraw - 1, FLT_MAX, 0.0f, str.c_str()).x / 2, LocationScreen.y - Playersize.y - 15.80), str, IsFontDraw - 1, ImColor(255, 255, 255), outlineColor, drawOutline, FontMenu);
    }
    /*if(IsTeam){
        std::string str = std::to_string(TeamID);
        DrawTextWithOutlineX(draw, ImVec2(LocationScreen.x - FontMenu->CalcTextSizeA(IsFontDraw - 1, FLT_MAX, 0.0f, str.c_str()).x / 2, LocationScreen.y - Playersize.y - 15.80), str, IsFontDraw - 1, ImColor(255, 255, 255), outlineColor, drawOutline, FontMenu);
    }*/
    if(IsDistance){
        std::string str = std::to_string(distance) + "M";
        DrawTextWithOutlineX(draw, ImVec2(LocationScreen.x - FontMenu->CalcTextSizeA(IsFontDraw, FLT_MAX, 0.0f, str.c_str()).x / 2, LocationScreen.y + Playersize.y + 2.5), str, IsFontDraw, ImColor(255, 255, 255), outlineColor, drawOutline, FontMenu);
    }

    if(IsUID){
        std::string str = playerUID;
        DrawTextWithOutlineX(draw, ImVec2(LocationScreen.x - FontMenu->CalcTextSizeA(IsFontDraw, FLT_MAX, 0.0f, str.c_str()).x / 2, LocationScreen.y + Playersize.y + 13.5), str, IsFontDraw, ImColor(255, 0, 0), outlineColor, drawOutline, FontMenu);
    }


    if (!WeaponName.empty()) {
        isWeaponId = true;
        if (IsWeapon) {
            DrawTextWithOutlineX(draw, ImVec2(LocationScreen.x - FontMenu->CalcTextSizeA(IsFontDraw, FLT_MAX, 0.0f, str.c_str()).x / 2, LocationScreen.y - Playersize.y - 28), str, IsFontDraw, ImColor(255, 255, 0), outlineColor, drawOutline, FontMenu);
        }

    }
        if(IsLine){
        draw->AddLine(ImVec2(screenSize.width/2, 15), ImVec2(LocationScreen.x, LocationScreen.y - Playersize.y - 28), HeadLineColor(HeadSight), IsThicknessLine);
        draw->AddCircleFilled(ImVec2(screenSize.width/2, 15), 5, ImColor(255, 255, 255, 255), 0);
    }
    }
    if (IsStyle == 1) {
        // ===== Weapon (trên box) =====
if (IsWeapon) {
    std::string str = text;
    if (!WeaponName.empty()) {
        isWeaponId = true;

        // Kiểm tra tên vũ khí là "Fist" hoặc "Nắm Đấm"
        ImColor weaponColor;
        if (WeaponName == "Fist" || WeaponName == "Nắm Đấm") {
            weaponColor = ImColor(0, 255, 0); // xanh lá cây
        } else {
            weaponColor = ImColor(255, 255, 0); // vàng
        }

        // Vẽ tên vũ khí
        float textX = LocationScreen.x - FontMenu->CalcTextSizeA(IsFontDraw + 1, FLT_MAX, 0.0f, str.c_str()).x / 2;
        float textY = LocationScreen.y - Playersize.y - 12.0;
        DrawTextWithOutlineX(draw, ImVec2(textX, textY), str, IsFontDraw + 1, weaponColor, outlineColor, drawOutline, FontMenu);
    }
}

// ===== Name (dưới box) =====
if (IsName && !IsTeam && !IsNation) {
std::string str = isAI ? "Bot" : playerName;
        DrawTextWithOutlineX(draw, ImVec2(LocationScreen.x - FontMenu->CalcTextSizeA(IsFontDraw + 1, FLT_MAX, 0.0f, str.c_str()).x / 2,
                                          LocationScreen.y + Playersize.y + 1.25f),
                             str, IsFontDraw + 1, isAI ? ImColor(0, 150, 255) : ImColor(255, 255, 0), outlineColor, drawOutline, FontMenu);

}
if (!IsName && IsTeam && !IsNation) {
std::string str = std::to_string(TeamID);
        DrawTextWithOutlineX(draw, ImVec2(LocationScreen.x - FontMenu->CalcTextSizeA(IsFontDraw + 1, FLT_MAX, 0.0f, str.c_str()).x / 2,
                                          LocationScreen.y + Playersize.y + 1.25f),
                             str, IsFontDraw + 1, isAI ? ImColor(0, 150, 255) : ImColor(255, 255, 0), outlineColor, drawOutline, FontMenu);

}
if (!IsName && !IsTeam && IsNation) {
std::string str = playerNation;
        DrawTextWithOutlineX(draw, ImVec2(LocationScreen.x - FontMenu->CalcTextSizeA(IsFontDraw + 1, FLT_MAX, 0.0f, str.c_str()).x / 2,
                                          LocationScreen.y + Playersize.y + 1.25f),
                             str, IsFontDraw + 1, isAI ? ImColor(0, 150, 255) : ImColor(255, 255, 0), outlineColor, drawOutline, FontMenu);

}
if (IsName && IsTeam && !IsNation) {
std::string str = isAI ? std::to_string(TeamID) + " • Bot" : std::to_string(TeamID) + " • " + playerName;
        DrawTextWithOutlineX(draw, ImVec2(LocationScreen.x - FontMenu->CalcTextSizeA(IsFontDraw + 1, FLT_MAX, 0.0f, str.c_str()).x / 2,
                                          LocationScreen.y + Playersize.y + 1.25f),
                             str, IsFontDraw + 1, isAI ? ImColor(0, 150, 255) : ImColor(255, 255, 0), outlineColor, drawOutline, FontMenu);

}
if (IsName && !IsTeam && IsNation) {
std::string str = isAI ? "Bot" : playerName + " • " + playerNation;
        DrawTextWithOutlineX(draw, ImVec2(LocationScreen.x - FontMenu->CalcTextSizeA(IsFontDraw + 1, FLT_MAX, 0.0f, str.c_str()).x / 2,
                                          LocationScreen.y + Playersize.y + 1.25f),
                             str, IsFontDraw + 1, isAI ? ImColor(0, 150, 255) : ImColor(255, 255, 0), outlineColor, drawOutline, FontMenu);

}
if (!IsName && IsTeam && IsNation) {
std::string str = isAI ? std::to_string(TeamID) : std::to_string(TeamID) + " • " + playerNation;
        DrawTextWithOutlineX(draw, ImVec2(LocationScreen.x - FontMenu->CalcTextSizeA(IsFontDraw + 1, FLT_MAX, 0.0f, str.c_str()).x / 2,
                                          LocationScreen.y + Playersize.y + 1.25f),
                             str, IsFontDraw + 1, isAI ? ImColor(0, 150, 255) : ImColor(255, 255, 0), outlineColor, drawOutline, FontMenu);

}
if (IsName && IsTeam && IsNation) {
std::string str = isAI ? std::to_string(TeamID) + " • Bot" : std::to_string(TeamID) + " • " + playerName + " • " + playerNation;
        DrawTextWithOutlineX(draw, ImVec2(LocationScreen.x - FontMenu->CalcTextSizeA(IsFontDraw + 1, FLT_MAX, 0.0f, str.c_str()).x / 2,
                                          LocationScreen.y + Playersize.y + 1.25f),
                             str, IsFontDraw + 1, isAI ? ImColor(0, 150, 255) : ImColor(255, 255, 0), outlineColor, drawOutline, FontMenu);

}

// ===== Distance (dưới tên) =====
if (IsDistance) {
    std::string str = std::to_string(distance) + "m";
        DrawTextWithOutlineX(draw, ImVec2(LocationScreen.x - FontMenu->CalcTextSizeA(IsFontDraw + 1, FLT_MAX, 0.0f, str.c_str()).x / 2,
                                          LocationScreen.y + Playersize.y + 11.0f),
                             str, IsFontDraw + 1, ImColor(255, 255, 255), outlineColor, drawOutline, FontMenu);
}
if (IsUID) {
    std::string str = playerUID;
        DrawTextWithOutlineX(draw, ImVec2(LocationScreen.x - FontMenu->CalcTextSizeA(IsFontDraw + 1, FLT_MAX, 0.0f, str.c_str()).x / 2,
                                          LocationScreen.y + Playersize.y + 22.0f),
                             str, IsFontDraw + 1, ImColor(255, 0, 0), outlineColor, drawOutline, FontMenu);
}
    if(IsLine){
        draw->AddLine(ImVec2(screenSize.width/2, 15), ImVec2(HeadScreenPos.x, HeadScreenPos.y), HeadLineColor(HeadSight), IsThicknessLine);
        draw->AddCircleFilled(ImVec2(screenSize.width/2, 15), 5, ImColor(255, 255, 255, 255), 0);
    }
    }

    if(IsBox){
        drawUnclosedRect(ImGui::GetBackgroundDrawList(), LocationScreen.x, LocationScreen.y, Playersize.x + Playersize.x, Playersize.y + Playersize.y, HeadBoxColor(HeadSight), 1.0f);
    }
}
static void GetPlayerBone(ImDrawList *draw, long player, bool bIsAI, ImVec3* hitPoint_world, ImVec2* hitPoint_screen, ImVec2* root_screen,float distance) {
        FName BoneID[18] = {
            "Head", "neck_01", "spine_03", "spine_02", "spine_01", "pelvis",
            "upperarm_r", "lowerarm_r", "hand_r",
            "upperarm_l", "lowerarm_l", "hand_l",
            "thigh_r", "calf_r", "foot_r",
            "thigh_l", "calf_l", "foot_l"
        };
        /// 骨骼点
        bool Visible[18];
        ImVec2 Bones[18];
        ImVec3 Hitpart[18];
        ImVec2 rootScreen = WorldToScreen(GetBonePos(player, FName("Root")), POV);
        root_screen->x = rootScreen.x;
        root_screen->y = rootScreen.y;
        ImVec3 HeadLocation = GetBonePos(player, FName("Head"));
        HeadLocation.z += 7.5f;
        ImVec2 HeadScreenPos = WorldToScreen(HeadLocation, POV);
        ImVec2 width = WorldToScreen(ImVec3(HeadLocation.x,HeadLocation.y,HeadLocation.z + 100), POV);
        ImVec2 Playersize;
        Playersize.x = HeadScreenPos.y - width.y;
        float boxWidth = Playersize.x / 7.5f;
  
        
    for (int i = 0; i < 18; i++) {
        ImVec3 boneWorldLocation = GetBonePos(player, BoneID[i]);
        Hitpart[i] = boneWorldLocation;
        Visible[i] = GetLineOfSightTo(boneWorldLocation);
        Bones[i] = WorldToScreen(boneWorldLocation, POV);
    }
     
    if(IsBone){
        draw->AddCircle(ImVec2(HeadScreenPos.x, HeadScreenPos.y), boxWidth, BoneColos(Visible[0], Visible[0]), 0, IsThicknessBone);
        draw->AddLine(ImVec2(Bones[1].x, Bones[1].y), ImVec2(Bones[2].x, Bones[2].y), BoneColos(Visible[1], Visible[2]), IsThicknessBone);
        draw->AddLine(ImVec2(Bones[2].x, Bones[2].y), ImVec2(Bones[3].x, Bones[3].y), BoneColos(Visible[2], Visible[3]), IsThicknessBone);
        draw->AddLine(ImVec2(Bones[3].x, Bones[3].y), ImVec2(Bones[4].x, Bones[4].y), BoneColos(Visible[3], Visible[4]), IsThicknessBone);
        draw->AddLine(ImVec2(Bones[4].x, Bones[4].y), ImVec2(Bones[5].x, Bones[5].y), BoneColos(Visible[4], Visible[5]), IsThicknessBone);
        draw->AddLine(ImVec2(Bones[1].x, Bones[1].y), ImVec2(Bones[6].x, Bones[6].y), BoneColos(Visible[1], Visible[6]), IsThicknessBone);
        draw->AddLine(ImVec2(Bones[6].x, Bones[6].y), ImVec2(Bones[7].x, Bones[7].y), BoneColos(Visible[6], Visible[7]), IsThicknessBone);
        draw->AddLine(ImVec2(Bones[7].x, Bones[7].y), ImVec2(Bones[8].x, Bones[8].y), BoneColos(Visible[7], Visible[8]), IsThicknessBone);
        draw->AddLine(ImVec2(Bones[1].x, Bones[1].y), ImVec2(Bones[9].x, Bones[9].y), BoneColos(Visible[1], Visible[9]), IsThicknessBone);
        draw->AddLine(ImVec2(Bones[9].x, Bones[9].y), ImVec2(Bones[10].x, Bones[10].y), BoneColos(Visible[9], Visible[10]), IsThicknessBone);
        draw->AddLine(ImVec2(Bones[10].x, Bones[10].y), ImVec2(Bones[11].x, Bones[11].y), BoneColos(Visible[10], Visible[11]), IsThicknessBone);
        draw->AddLine(ImVec2(Bones[5].x, Bones[5].y), ImVec2(Bones[12].x, Bones[12].y), BoneColos(Visible[5], Visible[12]), IsThicknessBone);
        draw->AddLine(ImVec2(Bones[12].x, Bones[12].y), ImVec2(Bones[13].x, Bones[13].y), BoneColos(Visible[12], Visible[13]), IsThicknessBone);
        draw->AddLine(ImVec2(Bones[13].x, Bones[13].y), ImVec2(Bones[14].x, Bones[14].y), BoneColos(Visible[13], Visible[14]), IsThicknessBone);
        draw->AddLine(ImVec2(Bones[5].x, Bones[5].y), ImVec2(Bones[15].x, Bones[15].y), BoneColos(Visible[5], Visible[15]), IsThicknessBone);
        draw->AddLine(ImVec2(Bones[15].x, Bones[15].y), ImVec2(Bones[16].x, Bones[16].y), BoneColos(Visible[15], Visible[16]), IsThicknessBone);
        draw->AddLine(ImVec2(Bones[16].x, Bones[16].y), ImVec2(Bones[17].x, Bones[17].y), BoneColos(Visible[16], Visible[17]), IsThicknessBone);
    }
    switch (IsPart) {
        case 0:{

            int randomIndex =   arc4random_uniform(18);
            FName randomBoneID = BoneID[randomIndex];
          
            
            for (int i = 0; i < 18; i++) {
                ImVec3 boneWorldLocation = GetBonePos(player, randomBoneID);
                Hitpart[i] = boneWorldLocation;
                Visible[i] = GetLineOfSightTo(boneWorldLocation);
                Bones[i] = WorldToScreen(boneWorldLocation, POV);
                
               
            }
    
            for (int i = 0; i < 18; i++) {
                if (Visible[i]) {
                    if (intaa1) {
                        hitPoint_screen->x = Bones[i].x;
                        hitPoint_screen->y = Bones[i].y;
                      
                    } else {
                        // 其它枪 / 按順序攻击其它部位
                        if (Visible[0] && Visible[1] && Visible[2]) {
                            hitPoint_screen->x = Bones[i].x;
                            hitPoint_screen->y = Bones[i].y;
                            
                            hitPoint_world->x = Hitpart[i].x;
                            hitPoint_world->y = Hitpart[i].y;
                            hitPoint_world->z = Hitpart[i].z;
                            
                        }else if (Visible[0] && Visible[1]) {
                            hitPoint_screen->x = Bones[1].x;
                            hitPoint_screen->y = Bones[1].y;
                            hitPoint_world->x = Hitpart[1].x;
                            hitPoint_world->y = Hitpart[1].y;
                            hitPoint_world->z = Hitpart[1].z;
                        }else{
                            hitPoint_screen->x = Bones[i].x;
                            hitPoint_screen->y = Bones[i].y;
                            hitPoint_world->x = Hitpart[i].x;
                            hitPoint_world->y = Hitpart[i].y;
                            hitPoint_world->z = Hitpart[i].z;
                            
                       
                        }
                    }
                    break;
                }
            }
            break;
            
        }
        case 1:{
          for (int i = 0; i < 18; i++) {
                if (Visible[i]) {
                    if (intaa1) {
                        hitPoint_screen->x = Bones[i].x;
                        hitPoint_screen->y = Bones[i].y;
                      
                    } else {
                        // 其它枪 / 按順序攻击其它部位
                        if (Visible[0] && Visible[1] && Visible[2]) {
                            hitPoint_screen->x = Bones[i].x;
                            hitPoint_screen->y = Bones[i].y;
                            
                            hitPoint_world->x = Hitpart[i].x;
                            hitPoint_world->y = Hitpart[i].y;
                            hitPoint_world->z = Hitpart[i].z;
                            
                        }else if (Visible[0] && Visible[1]) {
                            hitPoint_screen->x = Bones[1].x;
                            hitPoint_screen->y = Bones[1].y;
                            hitPoint_world->x = Hitpart[1].x;
                            hitPoint_world->y = Hitpart[1].y;
                            hitPoint_world->z = Hitpart[1].z;
                        }else{
                            hitPoint_screen->x = Bones[i].x;
                            hitPoint_screen->y = Bones[i].y;
                            hitPoint_world->x = Hitpart[i].x;
                            hitPoint_world->y = Hitpart[i].y;
                            hitPoint_world->z = Hitpart[i].z;
                            
                       
                        }
                    }
                    break;
                }
            }
            break;
        }
        case 2:{
          for (int i = 0; i < 18; i++) {
                ImVec3 boneWorldLocation = GetBonePos(player, BoneID[3]);
                Hitpart[i] = boneWorldLocation;
                Visible[i] = GetLineOfSightTo(boneWorldLocation);
                Bones[i] = WorldToScreen(boneWorldLocation, POV);
                if (Visible[i]) {
                    if (intaa1) {
                        hitPoint_screen->x = Bones[i].x;
                        hitPoint_screen->y = Bones[i].y;
                      
                    } else {
                        // 其它枪 / 按順序攻击其它部位
                        if (Visible[0] && Visible[1] && Visible[2]) {
                            hitPoint_screen->x = Bones[i].x;
                            hitPoint_screen->y = Bones[i].y;
                            
                            hitPoint_world->x = Hitpart[i].x;
                            hitPoint_world->y = Hitpart[i].y;
                            hitPoint_world->z = Hitpart[i].z;
                            
                        }else if (Visible[0] && Visible[1]) {
                            hitPoint_screen->x = Bones[1].x;
                            hitPoint_screen->y = Bones[1].y;
                            hitPoint_world->x = Hitpart[1].x;
                            hitPoint_world->y = Hitpart[1].y;
                            hitPoint_world->z = Hitpart[1].z;
                        }else{
                            hitPoint_screen->x = Bones[i].x;
                            hitPoint_screen->y = Bones[i].y;
                            hitPoint_world->x = Hitpart[i].x;
                            hitPoint_world->y = Hitpart[i].y;
                            hitPoint_world->z = Hitpart[i].z;
                            
                       
                        }
                    }
                    break;
                }
            }
            break;
        }
    }
            CGSize screenSize = [UIScreen mainScreen].bounds.size;
            if (GetInsideFov(screenSize.width, screenSize.height, *hitPoint_screen, IsRadius)) {
                float tDistance = GetCenterOffsetForVector(*hitPoint_screen);
                if (tDistance <= IsRadius && tDistance < markDistance&& distance<=IsDistanceAimbot) {
                    needAdjustAim = true;
                    markDistance = tDistance;
                    markScreenPos = *hitPoint_screen;
                    SetControlRotation(player, *hitPoint_world);
                }
            }
}
void GetPlyaerData(long GWorld,long player) {
    if (player == Character) return;
    
    long RootComponent = Read<long>(player + I64(kRootComponent));
    if (!IsValidAddress(RootComponent)) return;
    
    /// 判断死亡
    bool bDead = Read<bool>(player + I64(kbDead)) & 1;
    if (bDead) return;

    bool bHidden = Read<bool>(player + I64(kbHidden));
    if (bHidden) return;
    
    /// 团队号
    int TeamID = Read<int>(player + I64(kTeamID));
    if (TeamID == MyTeam) return;
    
    /// 世界坐标
    ImVec3 LocationWorldPos = GetRelativeLocation(player);
    
    /// 距离
    int distance = ImVec3::Distance(LocationWorldPos, POV.Location) / 100;
    if (distance > IsDistancePlayer) return;
    
    /// 血量
    Health = Read<float>(player + I64(kHealth));
    float HealthMax = Read<float>(player + I64(kHealthMax));
    float NearDeathBreath = Read<float>(player + I64(kNearDeathBreath));
    
    /// 判断人机
    bool bIsAI = false;
    bIsAI = Read<bool>(player + I64(kbIsAI)) != 0;
    if(屏蔽人机){
        if(bIsAI){
            return;
            
        }
    }


    if (bIsAI) {
        botCount++; 
    } else {
        playerCount++;
    }
   
    ImVec3 hitPoint_world;
    ImVec2 hitPoint_screen, root_screen;
    
    GetPlayerInfo(ImGui::GetBackgroundDrawList(), player, root_screen, GetPlayerName(player), GetPlayerNation(player), GetPlayerUID(player), Health / HealthMax * 100, NearDeathBreath, distance, bIsAI, TeamID);
    GetPlayerBone(ImGui::GetBackgroundDrawList(), player, bIsAI, &hitPoint_world, &hitPoint_screen, &root_screen,distance);
    
}
void GetActors(ImDrawList *draw) {
    GetModuleBaseAddress();
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    isHookAngle = false;
    botCount = 0;
    playerCount = 0;
    pickItemCount = 0;
    tDistance = 0;
    needAdjustAim = false;
    markDistance = screenSize.width;
    markScreenPos = ImVec2(screenSize.width/2, screenSize.height);
    
    long GWorld = GetWorldPtr();
    if (!IsValidAddress(GWorld)) return;
    
    auto ActorsPointerAddress = DecryptActorsArray(PersistentLevel, 0xA0, 0x448);//--Actors
    if (!ActorsPointerAddress) ActorsPointerAddress = DecryptActorsArray(PersistentLevel, 0xB0, 0x488);//--ActorsForGC
    if (!ActorsPointerAddress) return;
    
    long ActorArray = Read<uint64_t>(ActorsPointerAddress);
    int ActorCount = Read<int>(ActorsPointerAddress + 0x8);
        
    if (ActorCount > 0 && ActorCount < 50000) {
        for (int i = 0; i < ActorCount; i++) {
            long actor = Read<long>(ActorArray + i * 8);
            
            string FName = GetFName(actor);
            if (FName.empty()) continue;
            
            if (isContain(FName, "PlayerPawn") ||
                isContain(FName, "PlayerCharacter") ||
                isContain(FName, "PlayerControllertSl") ||
                isContain(FName, "_PlayerPawn_TPlanAI_C") ||
                isContain(FName, "CharacterModelTaget")||
                isContain(FName, "FakePlayer_AIPawn")) GetPlyaerData(GWorld,actor);
                if(IsDeadBox){
                if (isContain(FName, "PlayerDeadListWrapper") || isContain(FName, "TrainingBoxList")|| isContain(FName, "CharacterDeadInventoryBox")) GetSuppliesData(ImGui::GetBackgroundDrawList(), actor,"Hòm Xác",ImVec4(1.0f, 1.0f, 1.0f, 1.0f));
                }
                if (IsRecovery) {
                    if (isContain(FName , "FirstAidbox")) GetSuppliesData(ImGui::GetBackgroundDrawList(), actor,IsEnglish == 0 ? "First Aid Box" : "Máu Lớn", colorRecovery);
                    if (isContain(FName , "Firstaid")) GetSuppliesData(ImGui::GetBackgroundDrawList(), actor,IsEnglish == 0 ? "First Aid Kit" : "Máu", colorRecovery);
                    if (isContain(FName , "Pills")) GetSuppliesData(ImGui::GetBackgroundDrawList(), actor,IsEnglish == 0 ? "Pills" : "Thuốc Giảm Đau", colorRecovery);
                    if (isContain(FName , "Drink")) GetSuppliesData(ImGui::GetBackgroundDrawList(), actor,IsEnglish == 0 ? "Drink" : "Nước Tăng Lực", colorRecovery);
                    if (isContain(FName , "Injection")) GetSuppliesData(ImGui::GetBackgroundDrawList(), actor,IsEnglish == 0 ? "Injection" : "Ống Tiêm", colorRecovery);
                }
                if(IsDeadBox){
                if (isContain(FName ,"PlayerDeadBox_")){
                    GetData(ImGui::GetBackgroundDrawList(), actor,IsEnglish == 0 ? "Dead Box" : "Hòm Xác");
                }
                }
                if(IsAirDrop){
                if (isContain(FName ,"AirDropBox")){
                    GetDatas(ImGui::GetBackgroundDrawList(), actor,IsEnglish == 0 ? "Air Drop" : "Hòm Thính");
                }
                }
                if(IsWarningBom){
                if (isContain(FName , "BP_Projectile_FragGrenade_C")){
                   GetThrowData(ImGui::GetBackgroundDrawList(), actor,IsEnglish == 0 ? "Grenade" : "Lựu Đạn");
                }
                if (isContain(FName , "BP_Projectile_BurnGrenade_C")){
                   GetThrowData(ImGui::GetBackgroundDrawList(), actor,IsEnglish == 0 ? "Burn" : "Bom Xăng");
                }
                if (isContain(FName , "BP_Projectile_SmokeBomb_C")){
                   GetThrowData(ImGui::GetBackgroundDrawList(), actor,IsEnglish == 0 ? "Smoke" : "Bom Khói");
                }
                if (isContain(FName , "BP_Projectile_StunGrenade_C")){
                   GetThrowData(ImGui::GetBackgroundDrawList(), actor,IsEnglish == 0 ? "Stun" : "Bom Choáng");
                }
                }

                if (IsAR) {
                    if (isContain(FName , "BP_Rifle_M416_Wrapper_C")) GetSuppliesData(ImGui::GetBackgroundDrawList(), actor,"M416", colorAR);


                    if (isContain(FName , "BP_Rifle_M16A4_Wrapper_C")) GetSuppliesData(ImGui::GetBackgroundDrawList(), actor,"M16A4", colorAR);


                    if (isContain(FName , "BP_Rifle_M762_Wrapper_C")) GetSuppliesData(ImGui::GetBackgroundDrawList(), actor,"M762", colorAR);


                    if (isContain(FName , "BP_Rifle_AKM_Wrapper_C")) GetSuppliesData(ImGui::GetBackgroundDrawList(), actor,"AKM", colorAR);


                    if (isContain(FName , "BP_Rifle_SCAR_Wrapper_C")) GetSuppliesData(ImGui::GetBackgroundDrawList(), actor,"SCAR-L", colorAR);


                    if (isContain(FName , "BP_Rifle_QBZ_Wrapper_C")) GetSuppliesData(ImGui::GetBackgroundDrawList(), actor,"QBZ", colorAR);


                    if (isContain(FName , "BP_Rifle_Groza_Wrapper_C")) GetSuppliesData(ImGui::GetBackgroundDrawList(), actor,"Groza", colorAR);


                    if (isContain(FName , "BP_Rifle_AUG_Wrapper_C")) GetSuppliesData(ImGui::GetBackgroundDrawList(), actor,"AUG", colorAR);


                    if (isContain(FName , "BP_Rifle_Mk47_Wrapper_C")) GetSuppliesData(ImGui::GetBackgroundDrawList(), actor,"Mk47", colorAR);


                    if (isContain(FName , "BP_Rifle_G36_Wrapper_C")) GetSuppliesData(ImGui::GetBackgroundDrawList(), actor,"G36C", colorAR);


                    if (isContain(FName , "BP_Rifle_HoneyBadger_Wrapper_C")) GetSuppliesData(ImGui::GetBackgroundDrawList(), actor,"Honey", colorAR);


                    if (isContain(FName , "BP_Rifle_FAMAS_Wrapper_C")) GetSuppliesData(ImGui::GetBackgroundDrawList(), actor,"FAMAS", colorAR);


                    if (isContain(FName , "BP_Rifle_ACE32_Wrapper_C")) GetSuppliesData(ImGui::GetBackgroundDrawList(), actor,"ACE32", colorAR);
                }

                if (IsSR) {
                    if (isContain(FName , "BP_Sniper_M24_Wrapper_C")) GetSuppliesData(ImGui::GetBackgroundDrawList(), actor,"M24", colorSR);


                    if (isContain(FName , "BP_Sniper_Kar98k_Wrapper_C")) GetSuppliesData(ImGui::GetBackgroundDrawList(), actor,"Kar98k", colorSR);
                    
                    
                    if (isContain(FName , "BP_Sniper_AWM_Wrapper_C")) GetSuppliesData(ImGui::GetBackgroundDrawList(), actor,"AWM", colorSR);
                    
                    
                    if (isContain(FName , "BP_Sniper_AMR_Wrapper_C")) GetSuppliesData(ImGui::GetBackgroundDrawList(), actor,"AMR", colorSR);
                    
                    
                    if (isContain(FName , "BP_Sniper_Mosin_Wrapper_C")) GetSuppliesData(ImGui::GetBackgroundDrawList(), actor,"Mosin", colorSR);
                    
                     
                    if (isContain(FName , "BP_Sniper_Win94_Wrapper_C")) GetSuppliesData(ImGui::GetBackgroundDrawList(), actor,"Win94", colorSR);


                    if (isContain(FName , "BP_Sniper_DRS_Wrapper_C")) GetSuppliesData(ImGui::GetBackgroundDrawList(), actor,"DRS", colorSR);
                }

                if (IsSMG) {
                    if (isContain(FName , "BP_MachineGun_Uzi_Wrapper_C")) GetSuppliesData(ImGui::GetBackgroundDrawList(), actor,"UZI", colorSMG);


                    if (isContain(FName , "BP_MachineGun_UMP9_Wrapper_C")) GetSuppliesData(ImGui::GetBackgroundDrawList(), actor,"UMP45", colorSMG);
                    
                    
                    if (isContain(FName , "BP_MachineGun_Vector_Wrapper_C")) GetSuppliesData(ImGui::GetBackgroundDrawList(), actor,"Vector", colorSMG);
                    
                    
                    if (isContain(FName , "BP_MachineGun_TommyGun_Wrapper_C")) GetSuppliesData(ImGui::GetBackgroundDrawList(), actor,"Thompson", colorSMG);
                    
                    
                    if (isContain(FName , "BP_MachineGun_PP19_Wrapper_C")) GetSuppliesData(ImGui::GetBackgroundDrawList(), actor,"Bizon", colorSMG);
                    
                    
                    if (isContain(FName , "BP_MachineGun_MP5K_Wrapper_C")) GetSuppliesData(ImGui::GetBackgroundDrawList(), actor,"MP5K", colorSMG);


                    if (isContain(FName , "BP_MachineGun_JS9_Wrapper_C")) GetSuppliesData(ImGui::GetBackgroundDrawList(), actor,"JS9", colorSMG);


                    if (isContain(FName , "BP_MachineGun_P90_Set_Wrapper_C")) GetSuppliesData(ImGui::GetBackgroundDrawList(), actor,"P90", colorSMG);
                }

                if (IsShotGun) {
                    if (isContain(FName , "BP_ShotGun_S686_Wrapper_C")) GetSuppliesData(ImGui::GetBackgroundDrawList(), actor,"S686", colorShotGun);


                    if (isContain(FName , "BP_ShotGun_S1897_Wrapper_C")) GetSuppliesData(ImGui::GetBackgroundDrawList(), actor,"S1897", colorShotGun);
                    
                    
                    if (isContain(FName , "BP_ShotGun_S12K_Wrapper_C")) GetSuppliesData(ImGui::GetBackgroundDrawList(), actor,"S12K", colorShotGun);
                    
                    
                    if (isContain(FName , "BP_ShotGun_DP12_Wrapper_C")) GetSuppliesData(ImGui::GetBackgroundDrawList(), actor,"DBS", colorShotGun);
                    
                    
                    if (isContain(FName , "BP_ShotGun_M1014_Wrapper_C")) GetSuppliesData(ImGui::GetBackgroundDrawList(), actor,"M1014", colorShotGun);
                    
                    
                    if (isContain(FName , "BP_ShotGun_Neostead2000_Wrapper_C")) GetSuppliesData(ImGui::GetBackgroundDrawList(), actor,"NS2000", colorShotGun);
                }

                if (IsBom) {
                    if (isContain(FName , "BP_Grenade_Burn_Weapon_Wrapper_C")) GetSuppliesData(ImGui::GetBackgroundDrawList(), actor,IsEnglish == 0 ? "Burn" : "Bom Xăng", colorBom);

                    if (isContain(FName , "BP_Grenade_Shoulei_Weapon_Wrapper_C")) GetSuppliesData(ImGui::GetBackgroundDrawList(), actor,IsEnglish == 0 ? "Grenade" : "Lựu Đạn", colorBom);

                    if (isContain(FName , "BP_Grenade_Smoke_Weapon_Wrapper_C")) GetSuppliesData(ImGui::GetBackgroundDrawList(), actor,IsEnglish == 0 ? "Smoke" : "Bom Khói", colorBom);
                }

                if (IsBullet) {
                    if (isContain(FName , "BP_Ammo_556mm")) GetSuppliesData(ImGui::GetBackgroundDrawList(), actor,"5,56mm", colorBullet);

                    if (isContain(FName , "BP_Ammo_762mm")) GetSuppliesData(ImGui::GetBackgroundDrawList(), actor,"7,62mm", colorBullet);

                    if (isContain(FName , "BP_Ammo_300Magnum")) GetSuppliesData(ImGui::GetBackgroundDrawList(), actor,"300 Magnum", colorBullet);

                    if (isContain(FName , "BP_Ammo_9mm")) GetSuppliesData(ImGui::GetBackgroundDrawList(), actor,"9mm", colorBullet);

                    if (isContain(FName , "BP_Ammo_45ACP")) GetSuppliesData(ImGui::GetBackgroundDrawList(), actor,".45 ACP", colorBullet);

                    if (isContain(FName , "BP_Ammo_12Guage")) GetSuppliesData(ImGui::GetBackgroundDrawList(), actor,"Cỡ 12", colorBullet);

                    if (isContain(FName , "BP_Ammo_57mm")) GetSuppliesData(ImGui::GetBackgroundDrawList(), actor,"5.7 mm", colorBullet);
                }

                if (IsArmor) {
                    if (isContain(FName , "BP_Helmet_Lv3")) GetSuppliesData(ImGui::GetBackgroundDrawList(), actor,IsEnglish == 0 ? "Helmet Lv3" : "Mũ Lv3", colorArmor);

                    if (isContain(FName , "BP_Armor_Lv3")) GetSuppliesData(ImGui::GetBackgroundDrawList(), actor,IsEnglish == 0 ? "Armor Lv3" : "Giáp Lv3", colorArmor);

                    if (isContain(FName , "BP_Bag_Lv3")) GetSuppliesData(ImGui::GetBackgroundDrawList(), actor,IsEnglish == 0 ? "Bag Lv3" : "Balo Lv3", colorArmor);
                }
                
                if (IsScope) {
                    if (isContain(FName , "BP_MZJ_3X")) GetSuppliesData(ImGui::GetBackgroundDrawList(), actor,"3X", colorScope);


                    if (isContain(FName , "BP_MZJ_4X")) GetSuppliesData(ImGui::GetBackgroundDrawList(), actor,"4X", colorScope);


                    if (isContain(FName , "BP_MZJ_6X")) GetSuppliesData(ImGui::GetBackgroundDrawList(), actor,"6X", colorScope);


                    if (isContain(FName , "BP_MZJ_8X")) GetSuppliesData(ImGui::GetBackgroundDrawList(), actor,"8X", colorScope);


                    if (isContain(FName , "BP_MZJ_2X")) GetSuppliesData(ImGui::GetBackgroundDrawList(), actor,"2X", colorScope);


                    if (isContain(FName , "BP_MZJ_QX")) GetSuppliesData(ImGui::GetBackgroundDrawList(), actor,"Holo", colorScope);


                    if (isContain(FName , "BP_MZJ_HD")) GetSuppliesData(ImGui::GetBackgroundDrawList(), actor,IsEnglish == 0 ? "Red Dot" : "Chấm Đỏ", colorScope);
                }
                
                if (IsVehicle) {
                    //车辆显示
                    if (isContain(FName, "_UTV_C")) GetVehicleData(ImGui::GetBackgroundDrawList(), actor, "UTV");//大蹦蹦
                    else if (isContain(FName, "_VH_Bigfoot_")) GetVehicleData(ImGui::GetBackgroundDrawList(), actor, IsEnglish == 0 ? "Monster Truck" : "Xe Quái Vật");//大脚车
                    else if (isContain(FName, "Buggy")) GetVehicleData(ImGui::GetBackgroundDrawList(), actor, "Buggy");//蹦蹦
                    else if (isContain(FName, "UAZ")) GetVehicleData(ImGui::GetBackgroundDrawList(), actor, "UAZ");//吉普
                    else if (isContain(FName, "Dacia")) GetVehicleData(ImGui::GetBackgroundDrawList(), actor,"Dacia");//轿车
                    else if (isContain(FName, "DAcia")) GetVehicleData(ImGui::GetBackgroundDrawList(), actor,"Dacia");//轿车
                    else if (isContain(FName, "Scooter")) GetVehicleData(ImGui::GetBackgroundDrawList(), actor, IsEnglish == 0 ? "Scooter" : "Xe Tay Ga");//踏板车
                    else if (isContain(FName, "Rony")) GetVehicleData(ImGui::GetBackgroundDrawList(), actor, IsEnglish == 0 ? "Rony" : "Xe Bán Tải");
                    else if (isContain(FName, "MiniBus")) GetVehicleData(ImGui::GetBackgroundDrawList(), actor, IsEnglish == 0 ? "Bus" : "Xe Buýt");//小巴士
                    else if (isContain(FName, "Snowmobile")) GetVehicleData(ImGui::GetBackgroundDrawList(), actor, IsEnglish == 0 ? "Snowbike" : "Xe Trượt Tuyết");//雪橇
                    else if (isContain(FName, "PG117")) GetVehicleData(ImGui::GetBackgroundDrawList(), actor, IsEnglish == 0 ? "PG117" : "Thuyền To");//大船
                    else if (isContain(FName, "_Motorcycle_")) GetVehicleData(ImGui::GetBackgroundDrawList(), actor, IsEnglish == 0 ? "Motorbike" :  "Xe Máy");//摩托
                    else if (isContain(FName, "_Snowbike_C")) GetVehicleData(ImGui::GetBackgroundDrawList(), actor, IsEnglish == 0 ? "Snowbike" :  "Xe Trượt Tuyết");//摩托
                    else if (isContain(FName, "_MotorcycleCart_")) GetVehicleData(ImGui::GetBackgroundDrawList(), actor, IsEnglish == 0 ? "Motorbike Cart" :  "Xe 3 Bánh");//三轮摩托
                    else if (isContain(FName, "BP_VH_Tuk")) GetVehicleData(ImGui::GetBackgroundDrawList(), actor, "Tuk");//三轮摩托
                    else if (isEqual(FName, "_ny_01_C")) GetVehicleData(ImGui::GetBackgroundDrawList(), actor,  IsEnglish == 0 ? "Pickup Truck" : "Xe Bán Tải");//皮卡
                    else if (isEqual(FName, "ckUp_07_C")) GetVehicleData(ImGui::GetBackgroundDrawList(), actor,  IsEnglish == 0 ? "Pickup Truck" : "Xe Bán Tải");//皮卡
                    else if (isContain(FName, "PickUp_0")) GetVehicleData(ImGui::GetBackgroundDrawList(), actor,  IsEnglish == 0 ? "Pickup Truck" : "Xe Bán Tải");//皮卡
                    else if (isContain(FName, "VH_BRDM_C")) GetVehicleData(ImGui::GetBackgroundDrawList(), actor, IsEnglish == 0 ? "BRDM" : "Xe Bọc Thép");//蟑螂车
                    else if (isContain(FName, "wing_")) GetVehicleData(ImGui::GetBackgroundDrawList(), actor, IsEnglish == 0 ? "Helicopter" : "Trực Thăng");//蟑螂车
                    else if (isContain(FName, "AquaRail")) GetVehicleData(ImGui::GetBackgroundDrawList(), actor, IsEnglish == 0 ? "Small Boat" : "Thuyển Nhỏ");//摩托艇
                    else if (isContain(FName, "VH_Tank_Beta_C")) GetVehicleData(ImGui::GetBackgroundDrawList(), actor, IsEnglish == 0 ? "Tank" : "Xe Tăng");//坦克
                    else if (isContain(FName, "Mirado_open") || isContain(FName, "Mirado_close")) GetVehicleData(ImGui::GetBackgroundDrawList(), actor, "Mirado");//跑车
                    else if (isContain(FName, "Mirado")) GetVehicleData(ImGui::GetBackgroundDrawList(), actor, "Mirado");//跑车
                    else if (isContain(FName, "_CoupeRB_")) GetVehicleData(ImGui::GetBackgroundDrawList(), actor, "Couple");//跑车
                    else if (isContain(FName, "VH_Motorglider_C")) GetVehicleData(ImGui::GetBackgroundDrawList(), actor, IsEnglish == 0 ? "Plane" : "Máy Bay");//滑翔机
                    else if (isContain(FName, "VH_ATV")) GetVehicleData(ImGui::GetBackgroundDrawList(), actor, "ATV");//滑翔机
                    else if (isContain(FName, "VH_Camel_C")) GetVehicleData(ImGui::GetBackgroundDrawList(), actor, IsEnglish == 0 ? "Camel" : "Lạc Đà");//滑翔机
                    else if (isContain(FName, "VH_Horse_C")) GetVehicleData(ImGui::GetBackgroundDrawList(), actor, IsEnglish == 0 ? "Horse" : "Ngựa");
                    else if (isContain(FName, "VH_Broom_C")) GetVehicleData(ImGui::GetBackgroundDrawList(), actor, IsEnglish == 0 ? "Broom" : "Chổi");
                }
            }
        }
    //LDVQuang *APIKey = [[LDVQuang alloc] init];
    //NSArray *components = [[LDVQuang getCurrentKey] componentsSeparatedByString:@"-"];
    //if (components.count >= 1) {
        //NSString *aliasKey = [components objectAtIndex:0];
        //char* ServerName = (char*) [aliasKey cStringUsingEncoding:NSUTF8StringEncoding];
        //std::string str = ServerName;
        //DrawTextWithOutlineX(draw, ImVec2(screenSize.width / 2 - FontMenu->CalcTextSizeA(IsFontDraw * 1.5, FLT_MAX, 0.0f, str.c_str()).x / 2, 10), str, IsFontDraw * 1.5, ImColor(255, 255, 255), outlineColor, drawOutline, FontMenu);
    //}
    if(IsAimbot||IsBulletTrack){
    if(IsFov){
        draw->AddCircle(ImVec2(screenSize.width / 2, screenSize.height / 2), IsRadius, ImColor(255, 255, 255), 0, 1.0);
    }
    if(IsLineAimbot){
        draw->AddLine(ImVec2(screenSize.width/2, screenSize.height), ImVec2(markScreenPos.x, markScreenPos.y), ImColor(255, 255, 0), 1.0);
    }
    }
    
    if (IsNumberPlayer) {
        if (IsStyle == 0) {
        if (playerCount > 0 || botCount > 0) {
    float fontSize = IsFontDraw * 2.25f;
    float spacing = 5.0f; // khoảng cách giữa các phần tử

    // Các chuỗi cần vẽ
    std::string iconPlayer = "\uf007";
    std::string playerStr = std::to_string(playerCount);
    std::string pipeStr = "|";
    std::string botStr = std::to_string(botCount);
    std::string iconBot = "\uf544";

    // Tính chiều rộng của từng phần
    float iconPlayerW = FontMenu->CalcTextSizeA(fontSize, FLT_MAX, 0.0f, iconPlayer.c_str()).x;
    float playerStrW = FontMenu->CalcTextSizeA(fontSize, FLT_MAX, 0.0f, playerStr.c_str()).x;
    float pipeW       = FontMenu->CalcTextSizeA(fontSize, FLT_MAX, 0.0f, pipeStr.c_str()).x;
    float botStrW     = FontMenu->CalcTextSizeA(fontSize, FLT_MAX, 0.0f, botStr.c_str()).x;
    float iconBotW    = FontMenu->CalcTextSizeA(fontSize, FLT_MAX, 0.0f, iconBot.c_str()).x;

    // Tổng chiều rộng
    float totalWidth = iconPlayerW + spacing + playerStrW + spacing + pipeW + spacing + botStrW + spacing + iconBotW;

    // Tọa độ X bắt đầu từ giữa màn hình trừ nửa tổng chiều rộng
    float startX = screenSize.width / 2.0f - totalWidth / 2.0f;
    float y = 50.0f; // vị trí Y cố định

    // === VẼ icon player (trắng) ===
    DrawTextWithOutlineX(draw, ImVec2(startX, y), iconPlayer.c_str(), fontSize, ImColor(255, 255, 255), outlineColor, drawOutline, FontMenu);
    startX += iconPlayerW + spacing;

    // === VẼ số player (đỏ) ===
    DrawTextWithOutlineX(draw, ImVec2(startX, y), playerStr.c_str(), fontSize, ImColor(255, 0, 0), outlineColor, drawOutline, FontMenu);
    startX += playerStrW + spacing;

    // === VẼ dấu | (trắng) ===
    DrawTextWithOutlineX(draw, ImVec2(startX, y), pipeStr.c_str(), fontSize, ImColor(255, 255, 255), outlineColor, drawOutline, FontMenu);
    startX += pipeW + spacing;

    // === VẼ số bot (xanh lá) ===
    DrawTextWithOutlineX(draw, ImVec2(startX, y), botStr.c_str(), fontSize, ImColor(0, 255, 0), outlineColor, drawOutline, FontMenu);
    startX += botStrW + spacing;

    // === VẼ icon bot (trắng) ===
    DrawTextWithOutlineX(draw, ImVec2(startX, y), iconBot.c_str(), fontSize, ImColor(255, 255, 255), outlineColor, drawOutline, FontMenu);
}


    if (playerCount > 0 || botCount > 0) {
        /*DrawTextWithOutlineX(draw, ImVec2(screenSize.width / 2 + 12.5, 50), std::to_string(botCount).c_str(), IsFontDraw * 2.25, ImColor(0, 255, 0), outlineColor, drawOutline, FontMenu);
        DrawTextWithOutlineX(draw, ImVec2(screenSize.width / 2 - FontMenu->CalcTextSizeA(IsFontDraw * 2.25, FLT_MAX, 0.0f, "|").x / 2, 50), "|", IsFontDraw * 2.25, ImColor(255, 255, 255), outlineColor, drawOutline, FontMenu);
        DrawTextWithOutlineX(draw, ImVec2(screenSize.width / 2 - FontMenu->CalcTextSizeA(IsFontDraw * 2.25, FLT_MAX, 0.0f, std::to_string(playerCount).c_str()).x - 12.5, 50), std::to_string(playerCount).c_str(), IsFontDraw * 2.25, ImColor(255, 0, 0), outlineColor, drawOutline, FontMenu);*/
        

    }
        }
if (IsStyle == 1)
{
    int totalEnemies = playerCount + botCount;

    if (totalEnemies > 0) // Chỉ hiển thị khi có kẻ địch
    {
        // Nền đen mờ
        ImGui::SetNextWindowBgAlpha(0.6f);

        // Nếu có kẻ địch -> viền xanh lá
        ImGui::PushStyleColor(ImGuiCol_Border, ImColor(0, 255, 0).Value);

        // Bo tròn
        ImGui::PushStyleVar(ImGuiStyleVar_WindowRounding, 7.5f);

        // Tăng padding ngang để cửa sổ rộng hơn
        ImGui::PushStyleVar(ImGuiStyleVar_WindowPadding, ImVec2(10.0f, 0)); // 20 px ngang, 10 px dọc

        // Căn giữa cửa sổ theo kích thước màn hình
        ImVec2 windowPos = ImVec2(screenSize.width / 2.0f, 40.0f);
        ImGui::SetNextWindowPos(windowPos, ImGuiCond_Always, ImVec2(0.5f, 0.0f));

        // Bắt đầu cửa sổ
        ImGui::Begin(
            "Tổng số địch xung quanh",
            nullptr,
            ImGuiWindowFlags_NoResize | ImGuiWindowFlags_NoCollapse | ImGuiWindowFlags_NoScrollbar | ImGuiWindowFlags_NoTitleBar | ImGuiWindowFlags_AlwaysAutoResize
        );

        // Tính kích thước text
        char buffer[64];
        snprintf(buffer, sizeof(buffer), IsEnglish == 0 ? "Total enemies around you: %d" : "Tổng số địch xung quanh: %d", totalEnemies);
        ImVec2 textSize = ImGui::CalcTextSize(buffer);

        // Căn giữa chữ theo chiều ngang và chiều dọc
        ImVec2 windowSize = ImGui::GetWindowSize();
        ImGui::SetCursorPosX((windowSize.x - textSize.x) * 0.5f);
        ImGui::SetCursorPosY((windowSize.y - textSize.y) * 0.5f);

        ImGui::Text("%s", buffer);

        ImGui::End();

        // Trả lại style
        ImGui::PopStyleVar(2); // WindowRounding + WindowPadding
        ImGui::PopStyleColor();
    }
}


    }

    
}
#pragma mark - 启动

static void __attribute__((constructor)) initialize() {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *BundID = [infoDictionary objectForKey:@"CFBundleIdentifier"];

    if([BundID containsString:NSSENCRYPT("ig")]){
        kUWorld = "0x106937C24";
        kGNames = "0x104AB914C";
        kBonePos = "0x10318F2E0";
    }

    if([BundID containsString:NSSENCRYPT("rekoo")]){
        kUWorld = "0x106AB8C04";
        kGNames = "0x104C3A12C";
        kBonePos = "0x1033102C0";
    }

    if([BundID containsString:NSSENCRYPT("kr")]){
        kUWorld = "0x106AE22F8";
        kGNames = "0x104C630A0";
        kBonePos = "0x103339184";
    }

    if([BundID containsString:NSSENCRYPT("vn")]){
        kUWorld = "0x1067DCAD4";
        kGNames = "0x104A847E0";
        kBonePos = "0x1030DD60C";
    }

    if([BundID containsString:NSSENCRYPT("imobile")]){
        kUWorld = "0x102FF09F0";
        kGNames = "0x105E9462C";
        kBonePos = "0x105EE9C04";
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        FName::GNames = (TNameEntryArray *)GetGnamePtr();
    });
}
