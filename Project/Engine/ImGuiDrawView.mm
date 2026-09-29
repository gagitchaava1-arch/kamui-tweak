#import <Foundation/Foundation.h>
#import <os/log.h>
#import "pthread.h"
#include <cmath>
#include <deque>
#include "ESP/Tools.h"
#include <vector>
#include "Vector/Vector3.h"
#include "Vector/Vector2.h"
#include <fstream>
#import <dlfcn.h>
#include <map>
#import "ESP/UE4.h"
#include "SDK.hpp"
#include <mach-o/dyld.h>
#import <UIKit/UIKit.h>
#include <unordered_map>

NSString *bundle;
uint64_t GUObjectArray;
uint64_t GNameFun;

typedef uintptr_t kaddr;
using namespace std;
using namespace SDK;

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

extern bool IsIgnoreKnock;
bool IsValidAddress(kaddr addr) {
    return addr > 0x100000000 && addr < 0x2000000000;
}



uintptr_t UE4;
//kaddr module= (unsigned long)_dyld_get_image_vmaddr_slide(0);
extern int IsEnglish;
bool  VehicleAimNearCrosshair = false;
bool  VehicleVisCheck         = false;

float VehicleAimConeDeg   = 8.0f;
float VehicleAimHeightZ   = 50.0f;
float SilentAimPingMs     = 0.0f;
ASTExtraPlayerController *g_LocalController = 0;
#define W2S(w, s) UGameplayStatics::ProjectWorldToScreen(g_PlayerController, w, false, s)
namespace Options
{
int boxtype = 1;
int healthbartype = 0;
int Nationtype = 2;
int DirectionLineSize = 70;
int VehicleDirectionLineSize = 100;
int offscreen_range = 40;
int max_distance_offscreen = 400;
int playersdistancessize = 600;
bool esp_Outline = true;
int distance_Radar = 150;
}

bool initkillmsgopen = NO;

long l1 = 0xFF544;
long l2 = 0xFFFFF;
//const char * stack230 = 0;//index of class array 75
int stack_20;
NSString * val_1;
NSString * val_x2 ;
int sort = 1,sort_1 = 3;
long RAMADDRESS = 0x4332443;//0x4332443 + F = 0x4332452
bool stack_193 = NO;

//extern bool  AntiHooK;
extern int AlivePlayerNum, AliveTeamNum, PlayerNum, minutes, seconds, Kill;
bool bonn =false;
bool ESPGAME = true;
float CenterX=0.0f;
float CenterY=0.0f;
bool DrawPlayerLine = true;
bool TeleportEnemy = false;
bool SilentGodView = false;
bool AutoFlashUPP = false;
bool FastScope = false;
bool IsAimlock = false;
bool IsBunnyJUMP = false;
bool FastReload = false;
bool IsOneShotKill = false;
bool goodview = false;
bool AttackTeammates = false;
bool FlashUPP = false;
bool GiveUp = false;
bool NoGravity = false;
float flashFuckk1 = 5.f;
bool IsAutofire = false;
bool IsNorecoil = false;
bool IsNorecoil2 = false;
bool INTAHIT =false;
bool tam7mau = false;
bool xoaytam = false;
bool autotap =false;
bool showdame =true;
bool BagGun =false;
bool skinlobby =false;
bool Snow = false;
bool Rain =false;
bool CrazyCar =false;
bool CarSpin =false;
bool WallHackCar =false;
bool infinitycar =false;
bool carspring =false;
float SpinCar360 =0;
bool SPINCHECK =false;
float RotatorSpinBotCar = 0;
bool SpinBotCar = false;
bool IsNOcameras = false;
extern bool IsView;
bool Igronebot =false;
bool TrackingCar=false;
bool  AIMHEAD1 = false; //head
bool  AIMNeck1 = false; //root
bool  AIMcheat1 = false; //Pelvis
bool iSPLAYERDIS =true;
bool IsShoot =false;
bool IsSCope = false;
bool IsBothaim =false;
float WeaponScaleChanger = 1;
bool IsAny=false;
extern int IsMode;
bool batchedoaim = true;
bool playerradar = false;
bool IsAimbots = false;
bool AimbotStatus = false;
bool IsAimbotFov = true;
bool IsAimbotDis = false;
bool IsAimHead =false; //head
bool IsAimNeck =false; //root
bool IsAimRoot =false; // Pelvis
bool IsGRWAR =true;
bool initkillmsghook = false;
bool rbg = false;
FRotator g_aimRotation;
FVector Tarloc;
FVector headp;
FVector myloc;
bool IsFastBullet = false;
FRotator g_cartrack;
FVector g_trackaim ;
bool boquabot = false;
bool IsBone2 =true;
bool isbypass = false;
bool IsJump =false;
bool IsFastshoot = false;
bool GodMode = false;
bool IsFly = false;
bool IsLootBox = false;
bool IsNocamerashake = false;
bool IsVehcleEsp = false;
bool IsWarring = true;
bool Is3Dbox =false;
bool IsPLayerName = true;
bool IsPlayerHP =true;
bool IsFastKnock = false;
bool IsFastswim = false;
bool IsVehcle = false;
bool IsboxVechle =false;
bool IsCarHP = false;
bool IsCarFuel =false;
bool IsPostil =false;
bool IsSniper = false;
bool IsWeapon2 =false;
bool IsAmmo =false;
bool IsFov2 =false;
bool IsHitXPL =false;
bool IsPlayerSP= false;
bool isAimvisual =true;
bool BulletTracking = false;
extern bool IsMatchInfomation;
bool IsPlayerWEP = true;
bool hidename = false;


static int Styleesp = 1;

extern bool IsBulletTrack;
extern bool IsBulletTrack1;
bool AutoStand = false;
bool FAKEDAMAGE = false;
float muzzleOffsetZ = 125.0f;

//
bool IsFastSwitch = false;
bool IsCrossHair = false;
bool IsSMG2 =false;
bool IsAR2 =false;
bool IsShotgun = false;
bool IsLV3 = true;
bool IsLuc = false;
bool IsOngngam = false;
bool IsSungmay = false;
bool TeleportCar = false;
bool IsSilentAIM= false;
bool GODVIEWUUP= false;
bool GODVIEWFRONT= false;
bool GODVIEWLEFT= false;
bool AUOTJUMPAN= false;
bool ongngamzoom= false;
float SetZoom = 20;

bool Flash = false;
bool IsSpinCharacter = false;
bool IsSpinCharacters = false;
bool IsScaleCharacter = false;
bool Unlock120FPS = false;



static int AR_language = 0;//for languae support AR = True mean arabic or false mean not arabic

bool IsAirDrop2 = false;
int Interval = 1;
int counter;
int iAwareTexSiz = 20;
bool iAwareText = true;
int EspTextSiz = 9;
float EspBoxThik = 2.0f;
float EspSktonThik = 1.8f;
extern float IsRadius;
extern float IsSpeed;
float X1 = 1.0f;

float spinspeed = 0.0f;
float spinspeeds = 0.0f;
//UISlider * Aimbot2;
//aimbot bool
float g_disstance;


int boxtype = 1;
int healthbartype = 0;
int Nationtype = 2;
int DirectionLineSize = 70;
int VehicleDirectionLineSize = 100;
int offscreen_range = 40;
int max_distance_offscreen = 400;
int playersdistancessize = 600;
bool esp_Outline = true;
int distance_Radar = 150;

int DancerValue ;
float DanceValue = 0.0f;
int DancerValues ;
float DanceValues = 0.0f;



int glWidth, glHeight;
int g_screenWidth ;
int g_screenHeight ;
int screenWidth ;
int screenHeight ;
int screenDensity = 0;
int getEspFramerate;
int SCOLOR;
int scc;


char extra[30];
float density = -1;
float gDistance;
int localFiring{0};
BOOL kaiguan1 = NO;
BOOL kaiguan2 = NO;
BOOL kaiguan3 = NO;
BOOL kaiguan4 = NO;
#define PI 3.14159265358979323846

bool ARWP = false;
bool SMGWP =false;
bool SNPWP = false;
bool otherWP =false;
bool AmmoWP =false;
bool LIGHTMW = false;
bool SHOTGUNWP = false;
bool scopewp = false;
bool POSTOLWP = false;
bool ARMORWP =false;
//extern float FovRadousVal;
extern float IsRecoil;

extern int IsPart;


bool tamnho = false;

bool IsScaleWeapon = false;

extern float IsTPPValue;
extern float IsFPPValue;
float alphawarring = 120.0f;

extern float IsDistanceAimbot;

//---------------------------khai báo mod skin---------------------------//

struct JsonPreferences {
  
int xsuit = 0;
int skinm4 = 0;
int skinakm = 0;
int para = 0;
int bag = 0;
int helmet = 0;
bool CoupeRB = false;
bool Dacia = false;
bool UAZ = false;
bool MiniBus = false;
bool BigFoot = false;
bool Boat = false;
bool Mirado = false;
bool Buggy = false;
bool RZR = false;
bool OMirado = false;
bool Moto = false;
bool Emote = false;
bool Helmett = false;
bool Bagg = false;
bool Fac= false;
bool Face= false;
bool Outfit = false;
bool Parachute = false;
bool Gloves = false;
bool Hieuungbay = false;
bool Comrade = false;
bool M416 = false;
bool AKM = false;
bool SCARL = false;
bool M762 = false;
bool MG3 = false;
bool Honey = false;
bool S12K = false;
bool DBS = false;
bool S1897 = false;
bool AWM = false;
bool Machete = false;
bool AMR = false;
bool MK14 = false;
bool MINI14 =false;
bool KAR98 = false;
bool M24 = false;
bool M16 = false;
bool M249 = false;
bool DP28 = false;
bool GROZA = false;
bool FAMAS = false;
bool AUG = false;
bool QBZ = false;
bool PAN = false;
bool UZI = false;
bool UMP = false;
bool TOMMY = false;
bool P90 = false;
bool BIZON = false;
bool ACE32 = false;
bool VECTOR = false;

    struct sConfig {
     
        struct sModSkin {
  bool Enable = 1;
  bool HitEffect = 0;
  bool KillMessage = 0;
  bool DeadBox = 0;
  int XSuits = 0;
  int AKM = 0;
  int M16A4 = 0;
  int Scar = 0;
  int M416 = 0;
  int Groza = 0;
  int Famas =0;
  int AUG = 0;
  int QBZ = 0;
  int M762 = 0;
  int MG3 = 0;
  int Honey = 0;
  int S12K = 0;
  int DBS = 0;
  int S1897 = 0;
  int ACE32 = 0;
  int Parachute = 0;
  int Gloves = 0;
  int Fac = 0;
  int Hieuungbay = 0;
  int Comrade = 0;
  int UZI = 0;
  int UMP = 0;
  int Vector = 0;
  int Thompson = 0;
  int P90 = 0;
  int Bizon = 0;
  int K98 = 0;
  int M24 = 0;
  int AWM = 0;
  int AMR = 0;
  int Machete = 0;
  int MK14 = 0;
  int MINI14 =0;
  int DP28 = 0;
  int M249 = 0;
  int Pan = 0;
  int Moto = 0;
  int CoupeRP = 0;
  int UAZ = 0;
  int Dacia = 0;
  int Bigfoot = 0;
  int Mirado = 0;
  int OMirado = 0;
  int Buggy = 0;
  int RZR = 0;
  int MiniBus = 0;
  int Boat = 0;
};
sModSkin Skin{false};
        
    };
    sConfig Config{false};

} preferences;
static int helmett1 = 1;
static int helmett2 = 1;
static int helmett3 = 1;
static int bag1 = 1;
static int bag2 = 1;
static int bag3 = 1;
bool ModSkinn = false;
bool KillMessage = false;
bool DeadBox = false;
int sEmote1 = 2200101;
int sEmote2 = 2200201;
int sEmote3 = 2200301;
int ModEmote1 = 1;
namespace Active {
   int SkinCarDefault = 0;
   int SkinCarMod = 0;
   int SkinCarNew = 0;
}

static std::unordered_map<std::string, bool> isDumped;
std::unordered_set<int> loggedIDs;




int newUAZID = 0;
int lastUAZID = 0;
int newDaciaID = 0;
int lastDaciaID = 0;
int newCoupeID = 0;
int lastCoupeID = 0;
struct snew_Skin {
  int XSuits = 403003; // Áo
    int XSuits1 = 40604002; // Đầu
    int quan = 404026; // quan
    int giay = 0;
    int Kaaba = 410517;
    
    
    
    
  int Balo1 = 501001;
  int Balo2 = 501002;
  int Balo3 = 501003;
  int Balo4 = 501004;
  int Balo5 = 501005;
  int Balo6 = 501006;
  int Helmet1 = 502001;
  int Helmet2 = 502002;
  int Helmet3 = 502003;
  int Helmet4 = 502004;
  int Helmet5 = 502005;

  int Helmet6 = 502114;
  int Helmet7 = 502115;
  int Helmet8 = 502116;
  int Parachute = 703001;
  int Gloves = 0;
  int Fac = 1400560;
  int Hieuungbay = 4151001;
  int Comrade = 1601051;
    
    
  int AKM = 101001;
  int AKM_Mag = 291001;
    int AKM_flash = 201010;
    int AKM_compe = 201009;
    int AKM_silent = 201011;
    int AKM_reddot = 203001;
    int AKM_holo = 203002;
    int AKM_x2 = 203003;
    int AKM_x3 = 203014;
    int AKM_x4 = 203004;
    int AKM_x6 = 203015;
    int AKM_quickMag = 204012;
    int AKM_extendedMag = 204011;
    int AKM_quickNextended = 204013;
    
  int M16A4 = 101002;
  int M16A4_Stock = 205007;
  int M16A4_Mag = 291002;
    
    
  int Scar = 101003;
  int Scar_Mag = 291003;
    int Scar_3 = 203007;
    int Scar_flash = 201010;
    int Scar_compe = 201009;
    int Scar_silent = 201011;
    int Scar_reddot = 203001;
    int Scar_holo = 203002;
    int Scar_x2 = 203003;
    int Scar_x3 = 203014;
    int Scar_x4 = 203004;
    int Scar_x6 = 203015;
    int Scar_quickMag = 204012;
    int Scar_extendedMag = 204011;
    int Scar_quickNextended = 204013;
    int Scar_verical = 202002;
    int Scar_angle = 202001;
    int Scar_lightgrip = 202004;
    int Scar_pink = 202005;
    int Scar_lazer = 202007;
    int Scar_thumb = 202006;
    
    
  int Pan = 108004;

  int M416_1 = 101004;
  int M416_2 = 291004;
  int M416_3 = 203008;
  int M416_4 = 205005;
  int M416_flash = 201010;
  int M416_compe = 201009;
  int M416_silent = 201011;
  int M416_reddot = 203001;
  int M416_holo = 203001;
  int M416_x2 = 203003;
  int M416_x3 = 203014;
  int M416_x4 = 203004;
  int M416_x6 = 203015;
  int M416_quickMag = 204012;
  int M416_extendedMag = 204011;
  int M416_quickNextended = 204013;
  int M416_stock = 205002;
  int M416_verical = 202002;
  int M416_angle = 202001;
  int M416_lightgrip = 202004;
  int M416_pink = 202005;
  int M416_lazer = 202007;
  int M416_thumb = 202006;
    
    int K98 = 103001;
  int K98_reddot = 203001;
    int K98_holo = 203002;
    int K98_x2 = 203003;
    int K98_x3 = 203014;
    int K98_x4 = 203004;
    int K98_x6 = 203015;
    int K98_x8 = 203005;
    
    
    

  int Groza = 101005;
    int Groza_2 = 291005;
    int Groza_silent = 201011;
    int Groza_reddot = 203001;
    int Groza_holo = 203002;
    int Groza_x2 = 203003;
    int Groza_x3 = 203014;
    int Groza_x4 = 203004;
    int Groza_x6 = 203015;
    int Groza_quickMag = 204012;
    int Groza_extendedMag = 204011;
    int Groza_quickNextended = 204013;
    
    int Famas = 101100;
    int Famas_reddot = 203001;
      int Famas_holo = 203002;
      int Famas_x2 = 203003;
      int Famas_x3 = 203014;
      int Famas_x4 = 203004;
      int Famas_x6 = 203015;
    
    
    
    
    
  int QBZ = 101007;
    
    
    
    
  int AUG = 101006;
    int AUG_reddot = 203001;
    int AUG_holo = 203002;
    int AUG_x2 = 203003;
    int AUG_x3 = 203014;
    int AUG_x4 = 203004;
    int AUG_x6 = 203015;
    int AUG_lazer = 202007;
    int AUG_flash = 201010;

    
    
    
  int M762 = 101008;
  int M762_Mag = 291008;
    int M762_reddot = 203001;
    int M762_holo = 203002;
    int M762_x2 = 203003;
    int M762_x3 = 203014;
    int M762_x4 = 203004;
    int M762_x6 = 203015;
    int M762_lazer = 202007;
    int M762_flash = 201010;

    
    
    
    
    
    
    
  int ACE32 = 101102;
      int ACE32_reddot = 203001;
      int ACE32_holo = 203002;
      int ACE32_x2 = 203003;
      int ACE32_x3 = 203014;
      int ACE32_x4 = 203004;
      int ACE32_x6 = 203015;
    
    
    
  int Honey = 101012;
  int UZI = 102001;
    
  int UMP = 102002;
    int UMP_reddot = 203001;
    int UMP_holo = 203002;
    int UMP_x2 = 203003;
    int UMP_x3 = 203014;
    int UMP_x4 = 203004;
    int UMP_x6 = 203015;
    
    
    
  int Vector = 102003;
  int Thompson = 102004;
  int P90 = 102105;
  int Bizon = 102005;
  int M24 = 103002;
    int M24_reddot = 203001;
      int M24_holo = 203002;
      int M24_x2 = 203003;
      int M24_x3 = 203014;
      int M24_x4 = 203004;
      int M24_x6 = 203015;
      int M24_x8 = 203005;
    
    
    
    
  int AWM = 103003;
    int AWM_reddot = 203001;
      int AWM_holo = 203002;
      int AWM_x2 = 203003;
      int AWM_x3 = 203014;
      int AWM_x4 = 203004;
      int AWM_x6 = 203015;
      int AWM_x8 = 203005;
    
    
    
    
  int AMR = 103012;
    int AMR_reddot = 203001;
      int AMR_holo = 203002;
      int AMR_x2 = 203003;
      int AMR_x3 = 203014;
      int AMR_x4 = 203004;
      int AMR_x6 = 203015;
      int AMR_x8 = 203005;
 
int FAMAS = 101100;
    int FAMAS_reddot = 203001;
      int FAMAS_holo = 203002;
      int FAMAS_x2 = 203003;
      int FAMAS_x3 = 203014;
      int FAMAS_x4 = 203004;
      int FAMAS_x6 = 203015;
    
    
    
  int Machete = 108001;
  int VSS = 103005;
  int SKS = 103004;
  int Mini14 = 103006;
  int MK14 = 103007;
  int SLR = 103009;
  int S1897 = 104002;
  int DP28 = 105002;
  int M249 = 105001;
    
    
  int MG3 = 105010;
    int MG3_reddot = 203001;
    int MG3_holo = 203002;
    int MG3_x2 = 203003;
    int MG3_x3 = 203014;
    int MG3_x4 = 203004;
    int MG3_x6 = 203015;
    
    
    
    
    
    
    
    
  int DBS = 104004;
  int S12K = 104003;
  int Skorpion = 106008;
  int Moto = 1901001;
  int CoupeRP = 1961001;
  int Dacia = 1903001;
  int UAZ = 1908001;
  int Bigfoot = 1953001;
  int Mirado = 1914004;
  int OMirado = 1915001;
  int Buggy = 1907001;
  int RZR = 1966017;
  int MiniBus = 1904001;
  int Boat = 1911001;
  int M249s = 205009;

};

inline snew_Skin new_Skin;



std::chrono::steady_clock::time_point lastChangeTime;
std::chrono::steady_clock::time_point lastWeaponChangeTime;

void updateSkin() {
    if (preferences.bag == 0)
        bag1 = 501001;
    if (preferences.bag == 1)
        bag1 = 1501001174; //blood raven x suit
    if (preferences.bag == 2)
        bag1 = 1501001220; //Golden Pharaoh X-Suit
    if (preferences.bag == 3)
        bag1 = 1501001024; //Avalanche
    if (preferences.bag == 4)
        bag1 = 1501001047; //Irresidence
    if (preferences.bag == 5)
        bag1 = 0; //Poseidon
    if (preferences.bag == 6)
        bag1 = 1501003422; //Arcane Jester X-suit
    if (preferences.bag == 7)
        bag1 = 1501003443; //Silvanus X-Suit
    if (preferences.bag == 8)
        bag1 = 1501003466;
    if (preferences.bag == 9)
        bag1 = 1501003061;
    if (preferences.bag == 10)
        bag1 = 1501003047;
    if (preferences.bag == 11)
        bag1 = 1501003039;
    if (preferences.bag == 12)
        bag1 = 1501003471;
    if (preferences.bag == 13)
        bag1 = 1501003487;
    if (preferences.bag == 14)
        bag1 = 1501003503;
    if (preferences.bag == 15)
        bag1 = 1501003515;
    if (preferences.bag == 16)
        bag1 = 1501003550;
    if (preferences.bag == 17)
        bag1 = 1501003558;
    if (preferences.bag == 18)
        bag1 = 1501003058;
    if (preferences.bag == 19)
        bag1 = 1501003057;
    if (preferences.bag == 20)
        bag1 = 1501003051;
    if (preferences.bag == 21)
        bag1 = 1501003043;
    if (preferences.bag == 22)
        bag1 = 1501003042;
    if (preferences.bag == 23)
        bag1 = 1501003229;
    if (preferences.bag == 24)
        bag1 = 1501003023;
    if (preferences.bag == 25)
        bag1 = 1501003022;
    if (preferences.bag == 26)
        bag1 = 1501003608;
    if (preferences.bag == 27)
        bag1 = 1501003605;
    
    
    
    if (preferences.bag == 0)
        bag2 = 501002;
    if (preferences.bag == 1)
        bag2 = 1501002174; //blood raven x suit
    if (preferences.bag == 2)
        bag2 = 1501002220; //Golden Pharaoh X-Suit
    if (preferences.bag == 3)
        bag2 = 1501002024; //Avalanche
    if (preferences.bag == 4)
        bag2 = 1501002047; //Irresidence
    if (preferences.bag == 5)
        bag2 = 0; //Poseidon
    if (preferences.bag == 6)
        bag2 = 1501003422; //Arcane Jester X-suit
    if (preferences.bag == 7)
        bag2 = 1501003443; //Silvanus X-Suit
    if (preferences.bag == 8)
        bag2 = 1501003466;
    if (preferences.bag == 9)
        bag2 = 1501003061;
    if (preferences.bag == 10)
        bag2 = 1501003047;
    if (preferences.bag == 11)
        bag2 = 1501003039;
    if (preferences.bag == 12)
        bag2 = 1501003471;
    if (preferences.bag == 13)
        bag2 = 1501003487;
    if (preferences.bag == 14)
        bag2 = 1501003503;
    if (preferences.bag == 15)
        bag2 = 1501003515;
    if (preferences.bag == 16)
        bag2 = 1501003550;
    if (preferences.bag == 17)
        bag2 = 1501003558;
    if (preferences.bag == 18)
        bag2 = 1501003058;
    if (preferences.bag == 19)
        bag2 = 1501003057;
    if (preferences.bag == 20)
        bag2 = 1501003051;
    if (preferences.bag == 21)
        bag2 = 1501003043;
    if (preferences.bag == 22)
        bag2 = 1501003042;
    if (preferences.bag == 23)
        bag2 = 1501003229;
    if (preferences.bag == 24)
        bag2 = 1501003023;
    if (preferences.bag == 25)
        bag2 = 1501003022;
    if (preferences.bag == 26)
        bag2 = 1501003608;
    if (preferences.bag == 27)
        bag2 = 1501003605;
    
    
    
    
    
    if (preferences.bag == 0)
        bag3 = 501003;
    if (preferences.bag == 1)
        bag3 = 1501003174; //blood raven x suit
    if (preferences.bag == 2)
        bag3 = 1501003220; //Golden Pharaoh X-Suit
    if (preferences.bag == 3)
        bag3 = 1501003024; //Avalanche
    if (preferences.bag == 4)
        bag3 = 1501003047; //Irresidence
    if (preferences.bag == 5)
        bag3 = 0; //Poseidon
    if (preferences.bag == 6)
        bag3 = 1501003422; //Arcane Jester X-suit
    if (preferences.bag == 7)
        bag3 = 1501003443; //Silvanus X-Suit
    if (preferences.bag == 8)
        bag3 = 1501003466;
    if (preferences.bag == 9)
        bag3 = 1501003061;
    if (preferences.bag == 10)
        bag3 = 1501003047;
    if (preferences.bag == 11)
        bag3 = 1501003039;
    if (preferences.bag == 12)
        bag3 = 1501003471;
    if (preferences.bag == 13)
        bag3 = 1501003487;
    if (preferences.bag == 14)
        bag3 = 1501003503;
    if (preferences.bag == 15)
        bag3 = 1501003515;
    if (preferences.bag == 16)
        bag3 = 1501003550;
    if (preferences.bag == 17)
        bag3 = 1501003558;
    if (preferences.bag == 18)
        bag3 = 1501003058;
    if (preferences.bag == 19)
        bag3 = 1501003057;
    if (preferences.bag == 20)
        bag3 = 1501003051;
    if (preferences.bag == 21)
        bag3 = 1501003043;
    if (preferences.bag == 22)
        bag3 = 1501003042;
    if (preferences.bag == 23)
        bag3 = 1501003229;
    if (preferences.bag == 24)
        bag3 = 1501003023;
    if (preferences.bag == 25)
        bag3 = 1501003022;
    if (preferences.bag == 26)
        bag3 = 1501003608;
    if (preferences.bag == 27)
        bag3 = 1501003605;
    
    
    
    
    if (preferences.helmet == 0)
        helmett1 = 502001;
    if (preferences.helmet == 1)
        helmett1 = 1502001014; //blood raven x suit
    if (preferences.helmet == 2)
        helmett1 = 1502001069; //Golden Pharaoh X-Suit
    if (preferences.helmet == 3)
        helmett1 = 0; //Avalanche
    if (preferences.helmet == 4)
        helmett1 = 1502003009; //Irresidence
    if (preferences.helmet == 5)
        helmett1 = 1502003397; //Poseidon
    if (preferences.helmet == 6)
        helmett1 = 1502003390; //Arcane Jester X-suit
    if (preferences.helmet == 7)
        helmett1 = 1502003381; //Silvanus X-Suit
    if (preferences.helmet == 8)
        helmett1 = 1502003358;
    if (preferences.helmet == 9)
        helmett1 = 1502003350;
    if (preferences.helmet == 10)
        helmett1= 1502003342;
    if (preferences.helmet == 11)
        helmett1 = 1502003336;
    if (preferences.helmet == 12)
        helmett1 = 1502003333;
    if (preferences.helmet == 13)
        helmett1 = 1502003327;
    if (preferences.helmet == 14)
        helmett1 = 1502003325;
    if (preferences.helmet == 15)
        helmett1 = 1502003299;
    if (preferences.helmet == 16)
        helmett1 = 1502003295;
    if (preferences.helmet == 17)
        helmett1 = 1502003222;
    if (preferences.helmet == 18)
        helmett1 = 1502003069;
    if (preferences.helmet == 19)
        helmett1 = 1502003054;
    if (preferences.helmet == 20)
        helmett1 = 1502003033;
    if (preferences.helmet == 21)
        helmett1 = 1502003016;
    if (preferences.helmet == 22)
        helmett1 = 1502003031;
    if (preferences.helmet == 23)
        helmett1 = 1502003023;
    if (preferences.helmet == 24)
        helmett1 = 1502003018;
    if (preferences.helmet == 25)
        helmett1 = 1502003410;
    if (preferences.helmet == 26)
        helmett1 = 1502003408;
    
    if (preferences.helmet == 0)
        helmett2 = 502002;
    if (preferences.helmet == 1)
        helmett2 = 1502002014; //blood raven x suit
    if (preferences.helmet == 2)
        helmett2 = 1502002069; //Golden Pharaoh X-Suit
    if (preferences.helmet == 3)
        helmett2 = 0; //Avalanche
    if (preferences.helmet == 4)
        helmett2 = 1502003009; //Irresidence
    if (preferences.helmet == 5)
        helmett2 = 1502003397; //Poseidon
    if (preferences.helmet == 6)
        helmett2 = 1502003390; //Arcane Jester X-suit
    if (preferences.helmet == 7)
        helmett2 = 1502003381; //Silvanus X-Suit
    if (preferences.helmet == 8)
        helmett2 = 1502003358;
    if (preferences.helmet == 9)
        helmett2 = 1502003350;
    if (preferences.helmet == 10)
        helmett2 = 1502003342;
    if (preferences.helmet == 11)
        helmett2 = 1502003336;
    if (preferences.helmet == 12)
        helmett2 = 1502003333;
    if (preferences.helmet == 13)
        helmett2 = 1502003327;
    if (preferences.helmet == 14)
        helmett2 = 1502003325;
    if (preferences.helmet == 15)
        helmett2 = 1502003299;
    if (preferences.helmet == 16)
        helmett2 = 1502003295;
    if (preferences.helmet == 17)
        helmett2 = 1502003222;
    if (preferences.helmet == 18)
        helmett2 = 1502003069;
    if (preferences.helmet == 19)
        helmett2 = 1502003054;
    if (preferences.helmet == 20)
        helmett2 = 1502003033;
    if (preferences.helmet == 21)
        helmett2 = 1502003016;
    if (preferences.helmet == 22)
        helmett2 = 1502003031;
    if (preferences.helmet == 23)
        helmett2 = 1502003023;
    if (preferences.helmet == 24)
        helmett2 = 1502003018;
    if (preferences.helmet == 25)
        helmett2 = 1502003410;
    if (preferences.helmet == 26)
        helmett2  = 1502003408;
    
    
    if (preferences.helmet == 0)
        helmett3 = 502003;
    if (preferences.helmet == 1)
        helmett3 = 1502003014; //blood raven x suit
    if (preferences.helmet == 2)
        helmett3 = 1502003069; //Golden Pharaoh X-Suit
    if (preferences.helmet == 3)
        helmett3 = 0; //Avalanche
    if (preferences.helmet == 4)
        helmett3 = 1502003009; //Irresidence
    if (preferences.helmet == 5)
        helmett3 = 1502003397; //Poseidon
    if (preferences.helmet == 6)
        helmett3 = 1502003390; //Arcane Jester X-suit
    if (preferences.helmet == 7)
        helmett3 = 1502003381; //Silvanus X-Suit
    if (preferences.helmet == 8)
        helmett3 = 1502003358;
    if (preferences.helmet == 9)
        helmett3 = 1502003350;
    if (preferences.helmet == 10)
        helmett3 = 1502003342;
    if (preferences.helmet == 11)
        helmett3 = 1502003336;
    if (preferences.helmet == 12)
        helmett3 = 1502003333;
    if (preferences.helmet == 13)
        helmett3 = 1502003327;
    if (preferences.helmet == 14)
        helmett3 = 1502003325;
    if (preferences.helmet == 15)
        helmett3 = 1502003299;
    if (preferences.helmet == 16)
        helmett3 = 1502003295;
    if (preferences.helmet == 17)
        helmett3 = 1502003222;
    if (preferences.helmet == 18)
        helmett3 = 1502003069;
    if (preferences.helmet == 19)
        helmett3 = 1502003054;
    if (preferences.helmet == 20)
        helmett3 = 1502003033;
    if (preferences.helmet == 21)
        helmett3 = 1502003016;
    if (preferences.helmet == 22)
        helmett3 = 1502003031;
    if (preferences.helmet == 23)
        helmett3 = 1502003023;
    if (preferences.helmet == 24)
        helmett3 = 1502003018;
    if (preferences.helmet == 25)
        helmett3 = 1502003410;
    if (preferences.helmet == 26)
        helmett3 = 1502003408;
    
    
    
    
    
    
    
    
    if (ModEmote1 == 0)
        sEmote1 = 2200101;
    if (ModEmote1 == 1)
        sEmote1 = 12220023;
    if (ModEmote1 == 2)
        sEmote1 = 12219677;
    if (ModEmote1 == 3)
        sEmote1 = 12219716;
    if (ModEmote1 == 4)
        sEmote1 = 12209401;
    if (ModEmote1 == 5)
        sEmote1 = 12209501;
    if (ModEmote1 == 6)
        sEmote1 = 12209701;
    if (ModEmote1 == 7)
        sEmote1 = 12209801;
    if (ModEmote1 == 8)
        sEmote1 = 12209901;
    
    
    if (ModEmote1 == 0)
        sEmote2 = 2200201;
    if (ModEmote1 == 1)
        sEmote2 = 12210201;
    if (ModEmote1 == 2)
        sEmote2 = 12210601;
    if (ModEmote1 == 3)
        sEmote2 = 12220028;
    if (ModEmote1 == 4)
        sEmote2 = 12219819;
    if (ModEmote1 == 5)
        sEmote2 = 12211801;
    if (ModEmote1 == 6)
        sEmote2 = 12212001;
    if (ModEmote1 == 7)
        sEmote2 = 12212201;
    if (ModEmote1 == 8)
        sEmote2 = 12212401;
    
    
    if (ModEmote1 == 0)
        sEmote3 = 2200301;
    if (ModEmote1 == 1)
        sEmote3 = 12212601;
    if (ModEmote1 == 2)
        sEmote3 = 12213201;
    if (ModEmote1 == 3)
        sEmote3 = 12219715;
    if (ModEmote1 == 4)
        sEmote3 = 12219814;
    if (ModEmote1 == 5)
        sEmote3 = 12213601;
    if (ModEmote1 == 6)
        sEmote3 = 12213801;
    if (ModEmote1 == 7)
        sEmote3 = 12214001;
    if (ModEmote1 == 8)
        sEmote3 = 12214201;
    
    
    
    if (preferences.Config.Skin.Parachute == 0)
        new_Skin.Parachute = 703001;
    if (preferences.Config.Skin.Parachute == 1)
        new_Skin.Parachute = 1401619; //Pharaoh's Scarab Parachute
    if (preferences.Config.Skin.Parachute == 2)
        new_Skin.Parachute = 1401625; // Enigmatic Nomad Parachute
    if (preferences.Config.Skin.Parachute == 3)
        new_Skin.Parachute = 1401624; //parashot Parachute
    if (preferences.Config.Skin.Parachute == 4)
        new_Skin.Parachute = 1401836; //Paperfold Gambit Parachute
    if (preferences.Config.Skin.Parachute == 5)
        new_Skin.Parachute = 1401833; //Labyrinth Beast Parachute
    if (preferences.Config.Skin.Parachute == 6)
        new_Skin.Parachute = 1401287; //Flamewraith Parachute
    if (preferences.Config.Skin.Parachute == 7)
        new_Skin.Parachute = 1401282; //Mega Kitty Parachute
    if (preferences.Config.Skin.Parachute == 8)
        new_Skin.Parachute = 1401385; //Mega Yeti Parachute
    if (preferences.Config.Skin.Parachute == 9)
        new_Skin.Parachute = 1401549; //Endless Glory Parachute
    if (preferences.Config.Skin.Parachute == 10)
        new_Skin.Parachute = 1401336; //Magma Skull Parachute
    if (preferences.Config.Skin.Parachute == 11)
        new_Skin.Parachute = 1401335; //Aquatic Fury Parachute
    if (preferences.Config.Skin.Parachute == 12)
        new_Skin.Parachute = 1401629; //CyberGen: Zero Parachute
    if (preferences.Config.Skin.Parachute == 13)
        new_Skin.Parachute = 1401628; //Radiant Phoenix Adarna Parachute
    if (preferences.Config.Skin.Parachute == 14)
        new_Skin.Parachute = 1401615; //Will of Horus
    if (preferences.Config.Skin.Parachute == 15)
        new_Skin.Parachute = 1401613; //Anubian Magistrate Parachute

    if (preferences.Config.Skin.Gloves == 0)
        new_Skin.Gloves = 0;
    if (preferences.Config.Skin.Gloves == 1)
        new_Skin.Gloves = 452001; //Pharaoh's Scarab Parachute
    if (preferences.Config.Skin.Gloves == 2)
        new_Skin.Gloves = 452002; // Enigmatic Nomad Parachute
    if (preferences.Config.Skin.Gloves == 3)
        new_Skin.Gloves = 452003;
    
    
    if (preferences.Config.Skin.Hieuungbay == 0)
        new_Skin.Hieuungbay = 4151001;
    if (preferences.Config.Skin.Hieuungbay == 1)
        new_Skin.Hieuungbay = 4151050; //Pharaoh's Scarab Parachute
    if (preferences.Config.Skin.Hieuungbay == 2)
        new_Skin.Hieuungbay = 4151052; // Enigmatic Nomad Parachute
    if (preferences.Config.Skin.Hieuungbay == 3)
        new_Skin.Hieuungbay = 4151054; //parashot Parachute
    if (preferences.Config.Skin.Hieuungbay == 4)
        new_Skin.Hieuungbay = 4151039; //Paperfold Gambit Parachute
    if (preferences.Config.Skin.Hieuungbay == 5)
        new_Skin.Hieuungbay = 4151048;
    if (preferences.Config.Skin.Hieuungbay == 6)
        new_Skin.Hieuungbay = 4151065;
    if (preferences.Config.Skin.Hieuungbay == 7)
        new_Skin.Hieuungbay = 4151066;
    if (preferences.Config.Skin.Hieuungbay == 8)
        new_Skin.Hieuungbay = 4151068;
    if (preferences.Config.Skin.Hieuungbay == 9)
        new_Skin.Hieuungbay = 4151070;
    if (preferences.Config.Skin.Hieuungbay == 10)
        new_Skin.Hieuungbay = 4151064;
    if (preferences.Config.Skin.Hieuungbay == 10)
        new_Skin.Hieuungbay = 4151067;
    if (preferences.Config.Skin.Hieuungbay == 11)
        new_Skin.Hieuungbay = 4151072;
    if (preferences.Config.Skin.Hieuungbay == 12)
        new_Skin.Hieuungbay = 4151075;
    if (preferences.Config.Skin.Hieuungbay == 13)
        new_Skin.Hieuungbay = 4151073;
    if (preferences.Config.Skin.Hieuungbay == 14)
        new_Skin.Hieuungbay = 4151085;
    if (preferences.Config.Skin.Hieuungbay == 15)
        new_Skin.Hieuungbay = 4151041;
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    if (preferences.Config.Skin.Hieuungbay == 0)
        new_Skin.Hieuungbay = 4151001;
    if (preferences.Config.Skin.Hieuungbay == 1)
        new_Skin.Hieuungbay = 4151050; //Pharaoh's Scarab Parachute
    if (preferences.Config.Skin.Hieuungbay == 2)
        new_Skin.Hieuungbay = 4151052; // Enigmatic Nomad Parachute
    
    
    
    
    
    
    
    if (preferences.Config.Skin.Fac == 0)
        new_Skin.Fac = 1400560;
    if (preferences.Config.Skin.Fac == 1)
        new_Skin.Fac = 1400563; //Pharaoh's Scarab Parachute
    if (preferences.Config.Skin.Fac == 2)
        new_Skin.Fac = 1406001; // Enigmatic N
    
    
    
    if (preferences.Config.Skin.Pan == 0)
        new_Skin.Pan = 108004; // 108004 - Pan
    if (preferences.Config.Skin.Pan == 1)
        new_Skin.Pan = 1108004125; // Honeypot - Pan
    if (preferences.Config.Skin.Pan == 2)
        new_Skin.Pan = 1108004145; // Night of Rock - Pan
    if (preferences.Config.Skin.Pan == 3)
        new_Skin.Pan = 1108004160; // Crocodile - Pan
    if (preferences.Config.Skin.Pan == 4)
        new_Skin.Pan = 1108004283; // Accolade - Pan
    if (preferences.Config.Skin.Pan == 5)
        new_Skin.Pan = 1108004337; // Break Pad - Pan
    if (preferences.Config.Skin.Pan == 6)
        new_Skin.Pan = 1108004356; // Chicken Hot - Pan
    if (preferences.Config.Skin.Pan == 7)
        new_Skin.Pan = 1108004365; // Faerie Luster - Pan
    if (preferences.Config.Skin.Pan == 8)
        new_Skin.Pan = 1108004033; // Faerie Luster - Pan
    
    
    //--- Trang Phục -------
    
    if (preferences.Config.Skin.XSuits == 0) {
        new_Skin.XSuits = 403003;
    }
    if (preferences.Config.Skin.XSuits == 1) {
        new_Skin.XSuits = 1406469;
    }
    if (preferences.Config.Skin.XSuits == 2) {
        new_Skin.XSuits = 1405870;
    }
    if (preferences.Config.Skin.XSuits == 3) {
        new_Skin.XSuits = 1407140;
    }
    if (preferences.Config.Skin.XSuits == 4) {
        new_Skin.XSuits = 1407141;
    }
    if (preferences.Config.Skin.XSuits == 5) {
        new_Skin.XSuits = 1406311;
    }
    if (preferences.Config.Skin.XSuits == 6) {
        new_Skin.XSuits = 1406475;
    }
    if (preferences.Config.Skin.XSuits == 7) {
        new_Skin.XSuits = 1406638;
    }
    if (preferences.Config.Skin.XSuits == 8) {
        new_Skin.XSuits = 1406872;
    }
    if (preferences.Config.Skin.XSuits == 9) {
        new_Skin.XSuits = 1406971;
    }
    if (preferences.Config.Skin.XSuits == 10) {
        new_Skin.XSuits = 1407103;
    }
    if (preferences.Config.Skin.XSuits == 11) {
        new_Skin.XSuits = 1407366;
    }
    if (preferences.Config.Skin.XSuits == 12) {
        new_Skin.XSuits = 1407259;
    }
    if (preferences.Config.Skin.XSuits == 13) {
        new_Skin.XSuits = 1407512;
    }
    if (preferences.Config.Skin.XSuits == 14) {
        new_Skin.XSuits = 1400687;
    }
    if (preferences.Config.Skin.XSuits == 15) {
        new_Skin.XSuits = 1406891;
    }
    if (preferences.Config.Skin.XSuits == 16) {
        new_Skin.XSuits = 1407277;
    }
    if (preferences.Config.Skin.XSuits == 17) {
        new_Skin.XSuits = 1400117;
    }
    if (preferences.Config.Skin.XSuits == 18) {
        new_Skin.XSuits = 1407618;
    }

    //----------------------
    
    if (preferences.Config.Skin.AKM == 0) {
        new_Skin.AKM = 101001;
        new_Skin.AKM_Mag = 291001;
        new_Skin.AKM_flash = 201010;
        new_Skin.AKM_compe = 201009;
        new_Skin.AKM_silent = 201011;
        new_Skin.AKM_reddot = 203001;
        new_Skin.AKM_holo = 203002;
        new_Skin.AKM_x2 = 203003;
        new_Skin.AKM_x3 = 203014;
        new_Skin.AKM_x4 = 203004;
        new_Skin.AKM_x6 = 203015;
        new_Skin.AKM_quickMag = 204012;
        new_Skin.AKM_extendedMag = 204011;
        new_Skin.AKM_quickNextended = 204013;
    }
    if (preferences.Config.Skin.AKM == 1){
        new_Skin.AKM = 1101001213;
        new_Skin.AKM_Mag = 1010012131;
        new_Skin.AKM_flash = 1010012067;
        new_Skin.AKM_compe = 1010012068;
        new_Skin.AKM_silent = 1010012069;
        new_Skin.AKM_reddot = 1010012066;
        new_Skin.AKM_holo = 1010012065;
        new_Skin.AKM_x2 = 1010012064;
        new_Skin.AKM_x3 = 1010012063;
        new_Skin.AKM_x4 = 1010012062;
        new_Skin.AKM_x6 = 203015;
        new_Skin.AKM_quickMag = 1010012070;
        new_Skin.AKM_extendedMag = 1010012072;
        new_Skin.AKM_quickNextended = 1010012073;
    }
    if (preferences.Config.Skin.AKM == 2) {
        new_Skin.AKM = 1101001103;
        new_Skin.AKM_Mag = 1010011031;
        new_Skin.AKM_flash = 201010;
        new_Skin.AKM_compe = 201009;
        new_Skin.AKM_silent = 201011;
        new_Skin.AKM_reddot = 203001;
        new_Skin.AKM_holo = 203002;
        new_Skin.AKM_x2 = 203003;
        new_Skin.AKM_x3 = 203014;
        new_Skin.AKM_x4 = 203004;
        new_Skin.AKM_x6 = 203015;
        new_Skin.AKM_quickMag = 204012;
        new_Skin.AKM_extendedMag = 204011;
        new_Skin.AKM_quickNextended = 204013;
    }
    if (preferences.Config.Skin.AKM == 3) {
        new_Skin.AKM = 1101001116;
        new_Skin.AKM_Mag = 1010011161;
        new_Skin.AKM_compe = 1010011107;
        new_Skin.AKM_silent = 1010011108;
        new_Skin.AKM_reddot = 1010011105;
        new_Skin.AKM_holo = 1010011104;
        new_Skin.AKM_x2 = 1010011103;
        new_Skin.AKM_x3 = 203014;
        new_Skin.AKM_x4 = 1010011102;
        new_Skin.AKM_x6 = 203015;
        new_Skin.AKM_quickMag = 1010011109;
        new_Skin.AKM_extendedMag = 204011;
        new_Skin.AKM_quickNextended = 1010011112;
    }
    if (preferences.Config.Skin.AKM == 4) {
        new_Skin.AKM = 1101001128;
        new_Skin.AKM_Mag = 1010011281;
        new_Skin.AKM_flash = 1010011232;
        new_Skin.AKM_compe = 1010011233;
        new_Skin.AKM_silent = 1010011234;
        new_Skin.AKM_reddot = 1010011226;
        new_Skin.AKM_holo = 1010011225;
        new_Skin.AKM_x2 = 1010011224;
        new_Skin.AKM_x3 = 1010011223;
        new_Skin.AKM_x4 = 1010011222;
        new_Skin.AKM_x6 = 203015;
        new_Skin.AKM_quickMag = 1010011227;
        new_Skin.AKM_extendedMag = 1010011228;
        new_Skin.AKM_quickNextended = 1010011229;
    }
    if (preferences.Config.Skin.AKM == 5) {
        new_Skin.AKM = 1101001143;
        new_Skin.AKM_Mag = 1010011431;
        new_Skin.AKM_flash = 201010;
        new_Skin.AKM_compe = 201009;
        new_Skin.AKM_silent = 201011;
        new_Skin.AKM_reddot = 203001;
        new_Skin.AKM_holo = 203002;
        new_Skin.AKM_x2 = 203003;
        new_Skin.AKM_x3 = 203014;
        new_Skin.AKM_x4 = 203004;
        new_Skin.AKM_x6 = 203015;
        new_Skin.AKM_quickMag = 204012;
        new_Skin.AKM_extendedMag = 204011;
        new_Skin.AKM_quickNextended = 204013;
    }
    if (preferences.Config.Skin.AKM == 6) {
        new_Skin.AKM = 1101001154;
        new_Skin.AKM_Mag = 1010011541;
        new_Skin.AKM_flash = 1010011487;
        new_Skin.AKM_compe = 1010011488;
        new_Skin.AKM_silent = 1010011489;
        new_Skin.AKM_reddot = 1010011486;
        new_Skin.AKM_holo = 1010011485;
        new_Skin.AKM_x2 = 1010011484;
        new_Skin.AKM_x3 = 1010011483;
        new_Skin.AKM_x4 = 1010011482;
        new_Skin.AKM_x6 = 203015;
        new_Skin.AKM_quickMag = 1010011490;
        new_Skin.AKM_extendedMag = 1010011493;
        new_Skin.AKM_quickNextended = 1010011494;
    }
    if (preferences.Config.Skin.AKM == 7) {
        new_Skin.AKM = 1101001174;
        new_Skin.AKM_Mag = 1010011741;
        new_Skin.AKM_flash = 1010011667;
        new_Skin.AKM_compe = 1010011668;
        new_Skin.AKM_silent = 1010011669;
        new_Skin.AKM_reddot = 1010011666;
        new_Skin.AKM_holo = 1010012265;
        new_Skin.AKM_x2 = 1010011664;
        new_Skin.AKM_x3 = 1010011663;
        new_Skin.AKM_x4 = 1010011662;
        new_Skin.AKM_x6 = 203015;
        new_Skin.AKM_quickMag = 1010011670;
        new_Skin.AKM_extendedMag = 1010011673;
        new_Skin.AKM_quickNextended = 1010011674;
    }
    if (preferences.Config.Skin.AKM == 8) {
        new_Skin.AKM = 1101001231;
        new_Skin.AKM_Mag = 1010012311;
        new_Skin.AKM_flash = 1010012267;
        new_Skin.AKM_compe = 1010012274;
        new_Skin.AKM_silent = 1010012269;
        new_Skin.AKM_reddot = 1010012266;
        new_Skin.AKM_holo = 1010012265;
        new_Skin.AKM_x2 = 1010012264;
        new_Skin.AKM_x3 = 1010012263;
        new_Skin.AKM_x4 = 1010012262;
        new_Skin.AKM_x6 = 1010012276;
        new_Skin.AKM_quickMag = 204012;
        new_Skin.AKM_extendedMag = 204011;
        new_Skin.AKM_quickNextended = 204013;
    }
    if (preferences.Config.Skin.AKM == 9) {
        new_Skin.AKM = 1101001089;
        new_Skin.AKM_Mag = 1010010891;
        new_Skin.AKM_flash = 201010;
        new_Skin.AKM_compe = 201009;
        new_Skin.AKM_silent = 201011;
        new_Skin.AKM_reddot = 203001;
        new_Skin.AKM_holo = 203002;
        new_Skin.AKM_x2 = 203003;
        new_Skin.AKM_x3 = 203014;
        new_Skin.AKM_x4 = 203004;
        new_Skin.AKM_x6 = 203015;
        new_Skin.AKM_quickMag = 204012;
        new_Skin.AKM_extendedMag = 204011;
        new_Skin.AKM_quickNextended = 204013;
    }
    
    if (preferences.Config.Skin.AKM == 10) {
        new_Skin.AKM = 1101001242;
        new_Skin.AKM_Mag = 1010012421;
        new_Skin.AKM_flash = 201010;
        new_Skin.AKM_compe = 201009;
        new_Skin.AKM_silent = 201011;
        new_Skin.AKM_reddot = 203001;
        new_Skin.AKM_holo = 203002;
        new_Skin.AKM_x2 = 203003;
        new_Skin.AKM_x3 = 203014;
        new_Skin.AKM_x4 = 203004;
        new_Skin.AKM_x6 = 203015;
        new_Skin.AKM_quickMag = 204012;
        new_Skin.AKM_extendedMag = 204011;
        new_Skin.AKM_quickNextended = 204013;
    }
    if (preferences.Config.Skin.AKM == 11) {
        new_Skin.AKM = 1101001249;
        new_Skin.AKM_Mag = 1010012491;
        new_Skin.AKM_flash = 1010012507;
        new_Skin.AKM_compe = 1010012508;
        new_Skin.AKM_silent = 1010012509;
        new_Skin.AKM_reddot = 203001;
        new_Skin.AKM_holo = 1010012505;
        new_Skin.AKM_x2 = 1010012504;
        new_Skin.AKM_x3 = 1010012503;
        new_Skin.AKM_x4 = 1010012502;
        new_Skin.AKM_x6 = 1010012516;
        new_Skin.AKM_quickMag = 1010012512;
        new_Skin.AKM_extendedMag = 1010012513;
        new_Skin.AKM_quickNextended = 1010012514;
    }
    if (preferences.Config.Skin.AKM == 12) {
        new_Skin.AKM = 1101001256;
        new_Skin.AKM_Mag = 1010012491;
        new_Skin.AKM_flash = 1010012507;
        new_Skin.AKM_compe = 1010012508;
        new_Skin.AKM_silent = 1010012509;
        new_Skin.AKM_reddot = 203001;
        new_Skin.AKM_holo = 1010012505;
        new_Skin.AKM_x2 = 1010012504;
        new_Skin.AKM_x3 = 1010012503;
        new_Skin.AKM_x4 = 1010012502;
        new_Skin.AKM_x6 = 1010012516;
        new_Skin.AKM_quickMag = 1010012512;
        new_Skin.AKM_extendedMag = 1010012513;
        new_Skin.AKM_quickNextended = 1010012514;
    }
    if (preferences.Config.Skin.AKM == 13) {
        new_Skin.AKM = 1101001023;
        new_Skin.AKM_Mag = 291001;
        new_Skin.AKM_flash = 201010;
        new_Skin.AKM_compe = 201009;
        new_Skin.AKM_silent = 201011;
        new_Skin.AKM_reddot = 203001;
        new_Skin.AKM_holo = 203002;
        new_Skin.AKM_x2 = 203003;
        new_Skin.AKM_x3 = 203014;
        new_Skin.AKM_x4 = 203004;
        new_Skin.AKM_x6 = 203015;
        new_Skin.AKM_quickMag = 204012;
        new_Skin.AKM_extendedMag = 204011;
        new_Skin.AKM_quickNextended = 204013;
    }
    if (preferences.Config.Skin.AKM == 14) {
        new_Skin.AKM = 1101001068;
        new_Skin.AKM_Mag = 291001;
        new_Skin.AKM_flash = 201010;
        new_Skin.AKM_compe = 201009;
        new_Skin.AKM_silent = 201011;
        new_Skin.AKM_reddot = 203001;
        new_Skin.AKM_holo = 203002;
        new_Skin.AKM_x2 = 203003;
        new_Skin.AKM_x3 = 203014;
        new_Skin.AKM_x4 = 203004;
        new_Skin.AKM_x6 = 203015;
        new_Skin.AKM_quickMag = 204012;
        new_Skin.AKM_extendedMag = 204011;
        new_Skin.AKM_quickNextended = 204013;
    }
    if (preferences.Config.Skin.AKM == 15) {
        new_Skin.AKM = 1101001265;
        new_Skin.AKM_Mag = 1010012651;
        new_Skin.AKM_flash = 1010012588;
        new_Skin.AKM_compe = 1010012589;
        new_Skin.AKM_silent = 1010012590;
        new_Skin.AKM_reddot = 1010012587;
        new_Skin.AKM_holo = 1010012586;
        new_Skin.AKM_x2 = 1010012585;
        new_Skin.AKM_x3 = 1010012584;
        new_Skin.AKM_x4 = 1010012583;
        new_Skin.AKM_x6 = 1010012582;
        new_Skin.AKM_quickMag = 1010012593;
        new_Skin.AKM_extendedMag = 1010012592;
        new_Skin.AKM_quickNextended = 1010012594;
    }
    
    
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    if (preferences.Config.Skin.M16A4 == 0) {
        new_Skin.M16A4 = 101002;
        new_Skin.M16A4_Stock = 205007;
        new_Skin.M16A4_Mag = 291002;
    }
    if (preferences.Config.Skin.M16A4 == 1) {
        new_Skin.M16A4 = 1101002029;
        new_Skin.M16A4_Stock = 1010020292;
        new_Skin.M16A4_Mag = 1010020291;
    }
    if (preferences.Config.Skin.M16A4 == 2) {
        new_Skin.M16A4 = 1101002056;
        new_Skin.M16A4_Stock = 1010020562;
        new_Skin.M16A4_Mag = 1010020561;
    }
    if (preferences.Config.Skin.M16A4 == 3) {
        new_Skin.M16A4 = 1101002068;
        new_Skin.M16A4_Stock = 1010020682;
        new_Skin.M16A4_Mag = 1010020681;
    }
    if (preferences.Config.Skin.M16A4 == 4) {
        new_Skin.M16A4 = 1101002081;
        new_Skin.M16A4_Stock = 1010020812;
        new_Skin.M16A4_Mag = 1010020811;
    }
    if (preferences.Config.Skin.M16A4 == 5) {
        new_Skin.M16A4 = 1101002103;
        new_Skin.M16A4_Stock = 1010021032;
        new_Skin.M16A4_Mag = 1010021031;
    }
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    if (preferences.Config.Skin.Scar == 0) {
        new_Skin.Scar = 101003;
        new_Skin.Scar_Mag = 291003;
        new_Skin.Scar_3 = 203007;
        new_Skin.Scar_flash = 201010;
        new_Skin.Scar_compe = 201009;
        new_Skin.Scar_silent = 201011;
        new_Skin.Scar_reddot = 203001;
        new_Skin.Scar_holo = 203002;
        new_Skin.Scar_x2 = 203003;
        new_Skin.Scar_x3 = 203014;
        new_Skin.Scar_x4 = 203004;
        new_Skin.Scar_x6 = 203015;
        new_Skin.Scar_quickMag = 204012;
        new_Skin.Scar_extendedMag = 204011;
        new_Skin.Scar_quickNextended = 204013;
        new_Skin.Scar_verical = 202002;
        new_Skin.Scar_angle = 202001;
        new_Skin.Scar_lightgrip = 202004;
        new_Skin.Scar_pink = 202005;
        new_Skin.Scar_lazer = 202007;
        new_Skin.Scar_thumb = 202006;
    }
    if (preferences.Config.Skin.Scar == 1){
        
        new_Skin.Scar = 1101003167;
        new_Skin.Scar_Mag = 1010031671;
        new_Skin.Scar_3 = 1010031672;
        new_Skin.Scar_flash = 1010031609;
        new_Skin.Scar_compe = 1010031610;
        new_Skin.Scar_silent = 1010031613;
        new_Skin.Scar_reddot = 1010031606;
        new_Skin.Scar_holo = 1010031605;
        new_Skin.Scar_x2 = 1010031604;
        new_Skin.Scar_x3 = 1010031603;
        new_Skin.Scar_x4 = 1010031602;
        new_Skin.Scar_quickMag = 1010031607;
        new_Skin.Scar_extendedMag = 1010031608;
        new_Skin.Scar_quickNextended = 1010031617;
        new_Skin.Scar_verical = 1010031615;
        new_Skin.Scar_angle = 1010031614;
        new_Skin.Scar_lightgrip = 202004;
        new_Skin.Scar_thumb = 1010031616;
        
    }
    if (preferences.Config.Skin.Scar == 2) {
        new_Skin.Scar = 1101003070;
        new_Skin.Scar_Mag = 1010030701;
        new_Skin.Scar_3 = 1010030702;
    }
    if (preferences.Config.Skin.Scar == 3) {
        new_Skin.Scar = 1101003080;
        new_Skin.Scar_Mag = 1010030801;
        new_Skin.Scar_3 = 1010030802;
    }
    if (preferences.Config.Skin.Scar == 4) {
        new_Skin.Scar = 1101003119;
        new_Skin.Scar_Mag = 1010031191;
        new_Skin.Scar_3 = 1010031192;
        new_Skin.Scar_flash = 1010031139;
        new_Skin.Scar_compe = 1010031140;
        new_Skin.Scar_silent = 1010031142;
        new_Skin.Scar_reddot = 1010031136;
        new_Skin.Scar_holo = 1010031135;
        new_Skin.Scar_x2 = 1010031134;
        new_Skin.Scar_x3 = 1010031133;
        new_Skin.Scar_x4 = 1010031132;
        new_Skin.Scar_quickMag = 1010031137;
        new_Skin.Scar_extendedMag = 1010031138;
        new_Skin.Scar_quickNextended = 1010031146;
        new_Skin.Scar_verical = 1010031144;
        new_Skin.Scar_angle = 1010031143;
        new_Skin.Scar_lightgrip = 202004;
        new_Skin.Scar_thumb = 1010031145;
    }
    if (preferences.Config.Skin.Scar == 5) {
        new_Skin.Scar = 1101003146;
        new_Skin.Scar_Mag = 1010031461;
        new_Skin.Scar_3 = 1010031462;
    }
    if (preferences.Config.Skin.Scar == 6) {
        new_Skin.Scar = 1101003181;
        new_Skin.Scar_Mag = 1010031811;
        new_Skin.Scar_flash = 1010031765;
        new_Skin.Scar_compe = 1010031764;
        new_Skin.Scar_silent = 1010031766;
        new_Skin.Scar_reddot = 1010031757;
        new_Skin.Scar_holo = 1010031756;
        new_Skin.Scar_x2 = 1010031755;
        new_Skin.Scar_x3 = 1010031754;
        new_Skin.Scar_x4 = 1010031753;
        new_Skin.Scar_x6 = 1010031752;
        new_Skin.Scar_quickMag = 1010031758;
        new_Skin.Scar_extendedMag = 1010031759;
        new_Skin.Scar_quickNextended = 1010031763;
        new_Skin.Scar_verical = 1010031769;
        new_Skin.Scar_angle = 1010031767;
        new_Skin.Scar_lightgrip = 1010031773;
        new_Skin.Scar_pink = 1010031774;
        new_Skin.Scar_lazer = 1010031772;
        new_Skin.Scar_thumb = 1010031768;
    }
    
    if (preferences.Config.Skin.Scar == 7) {
        new_Skin.Scar = 1101003195;
        new_Skin.Scar_Mag = 291003;
        new_Skin.Scar_3 = 203007;
        new_Skin.Scar_flash = 201010;
        new_Skin.Scar_compe = 201009;
        new_Skin.Scar_silent = 201011;
        new_Skin.Scar_reddot = 203001;
        new_Skin.Scar_holo = 203002;
        new_Skin.Scar_x2 = 203003;
        new_Skin.Scar_x3 = 203014;
        new_Skin.Scar_x4 = 203004;
        new_Skin.Scar_x6 = 203015;
        new_Skin.Scar_quickMag = 204012;
        new_Skin.Scar_extendedMag = 204011;
        new_Skin.Scar_quickNextended = 204013;
        new_Skin.Scar_verical = 202002;
        new_Skin.Scar_angle = 202001;
        new_Skin.Scar_lightgrip = 202004;
        new_Skin.Scar_pink = 202005;
        new_Skin.Scar_lazer = 202007;
        new_Skin.Scar_thumb = 202006;
    }
    
    if (preferences.Config.Skin.Scar == 8) {
        new_Skin.Scar = 1101003099;
        new_Skin.Scar_Mag = 291003;
        new_Skin.Scar_3 = 203007;
        new_Skin.Scar_flash = 201010;
        new_Skin.Scar_compe = 201009;
        new_Skin.Scar_silent = 201011;
        new_Skin.Scar_reddot = 203001;
        new_Skin.Scar_holo = 203002;
        new_Skin.Scar_x2 = 203003;
        new_Skin.Scar_x3 = 203014;
        new_Skin.Scar_x4 = 203004;
        new_Skin.Scar_x6 = 203015;
        new_Skin.Scar_quickMag = 204012;
        new_Skin.Scar_extendedMag = 204011;
        new_Skin.Scar_quickNextended = 204013;
        new_Skin.Scar_verical = 202002;
        new_Skin.Scar_angle = 202001;
        new_Skin.Scar_lightgrip = 202004;
        new_Skin.Scar_pink = 202005;
        new_Skin.Scar_lazer = 202007;
        new_Skin.Scar_thumb = 202006;
    }
    
    if (preferences.Config.Skin.Scar == 9) {
        new_Skin.Scar = 1101003173;
        new_Skin.Scar_Mag = 291003;
        new_Skin.Scar_3 = 203007;
        new_Skin.Scar_flash = 201010;
        new_Skin.Scar_compe = 201009;
        new_Skin.Scar_silent = 201011;
        new_Skin.Scar_reddot = 203001;
        new_Skin.Scar_holo = 203002;
        new_Skin.Scar_x2 = 203003;
        new_Skin.Scar_x3 = 203014;
        new_Skin.Scar_x4 = 203004;
        new_Skin.Scar_x6 = 203015;
        new_Skin.Scar_quickMag = 204012;
        new_Skin.Scar_extendedMag = 204011;
        new_Skin.Scar_quickNextended = 204013;
        new_Skin.Scar_verical = 202002;
        new_Skin.Scar_angle = 202001;
        new_Skin.Scar_lightgrip = 202004;
        new_Skin.Scar_pink = 202005;
        new_Skin.Scar_lazer = 202007;
        new_Skin.Scar_thumb = 202006;
    }
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    if (preferences.Config.Skin.M416 == 0) {
        new_Skin.M416_1 = 101004;
        new_Skin.M416_2 = 291004;
        new_Skin.M416_3 = 203008;
        new_Skin.M416_4 = 205005;
        new_Skin.M416_flash = 201010;
        new_Skin.M416_compe = 201009;
        new_Skin.M416_silent = 201011;
        new_Skin.M416_reddot = 203001;
        new_Skin.M416_holo = 203002;
        new_Skin.M416_x2 = 203003;
        new_Skin.M416_x3 = 203014;
        new_Skin.M416_x4 = 203004;
        new_Skin.M416_x6 = 203015;
        new_Skin.M416_quickMag = 204012;
        new_Skin.M416_extendedMag = 204011;
        new_Skin.M416_quickNextended = 204013;
        new_Skin.M416_stock = 205002;
        new_Skin.M416_verical = 202002;
        new_Skin.M416_angle = 202001;
        new_Skin.M416_lightgrip = 202004;
        new_Skin.M416_pink = 202005;
        new_Skin.M416_lazer = 202007;
        new_Skin.M416_thumb = 202006;
    }
    if (preferences.Config.Skin.M416 == 1) {
        new_Skin.M416_1 = 1101004046;
        new_Skin.M416_2 = 1010040461;
        new_Skin.M416_3 = 1010040462;
        new_Skin.M416_4 = 1010040463;
        new_Skin.M416_flash = 1010040474;
        new_Skin.M416_compe = 1010040475;
        new_Skin.M416_silent = 1010040476;
        new_Skin.M416_reddot = 1010040470;
        new_Skin.M416_holo = 1010040469;
        new_Skin.M416_x2 = 1010040468;
        new_Skin.M416_x3 = 1010040467;
        new_Skin.M416_x4 = 1010040466;
        new_Skin.M416_x6 = 1010040481;
        new_Skin.M416_quickMag = 1010040471;
        new_Skin.M416_extendedMag = 1010040472;
        new_Skin.M416_quickNextended = 1010040473;
        new_Skin.M416_stock = 1010040480;
        new_Skin.M416_verical = 1010040479;
        new_Skin.M416_thumb = 1010040478;
        new_Skin.M416_angle = 1010040477;
        new_Skin.M416_lightgrip = 1010040482;
        new_Skin.M416_pink = 1010040483;
        new_Skin.M416_lazer = 1010040484;
    }
    if (preferences.Config.Skin.M416 == 2) {
        new_Skin.M416_1 = 1101004062;
        new_Skin.M416_2 = 1010040611;
        new_Skin.M416_3 = 1010040612;
        new_Skin.M416_4 = 1010040613;
        new_Skin.M416_flash = 1010040578;
        new_Skin.M416_compe = 1010040577;
        new_Skin.M416_silent = 1010040579;
        new_Skin.M416_reddot = 1010040569;
        new_Skin.M416_holo = 1010040568;
        new_Skin.M416_x2 = 1010040567;
        new_Skin.M416_x3 = 1010040566;
        new_Skin.M416_x4 = 1010040565;
        new_Skin.M416_x6 = 1010040564;
        new_Skin.M416_quickMag = 1010040575;
        new_Skin.M416_extendedMag = 1010040570;
        new_Skin.M416_quickNextended = 1010040576;
        new_Skin.M416_stock = 1010040586;
        new_Skin.M416_verical = 1010040585;
        new_Skin.M416_angle = 1010040580;
        new_Skin.M416_lightgrip = 1010040587;
        new_Skin.M416_pink = 1010040588;
        new_Skin.M416_lazer = 1010040589;
        new_Skin.M416_thumb = 1010040584;
    }
    if (preferences.Config.Skin.M416 == 3) {
        new_Skin.M416_1 = 1101004078;
        new_Skin.M416_2 = 1010040781;
        new_Skin.M416_3 = 1010040782;
        new_Skin.M416_4 = 1010040783;
        new_Skin.M416_flash = 201010;
        new_Skin.M416_compe = 201009;
        new_Skin.M416_silent = 201011;
        new_Skin.M416_reddot = 203001;
        new_Skin.M416_holo = 203002;
        new_Skin.M416_x2 = 203003;
        new_Skin.M416_x3 = 203014;
        new_Skin.M416_x4 = 203004;
        new_Skin.M416_x6 = 203015;
        new_Skin.M416_quickMag = 204012;
        new_Skin.M416_extendedMag = 204011;
        new_Skin.M416_quickNextended = 204013;
        new_Skin.M416_stock = 205002;
        new_Skin.M416_verical = 203015;
        new_Skin.M416_angle = 202001;
        new_Skin.M416_lightgrip = 202004;
        new_Skin.M416_pink = 202005;
        new_Skin.M416_lazer = 203015;
        new_Skin.M416_thumb = 202006;
    }
    if (preferences.Config.Skin.M416 == 4) {
        new_Skin.M416_1 = 1101004086;
        new_Skin.M416_2 = 1010040861;
        new_Skin.M416_3 = 1010040862;
        new_Skin.M416_4 = 1010040863;
        new_Skin.M416_flash = 201010;
        new_Skin.M416_compe = 201009;
        new_Skin.M416_silent = 201011;
        new_Skin.M416_reddot = 203001;
        new_Skin.M416_holo = 203002;
        new_Skin.M416_x2 = 203003;
        new_Skin.M416_x3 = 203014;
        new_Skin.M416_x4 = 203004;
        new_Skin.M416_x6 = 203015;
        new_Skin.M416_quickMag = 204012;
        new_Skin.M416_extendedMag = 204011;
        new_Skin.M416_quickNextended = 204013;
        new_Skin.M416_stock = 205002;
        new_Skin.M416_verical = 203015;
        new_Skin.M416_angle = 202001;
        new_Skin.M416_lightgrip = 202004;
        new_Skin.M416_pink = 202005;
        new_Skin.M416_lazer = 203015;
        new_Skin.M416_thumb = 202006;
    }
    if (preferences.Config.Skin.M416 == 5) {
        new_Skin.M416_1 = 1101004098;
        new_Skin.M416_2 = 1010040981;
        new_Skin.M416_3 = 1010040982;
        new_Skin.M416_4 = 1010040983;
        new_Skin.M416_flash = 201010;
        new_Skin.M416_compe = 201009;
        new_Skin.M416_silent = 201011;
        new_Skin.M416_reddot = 203001;
        new_Skin.M416_holo = 203002;
        new_Skin.M416_x2 = 203003;
        new_Skin.M416_x3 = 203014;
        new_Skin.M416_x4 = 203004;
        new_Skin.M416_x6 = 203015;
        new_Skin.M416_quickMag = 204012;
        new_Skin.M416_extendedMag = 204011;
        new_Skin.M416_quickNextended = 204013;
        new_Skin.M416_stock = 205002;
        new_Skin.M416_verical = 203015;
        new_Skin.M416_angle = 202001;
        new_Skin.M416_lightgrip = 202004;
        new_Skin.M416_pink = 202005;
        new_Skin.M416_lazer = 203015;
        new_Skin.M416_thumb = 202006;
    }
    if (preferences.Config.Skin.M416 == 6) {
        new_Skin.M416_1 = 1101004138;
        new_Skin.M416_2 = 1010041381;
        new_Skin.M416_3 = 1010041382;
        new_Skin.M416_4 = 1010041383;
        new_Skin.M416_flash = 1010041136;
        new_Skin.M416_compe = 1010041137;
        new_Skin.M416_silent = 1010041138;
        new_Skin.M416_reddot = 1010041128;
        new_Skin.M416_holo = 1010041127;
        new_Skin.M416_x2 = 1010041126;
        new_Skin.M416_x3 = 1010041125;
        new_Skin.M416_x4 = 1010041124;
        new_Skin.M416_x6 = 203015;
        new_Skin.M416_quickMag = 1010041134;
        new_Skin.M416_extendedMag = 1010041129;
        new_Skin.M416_quickNextended = 1010041135;
        new_Skin.M416_stock = 1010041146;
        new_Skin.M416_verical = 1010041145;
        new_Skin.M416_angle = 1010041139;
        new_Skin.M416_lightgrip = 202004;
        new_Skin.M416_pink = 202005;
        new_Skin.M416_lazer = 203015;
        new_Skin.M416_thumb = 202006;
    }
    if (preferences.Config.Skin.M416 == 7) {
        new_Skin.M416_1 = 1101004163;
        new_Skin.M416_2 = 1010041631;
        new_Skin.M416_3 = 1010041632;
        new_Skin.M416_4 = 1010041633;
        new_Skin.M416_flash = 201010;
        new_Skin.M416_compe = 1010041574;
        new_Skin.M416_silent = 1010041575;
        new_Skin.M416_reddot = 1010041566;
        new_Skin.M416_holo = 1010041565;
        new_Skin.M416_x2 = 1010041564;
        new_Skin.M416_x3 = 1010041560;
        new_Skin.M416_x4 = 1010041554;
        new_Skin.M416_x6 = 203015;
        new_Skin.M416_quickMag = 1010041568;
        new_Skin.M416_extendedMag = 1010041569;
        new_Skin.M416_quickNextended = 1010041567;
        new_Skin.M416_stock = 1010041579;
        new_Skin.M416_verical = 1010041578;
        new_Skin.M416_angle = 1010041576;
        new_Skin.M416_lightgrip = 20200400;
        new_Skin.M416_pink = 202005;
        new_Skin.M416_lazer = 203015;
        new_Skin.M416_thumb = 1010041577;
    }
    if (preferences.Config.Skin.M416 == 8) {
        new_Skin.M416_1 = 1101004201;
        new_Skin.M416_2 = 1010042011;
        new_Skin.M416_3 = 1010042012;
        new_Skin.M416_4 = 1010042013;
        new_Skin.M416_flash = 1010041956;
        new_Skin.M416_compe = 1010041957;
        new_Skin.M416_silent = 1010041958;
        new_Skin.M416_reddot = 1010041948;
        new_Skin.M416_holo = 1010041947;
        new_Skin.M416_x2 = 1010041946;
        new_Skin.M416_x3 = 1010041945;
        new_Skin.M416_x4 = 1010041944;
        new_Skin.M416_x6 = 1010041967;
        new_Skin.M416_quickMag = 1010041949;
        new_Skin.M416_extendedMag = 1010041950;
        new_Skin.M416_quickNextended = 1010041955;
        new_Skin.M416_stock = 1010041966;
        new_Skin.M416_verical = 1010041965;
        new_Skin.M416_angle = 1010041959;
        new_Skin.M416_lightgrip = 202004;
        new_Skin.M416_pink = 202005;
        new_Skin.M416_lazer = 203015;
        new_Skin.M416_thumb = 202006;
    }
    if (preferences.Config.Skin.M416 == 9) {
        new_Skin.M416_1 = 1101004209;
        new_Skin.M416_2 = 1010042073;
        new_Skin.M416_3 = 1010042083;
        new_Skin.M416_4 = 1010042093;
        new_Skin.M416_flash = 20101000;
        new_Skin.M416_compe = 1010042037;
        new_Skin.M416_silent = 1010042039;
        new_Skin.M416_reddot = 1010042029;
        new_Skin.M416_holo = 1010042028;
        new_Skin.M416_x2 = 1010042027;
        new_Skin.M416_x3 = 1010042026;
        new_Skin.M416_x4 = 1010042025;
        new_Skin.M416_x6 = 1010042024;
        new_Skin.M416_quickMag = 1010042034;
        new_Skin.M416_extendedMag = 1010042035;
        new_Skin.M416_quickNextended = 1010042036;
        new_Skin.M416_stock = 1010042047;
        new_Skin.M416_verical = 1010042046;
        new_Skin.M416_angle = 1010042044;
        new_Skin.M416_lightgrip = 202004;
        new_Skin.M416_pink = 202005;
        new_Skin.M416_lazer = 203015;
        new_Skin.M416_thumb = 202006;
    }
    if (preferences.Config.Skin.M416 == 10) {
        new_Skin.M416_1 = 1101004218;
        new_Skin.M416_2 = 1010042181;
        new_Skin.M416_3 = 1010042182;
        new_Skin.M416_4 = 1010042183;
        new_Skin.M416_flash = 1010042128;
        new_Skin.M416_compe = 1010042127;
        new_Skin.M416_silent = 1010042129;
        new_Skin.M416_reddot = 1010042119;
        new_Skin.M416_holo = 1010042118;
        new_Skin.M416_x2 = 1010042117;
        new_Skin.M416_x3 = 1010042116;
        new_Skin.M416_x4 = 1010042115;
        new_Skin.M416_x6 = 1010042114;
        new_Skin.M416_quickMag = 1010042125;
        new_Skin.M416_extendedMag = 1010042124;
        new_Skin.M416_quickNextended = 1010042126;
        new_Skin.M416_stock = 1010042137;
        new_Skin.M416_verical = 1010042136;
        new_Skin.M416_angle = 1010042134;
        new_Skin.M416_lightgrip = 1010042138;
        new_Skin.M416_pink = 1010042139;
        new_Skin.M416_lazer = 1010042144;
        new_Skin.M416_thumb = 1010042135;
        
    }
    if (preferences.Config.Skin.M416 == 11) {
        new_Skin.M416_1 = 1101004226;
        new_Skin.M416_2 = 1010042214;
        new_Skin.M416_3 = 1010042215;
        new_Skin.M416_4 = 1010042216;
        new_Skin.M416_flash = 1010042238;
        new_Skin.M416_compe = 1010042237;
        new_Skin.M416_silent = 1010042239;
        new_Skin.M416_reddot = 1010042233;
        new_Skin.M416_holo = 1010042232;
        new_Skin.M416_x2 = 1010042231;
        new_Skin.M416_x3 = 1010042219;
        new_Skin.M416_x4 = 1010042218;
        new_Skin.M416_x6 = 1010042217;
        new_Skin.M416_quickMag = 1010042235;
        new_Skin.M416_extendedMag = 1010042234;
        new_Skin.M416_quickNextended = 1010042236;
        new_Skin.M416_stock = 1010042244;
        new_Skin.M416_verical = 1010042243;
        new_Skin.M416_angle = 1010042241;
        new_Skin.M416_lightgrip = 1010042245;
        new_Skin.M416_pink = 1010042246;
        new_Skin.M416_lazer = 1010042247;
        new_Skin.M416_thumb = 1010042242;
        
    }
    
    if (preferences.Config.Skin.M416 == 12) {
        new_Skin.M416_1 = 1101004236;
        new_Skin.M416_2 = 1010042361;
        new_Skin.M416_3 = 1010042362;
        new_Skin.M416_4 = 1010042363;
        new_Skin.M416_flash = 1010042307;
        new_Skin.M416_compe = 1010042306;
        new_Skin.M416_silent = 1010042308;
        new_Skin.M416_reddot = 1010042299;
        new_Skin.M416_holo = 1010042298;
        new_Skin.M416_x2 = 1010042297;
        new_Skin.M416_x3 = 1010042296;
        new_Skin.M416_x4 = 1010042295;
        new_Skin.M416_x6 = 1010042294;
        new_Skin.M416_quickMag = 1010042304;
        new_Skin.M416_extendedMag = 1010042300;
        new_Skin.M416_quickNextended = 1010042305;
        new_Skin.M416_stock = 1010042315;
        new_Skin.M416_verical = 1010042314;
        new_Skin.M416_angle = 1010042309;
        new_Skin.M416_lightgrip = 1010042316;
        new_Skin.M416_pink = 1010042317;
        new_Skin.M416_lazer = 1010042318;
        new_Skin.M416_thumb = 1010042310;
    }
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    if (preferences.Config.Skin.Groza == 0) {
        new_Skin.Groza = 101005;
        new_Skin.Groza_2 = 291005;
        new_Skin.Groza_silent = 201011;
        new_Skin.Groza_reddot = 203001;
        new_Skin.Groza_holo = 203002;
        new_Skin.Groza_x2 = 203003;
        new_Skin.Groza_x3 = 203014;
        new_Skin.Groza_x4 = 203004;
        new_Skin.Groza_x6 = 203015;
        new_Skin.Groza_quickMag = 204012;
        new_Skin.Groza_extendedMag = 204011;
        new_Skin.Groza_quickNextended = 204013;
    }
    if (preferences.Config.Skin.Groza == 1) {
        
        new_Skin.Groza = 1101005052;
        new_Skin.Groza_2 = 1010050521;
        new_Skin.Groza_silent = 1010050467;
        new_Skin.Groza_reddot = 1010050466;
        new_Skin.Groza_holo = 1010050465;
        new_Skin.Groza_x2 = 1010050464;
        new_Skin.Groza_x3 = 1010050463;
        new_Skin.Groza_x4 = 1010050462;
        new_Skin.Groza_x6 = 203015;
        new_Skin.Groza_quickMag = 1010050468;
        new_Skin.Groza_extendedMag = 1010050469;
        new_Skin.Groza_quickNextended = 1010050470;
    }
    if (preferences.Config.Skin.Groza == 2) {
        new_Skin.Groza = 1101005025;
        new_Skin.Groza_2 = 1010050251;
        new_Skin.Groza_silent = 201011;
        new_Skin.Groza_reddot = 203001;
        new_Skin.Groza_holo = 203002;
        new_Skin.Groza_x2 = 203003;
        new_Skin.Groza_x3 = 203014;
        new_Skin.Groza_x4 = 203004;
        new_Skin.Groza_x6 = 203015;
        new_Skin.Groza_quickMag = 204012;
        new_Skin.Groza_extendedMag = 204011;
        new_Skin.Groza_quickNextended = 204013;
    }
    if (preferences.Config.Skin.Groza == 3) {
        new_Skin.Groza = 1101005019;
        new_Skin.Groza_2 = 1010050191;
        new_Skin.Groza_silent = 201011;
        new_Skin.Groza_reddot = 203001;
        new_Skin.Groza_holo = 203002;
        new_Skin.Groza_x2 = 203003;
        new_Skin.Groza_x3 = 203014;
        new_Skin.Groza_x4 = 203004;
        new_Skin.Groza_x6 = 203015;
        new_Skin.Groza_quickMag = 204012;
        new_Skin.Groza_extendedMag = 204011;
        new_Skin.Groza_quickNextended = 204013;
    }
    if (preferences.Config.Skin.Groza == 4) {
        new_Skin.Groza = 1101005043;
        new_Skin.Groza_2 = 1010050431;
        new_Skin.Groza_silent = 201011;
        new_Skin.Groza_reddot = 203001;
        new_Skin.Groza_holo = 203002;
        new_Skin.Groza_x2 = 203003;
        new_Skin.Groza_x3 = 203014;
        new_Skin.Groza_x4 = 203004;
        new_Skin.Groza_x6 = 203015;
        new_Skin.Groza_quickMag = 204012;
        new_Skin.Groza_extendedMag = 204011;
        new_Skin.Groza_quickNextended = 204013;
    }
    if (preferences.Config.Skin.Groza == 5) {
        new_Skin.Groza = 1101005038;
        new_Skin.Groza_2 = 1010050381;
        new_Skin.Groza_silent = 1010050327;
        new_Skin.Groza_reddot = 1010050326;
        new_Skin.Groza_holo = 1010050325;
        new_Skin.Groza_x2 = 1010050324;
        new_Skin.Groza_x3 = 1010050323;
        new_Skin.Groza_x4 = 1010050322;
        new_Skin.Groza_x6 = 203015;
        new_Skin.Groza_quickMag = 1010050328;
        new_Skin.Groza_extendedMag = 1010050329;
        new_Skin.Groza_quickNextended = 1010050330;
    }
    if (preferences.Config.Skin.Groza == 6) {
        new_Skin.Groza = 1101005082;
        new_Skin.Groza_2 = 1010050821;
        new_Skin.Groza_silent = 201011;
        new_Skin.Groza_reddot = 203001;
        new_Skin.Groza_holo = 203002;
        new_Skin.Groza_x2 = 203003;
        new_Skin.Groza_x3 = 203014;
        new_Skin.Groza_x4 = 203004;
        new_Skin.Groza_x6 = 203015;
        new_Skin.Groza_quickMag = 204012;
        new_Skin.Groza_extendedMag = 204011;
        new_Skin.Groza_quickNextended = 204013;
    }
    if (preferences.Config.Skin.Groza == 7) {
        new_Skin.Groza = 1101005098;
        new_Skin.Groza_2 = 1010050981;
        new_Skin.Groza_silent = 1010050928;
        new_Skin.Groza_reddot = 1010050927;
        new_Skin.Groza_holo = 1010050926;
        new_Skin.Groza_x2 = 1010050925;
        new_Skin.Groza_x3 = 1010050924;
        new_Skin.Groza_x4 = 1010050923;
        new_Skin.Groza_x6 = 1010050922;
        new_Skin.Groza_quickMag = 1010050930;
        new_Skin.Groza_extendedMag = 1010050929;
        new_Skin.Groza_quickNextended = 1010050932;
    }
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    if (preferences.Config.Skin.Famas == 0) {
        new_Skin.Famas = 101100;
        new_Skin.Famas_reddot = 203001;
        new_Skin.Famas_holo = 203002;
        new_Skin.Famas_x2 = 203003;
        new_Skin.Famas = 203014;
        new_Skin.Famas_x4 = 203004;
        new_Skin.Famas_x6 = 203015;
    }
    if (preferences.Config.Skin.Famas == 1) {
        new_Skin.Famas = 1101100012;
        new_Skin.Famas_reddot = 203001;
        new_Skin.Famas_holo = 203002;
        new_Skin.Famas_x2 = 203003;
        new_Skin.Famas = 203014;
        new_Skin.Famas_x4 = 203004;
        new_Skin.Famas_x6 = 203015;
    }
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    if (preferences.Config.Skin.AUG == 0){
        new_Skin.AUG = 101006;
        new_Skin.AUG_reddot = 203001;
        new_Skin.AUG_holo = 203002;
        new_Skin.AUG_x2 = 203003;
        new_Skin.AUG_x3 = 203014;
        new_Skin.AUG_x4 = 203004;
        new_Skin.AUG_x6 = 203015;
    }
    
    if (preferences.Config.Skin.AUG == 1){
        new_Skin.AUG = 1101006062;
        new_Skin.AUG_reddot = 1010060562;
        new_Skin.AUG_holo = 1010060561;
        new_Skin.AUG_x2 = 1010060554;
        new_Skin.AUG_x3 = 1010060553;
        new_Skin.AUG_x4 = 1010060552;
        new_Skin.AUG_x6 = 1010060551;
        new_Skin.AUG_lazer = 1010060574;
        new_Skin.AUG_flash = 1010060571;
    }
    
    
    
    if (preferences.Config.Skin.AUG == 2){
        new_Skin.AUG = 1101006044;
        new_Skin.AUG = 101006;
        new_Skin.AUG_reddot = 203001;
        new_Skin.AUG_holo = 203002;
        new_Skin.AUG_x2 = 203003;
        new_Skin.AUG_x3 = 203014;
        new_Skin.AUG_x4 = 203004;
        new_Skin.AUG_x6 = 203015;
    }
    if (preferences.Config.Skin.AUG == 3){
        new_Skin.AUG = 1101006033;
        new_Skin.AUG = 101006;
        new_Skin.AUG_reddot = 203001;
        new_Skin.AUG_holo = 203002;
        new_Skin.AUG_x2 = 203003;
        new_Skin.AUG_x3 = 203014;
        new_Skin.AUG_x4 = 203004;
        new_Skin.AUG_x6 = 203015;
        new_Skin.AUG_lazer = 202007;
        new_Skin.AUG_flash = 201010;
    }
    
    if (preferences.Config.Skin.AUG == 4){
        new_Skin.AUG = 1101006075;
        new_Skin.AUG_reddot = 1010060696;
        new_Skin.AUG_holo = 1010060695;
        new_Skin.AUG_x2 = 1010060694;
        new_Skin.AUG_x3 = 1010060693;
        new_Skin.AUG_x4 = 1010060692;
        new_Skin.AUG_x6 = 1010060691;
        new_Skin.AUG_lazer = 1010060707;
        new_Skin.AUG_flash = 1010060699;
    }
    if (preferences.Config.Skin.AUG == 5){
        new_Skin.AUG = 1101006067;
        new_Skin.AUG_reddot = 203001;
        new_Skin.AUG_holo = 203002;
        new_Skin.AUG_x2 = 203003;
        new_Skin.AUG_x3 = 203014;
        new_Skin.AUG_x4 = 203004;
        new_Skin.AUG_x6 = 203015;
        new_Skin.AUG_lazer = 202007;
        new_Skin.AUG_flash = 201010;
    }
    if (preferences.Config.Skin.AUG == 6){
        new_Skin.AUG = 1101006085;
        new_Skin.AUG_reddot = 1010060788;
        new_Skin.AUG_holo = 1010060787;
        new_Skin.AUG_x2 = 1010060786;
        new_Skin.AUG_x3 = 1010060785;
        new_Skin.AUG_x4 = 1010060784;
        new_Skin.AUG_x6 = 1010060783;
    }
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    if (preferences.Config.Skin.QBZ == 0)
        new_Skin.QBZ = 101007;
    if (preferences.Config.Skin.QBZ == 1)
        new_Skin.QBZ = 1101007062;
    if (preferences.Config.Skin.QBZ == 2)
        new_Skin.QBZ = 1101007046;
    if (preferences.Config.Skin.QBZ == 3)
        new_Skin.QBZ = 1101007036;
    if (preferences.Config.Skin.QBZ == 4)
        new_Skin.QBZ = 1101007025;
    
    
    
    
    
    
    
    
    if (preferences.Config.Skin.MG3 == 0){
        new_Skin.MG3 = 105010;
        new_Skin.MG3_reddot = 203001;
        new_Skin.MG3_holo = 203002;
        new_Skin.MG3_x2 = 203003;
        new_Skin.MG3_x3 = 203014;
        new_Skin.MG3_x4 = 203004;
        new_Skin.MG3_x6 = 203015;
    }
    if (preferences.Config.Skin.MG3 == 1){
        new_Skin.MG3 = 1105010019;
        new_Skin.MG3_reddot = 203001;
        new_Skin.MG3_holo = 203002;
        new_Skin.MG3_x2 = 203003;
        new_Skin.MG3_x3 = 203014;
        new_Skin.MG3_x4 = 203004;
        new_Skin.MG3_x6 = 203015;
    }
    if (preferences.Config.Skin.MG3 == 2){
        new_Skin.MG3 = 1105010008;
        new_Skin.MG3_reddot = 203001;
        new_Skin.MG3_holo = 203002;
        new_Skin.MG3_x2 = 203003;
        new_Skin.MG3_x3 = 203014;
        new_Skin.MG3_x4 = 203004;
        new_Skin.MG3_x6 = 203015;
    }
    
    
    
    
    
    
    
    if (preferences.Config.Skin.Honey == 0)
        new_Skin.Honey = 101012;
    if (preferences.Config.Skin.Honey == 1)
        new_Skin.Honey = 1101012009;
    
    
    if (preferences.Config.Skin.S1897 == 0)
        new_Skin.S1897 = 104002;
    if (preferences.Config.Skin.S1897 == 1)
        new_Skin.S1897 = 1104002022;
    
    
    
    
    
    if (preferences.Config.Skin.DBS == 0)
        new_Skin.DBS = 104004;
    if (preferences.Config.Skin.DBS == 1)
        new_Skin.DBS = 1104004035;
    if (preferences.Config.Skin.DBS == 2)
        new_Skin.DBS = 1104004024;
    if (preferences.Config.Skin.DBS == 3)
        new_Skin.DBS = 1104004041;
    
    
    
    
    if (preferences.Config.Skin.S12K == 0)
        new_Skin.S12K = 104003;
    if (preferences.Config.Skin.S12K == 1)
        new_Skin.S12K = 1104003037;
    if (preferences.Config.Skin.S12K == 2)
        new_Skin.S12K = 1104003026;
    
    
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    if (preferences.Config.Skin.M762 == 0) {
        new_Skin.M762 = 101008;
        new_Skin.M762_Mag = 291008;
        new_Skin.M762_reddot = 203001;
        new_Skin.M762_holo = 203002;
        new_Skin.M762_x2 = 203003;
        new_Skin.M762_x3 = 203014;
        new_Skin.M762_x4 = 203004;
        new_Skin.M762_x6 = 203015;
        new_Skin.M762_lazer = 202007;
        new_Skin.M762_flash = 201010;
        
    }
    if (preferences.Config.Skin.M762 == 1) {
        
        new_Skin.M762 = 1101008081;
        new_Skin.M762_Mag = 1010080811;
        new_Skin.M762_reddot = 203001;
        new_Skin.M762_holo = 203002;
        new_Skin.M762_x2 = 203003;
        new_Skin.M762_x3 = 203014;
        new_Skin.M762_x4 = 203004;
        new_Skin.M762_x6 = 203015;
        new_Skin.M762_lazer = 202007;
        new_Skin.M762_flash = 201010;
        
    }
    if (preferences.Config.Skin.M762 == 2) {
        new_Skin.M762 = 1101008051;
        new_Skin.M762_Mag = 1010080511;
        new_Skin.M762_reddot = 203001;
        new_Skin.M762_holo = 203002;
        new_Skin.M762_x2 = 203003;
        new_Skin.M762_x3 = 203014;
        new_Skin.M762_x4 = 203004;
        new_Skin.M762_x6 = 203015;
        new_Skin.M762_lazer = 202007;
        new_Skin.M762_flash = 201010;
    }
    if (preferences.Config.Skin.M762 == 3) {
        new_Skin.M762 = 1101008061;
        new_Skin.M762_Mag = 1010080611;
        new_Skin.M762_reddot = 203001;
        new_Skin.M762_holo = 203002;
        new_Skin.M762_x2 = 203003;
        new_Skin.M762_x3 = 203014;
        new_Skin.M762_x4 = 203004;
        new_Skin.M762_x6 = 203015;
        new_Skin.M762_lazer = 202007;
        new_Skin.M762_flash = 201010;
    }
    if (preferences.Config.Skin.M762 == 4) {
        new_Skin.M762 = 1101008026;
        new_Skin.M762_Mag = 1010080261;
        new_Skin.M762_reddot = 203001;
        new_Skin.M762_holo = 203002;
        new_Skin.M762_x2 = 203003;
        new_Skin.M762_x3 = 203014;
        new_Skin.M762_x4 = 203004;
        new_Skin.M762_x6 = 203015;
        new_Skin.M762_lazer = 202007;
        new_Skin.M762_flash = 201010;
    }
    if (preferences.Config.Skin.M762 == 5) {
        new_Skin.M762 = 1101008104;
        new_Skin.M762_Mag = 1010081041;
        new_Skin.M762_reddot = 203001;
        new_Skin.M762_holo = 203002;
        new_Skin.M762_x2 = 203003;
        new_Skin.M762_x3 = 203014;
        new_Skin.M762_x4 = 203004;
        new_Skin.M762_x6 = 203015;
        new_Skin.M762_lazer = 202007;
        new_Skin.M762_flash = 201010;
    }
    if (preferences.Config.Skin.M762 == 6) {
        new_Skin.M762 = 1101008116;
        new_Skin.M762_Mag = 1010081161;
        new_Skin.M762_reddot = 203001;
        new_Skin.M762_holo = 203002;
        new_Skin.M762_x2 = 203003;
        new_Skin.M762_x3 = 203014;
        new_Skin.M762_x4 = 203004;
        new_Skin.M762_x6 = 203015;
        new_Skin.M762_lazer = 202007;
        new_Skin.M762_flash = 201010;
    }
    if (preferences.Config.Skin.M762 == 7) {
        new_Skin.M762 = 1101008126;
        new_Skin.M762_Mag = 1010081261;
        new_Skin.M762_reddot = 203001;
        new_Skin.M762_holo = 203002;
        new_Skin.M762_x2 = 203003;
        new_Skin.M762_x3 = 203014;
        new_Skin.M762_x4 = 203004;
        new_Skin.M762_x6 = 203015;
        new_Skin.M762_lazer = 202007;
        new_Skin.M762_flash = 201010;
    }
    if (preferences.Config.Skin.M762 == 8) {
        new_Skin.M762 = 1101008136;
        new_Skin.M762_Mag = 291008;
        new_Skin.M762_reddot = 203001;
        new_Skin.M762_holo = 203002;
        new_Skin.M762_x2 = 203003;
        new_Skin.M762_x3 = 203014;
        new_Skin.M762_x4 = 203004;
        new_Skin.M762_x6 = 203015;
        new_Skin.M762_lazer = 202007;
        new_Skin.M762_flash = 201010;
    }
    if (preferences.Config.Skin.M762 == 9) {
        new_Skin.M762 = 1101008070;
        new_Skin.M762_Mag = 291008;
        new_Skin.M762_reddot = 203001;
        new_Skin.M762_holo = 203002;
        new_Skin.M762_x2 = 203003;
        new_Skin.M762_x3 = 203014;
        new_Skin.M762_x4 = 203004;
        new_Skin.M762_x6 = 203015;
        new_Skin.M762_lazer = 202007;
        new_Skin.M762_flash = 201010;
    }
    if (preferences.Config.Skin.M762 == 10) {
        new_Skin.M762 = 1101008146;
        new_Skin.M762_Mag = 291008;
        new_Skin.M762_reddot = 203001;
        new_Skin.M762_holo = 203002;
        new_Skin.M762_x2 = 203003;
        new_Skin.M762_x3 = 203014;
        new_Skin.M762_x4 = 203004;
        new_Skin.M762_x6 = 203015;
        new_Skin.M762_lazer = 202007;
        new_Skin.M762_flash = 201010;
    }
    if (preferences.Config.Skin.M762 == 11) {
        new_Skin.M762 = 1101008154;
        new_Skin.M762_Mag = 291008;
        new_Skin.M762_reddot = 203001;
        new_Skin.M762_holo = 203002;
        new_Skin.M762_x2 = 203003;
        new_Skin.M762_x3 = 203014;
        new_Skin.M762_x4 = 203004;
        new_Skin.M762_x6 = 203015;
        new_Skin.M762_lazer = 202007;
        new_Skin.M762_flash = 201010;
    }
    if (preferences.Config.Skin.M762 == 12) {
        new_Skin.M762 = 1101008163;
        new_Skin.M762_Mag = 1010081631;
        new_Skin.M762_reddot = 1010081577;
        new_Skin.M762_holo = 1010081576;
        new_Skin.M762_x2 = 1010081575;
        new_Skin.M762_x3 = 1010081574;
        new_Skin.M762_x4 = 1010081573;
        new_Skin.M762_x6 = 1010081572;
        new_Skin.M762_lazer = 1010081590;
        new_Skin.M762_flash = 1010081582;
    }
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    if (preferences.Config.Skin.ACE32 == 0)
        new_Skin.ACE32 = 101102;
    if (preferences.Config.Skin.ACE32 == 1){
        new_Skin.ACE32 = 1101102007;
        new_Skin.ACE32_reddot = 1010081396;
        new_Skin.ACE32_holo = 1010081395;
        new_Skin.ACE32_x2 = 1010081394;
        new_Skin.ACE32_x3 = 1010081393;
        new_Skin.ACE32_x4 = 1010081392;
        new_Skin.ACE32_x6 = 1010081391;
    }
    if (preferences.Config.Skin.ACE32 == 2){
        new_Skin.ACE32 = 1101102017;
        new_Skin.ACE32_reddot = 1010081396;
        new_Skin.ACE32_holo = 1010081395;
        new_Skin.ACE32_x2 = 1010081394;
        new_Skin.ACE32_x3 = 1010081393;
        new_Skin.ACE32_x4 = 1010081392;
        new_Skin.ACE32_x6 = 1010081391;
    }
    if (preferences.Config.Skin.ACE32 == 3){
        new_Skin.ACE32 = 1101102025;
        new_Skin.ACE32_reddot = 1010081396;
        new_Skin.ACE32_holo = 1010081395;
        new_Skin.ACE32_x2 = 1010081394;
        new_Skin.ACE32_x3 = 1010081393;
        new_Skin.ACE32_x4 = 1010081392;
        new_Skin.ACE32_x6 = 1010081391;
    }
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    if (preferences.Config.Skin.UZI == 0)
        new_Skin.UZI = 102001;
    if (preferences.Config.Skin.UZI == 1)
        new_Skin.UZI = 1102001102;
    if (preferences.Config.Skin.UZI == 2)
        new_Skin.UZI = 1102001036;
    if (preferences.Config.Skin.UZI == 3)
        new_Skin.UZI = 1102001058;
    if (preferences.Config.Skin.UZI == 4)
        new_Skin.UZI = 1102001069;
    if (preferences.Config.Skin.UZI == 5)
        new_Skin.UZI = 1102001089;
    if (preferences.Config.Skin.UZI == 6)
        new_Skin.UZI = 1102001024;
    if (preferences.Config.Skin.UZI == 7)
        new_Skin.UZI = 1102001130;
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    if (preferences.Config.Skin.UMP == 0){
        new_Skin.UMP = 102002;
        new_Skin.UMP_reddot = 203001;
        new_Skin.UMP_holo = 203002;
        new_Skin.UMP_x2 = 203003;
        new_Skin.UMP_x3 = 203014;
        new_Skin.UMP_x4 = 203004;
        new_Skin.UMP_x6 = 203015;
    }
    
    if (preferences.Config.Skin.UMP == 1){
        new_Skin.UMP = 1102002136;
        new_Skin.UMP_reddot = 1020021307;
        new_Skin.UMP_holo = 1020021306;
        new_Skin.UMP_x2 = 1020021305;
        new_Skin.UMP_x3 = 1020021304;
        new_Skin.UMP_x4 = 1020021303;
        new_Skin.UMP_x6 = 1020021302;
    }
    if (preferences.Config.Skin.UMP == 2){
        new_Skin.UMP = 1102002061;
        new_Skin.UMP_reddot = 203001;
        new_Skin.UMP_holo = 203002;
        new_Skin.UMP_x2 = 203003;
        new_Skin.UMP_x3 = 203014;
        new_Skin.UMP_x4 = 203004;
        new_Skin.UMP_x6 = 203015;
    }
    if (preferences.Config.Skin.UMP == 3){
        new_Skin.UMP = 1102002090;
        new_Skin.UMP_reddot = 203001;
        new_Skin.UMP_holo = 203002;
        new_Skin.UMP_x2 = 203003;
        new_Skin.UMP_x3 = 203014;
        new_Skin.UMP_x4 = 203004;
        new_Skin.UMP_x6 = 203015;
    }
    
    if (preferences.Config.Skin.UMP == 4){
        new_Skin.UMP = 1102002117;
        new_Skin.UMP_reddot = 203001;
        new_Skin.UMP_holo = 203002;
        new_Skin.UMP_x2 = 203003;
        new_Skin.UMP_x3 = 203014;
        new_Skin.UMP_x4 = 203004;
        new_Skin.UMP_x6 = 203015;
    }
    if (preferences.Config.Skin.UMP == 5){
        new_Skin.UMP = 1102002124;
        new_Skin.UMP_reddot = 203001;
        new_Skin.UMP_holo = 203002;
        new_Skin.UMP_x2 = 203003;
        new_Skin.UMP_x3 = 203014;
        new_Skin.UMP_x4 = 203004;
        new_Skin.UMP_x6 = 203015;
    }
    if (preferences.Config.Skin.UMP == 6){
        new_Skin.UMP = 1102002129;
        new_Skin.UMP_reddot = 203001;
        new_Skin.UMP_holo = 203002;
        new_Skin.UMP_x2 = 203003;
        new_Skin.UMP_x3 = 203014;
        new_Skin.UMP_x4 = 203004;
        new_Skin.UMP_x6 = 203015;
    }
    if (preferences.Config.Skin.UMP == 7){
        new_Skin.UMP = 1102002043;
        new_Skin.UMP_reddot = 203001;
        new_Skin.UMP_holo = 203002;
        new_Skin.UMP_x2 = 203003;
        new_Skin.UMP_x3 = 203014;
        new_Skin.UMP_x4 = 203004;
        new_Skin.UMP_x6 = 203015;
    }
    if (preferences.Config.Skin.UMP == 8){
        new_Skin.UMP = 1102002030;
        new_Skin.UMP_reddot = 203001;
        new_Skin.UMP_holo = 203002;
        new_Skin.UMP_x2 = 203003;
        new_Skin.UMP_x3 = 203014;
        new_Skin.UMP_x4 = 203004;
        new_Skin.UMP_x6 = 203015;
    }
    if (preferences.Config.Skin.UMP == 9){
        new_Skin.UMP = 1102002424;
        new_Skin.UMP_reddot = 1020024187;
        new_Skin.UMP_holo = 1020024186;
        new_Skin.UMP_x2 = 1020024185;
        new_Skin.UMP_x3 = 1020024184;
        new_Skin.UMP_x4 = 1020024183;
        new_Skin.UMP_x6 = 1020024182;
    }
    
    
    
    
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    if (preferences.Config.Skin.Vector == 0)
        new_Skin.Vector = 102003;
    if (preferences.Config.Skin.Vector == 1)
        
        new_Skin.Vector = 1102003080;
    if (preferences.Config.Skin.Vector == 2)
        new_Skin.Vector = 1102003031;
    if (preferences.Config.Skin.Vector == 3)
        new_Skin.Vector = 1102003065;
    if (preferences.Config.Skin.Vector == 4)
        new_Skin.Vector = 1102003020;
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    if (preferences.Config.Skin.Thompson == 0)
        new_Skin.Thompson = 102004;
    if (preferences.Config.Skin.Thompson == 1)
        new_Skin.Thompson = 1102004018;
    if (preferences.Config.Skin.Thompson == 2)
        new_Skin.Thompson = 1102004034;
    
    //-------------------------------------------------------//
    if (preferences.Config.Skin.P90 == 0)
        new_Skin.P90 = 102105;
    if (preferences.Config.Skin.P90 == 1)
        new_Skin.P90 = 1102105012;
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    if (preferences.Config.Skin.Bizon == 0)
        new_Skin.Bizon = 102005;
    if (preferences.Config.Skin.Bizon == 1)
        new_Skin.Bizon = 1102005007;
    if (preferences.Config.Skin.Bizon == 2)
        new_Skin.Bizon = 1102005020;
    if (preferences.Config.Skin.Bizon == 3)
        new_Skin.Bizon = 1102005041;
    if (preferences.Config.Skin.Bizon == 4)
        new_Skin.Bizon = 1102005064;
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    {
        if (preferences.Config.Skin.K98 == 0)
            new_Skin.K98 = 103001;
        new_Skin.K98_reddot = 203001;
        new_Skin.K98_holo = 203002;
        new_Skin.K98_x2 = 203003;
        new_Skin.K98_x3 = 203014;
        new_Skin.K98_x4 = 203004;
        new_Skin.K98_x6 = 203015;
        new_Skin.K98_x8 = 203005;
    }
    
    if (preferences.Config.Skin.K98 == 1){
        new_Skin.K98 = 1103001179;
        new_Skin.K98_reddot = 203001;
        new_Skin.K98_holo = 203002;
        new_Skin.K98_x2 = 203003;
        new_Skin.K98_x3 = 203014;
        new_Skin.K98_x4 = 203004;
        new_Skin.K98_x6 = 203015;
        new_Skin.K98_x8 = 203005;
    }
    
    if (preferences.Config.Skin.K98 == 2){
        new_Skin.K98 = 1103001079;
        new_Skin.K98_reddot = 203001;
        new_Skin.K98_holo = 203002;
        new_Skin.K98_x2 = 203003;
        new_Skin.K98_x3 = 203014;
        new_Skin.K98_x4 = 203004;
        new_Skin.K98_x6 = 203015;
        new_Skin.K98_x8 = 203005;
    }
    
    
    if (preferences.Config.Skin.K98 == 3){
        new_Skin.K98 = 1103001101;
        new_Skin.K98_reddot = 203001;
        new_Skin.K98_holo = 203002;
        new_Skin.K98_x2 = 203003;
        new_Skin.K98_x3 = 203014;
        new_Skin.K98_x4 = 203004;
        new_Skin.K98_x6 = 203015;
        new_Skin.K98_x8 = 203005;
    }
    
    
    if (preferences.Config.Skin.K98 == 4){
        new_Skin.K98 = 1103001146;
        new_Skin.K98_reddot = 203001;
        new_Skin.K98_holo = 203002;
        new_Skin.K98_x2 = 203003;
        new_Skin.K98_x3 = 203014;
        new_Skin.K98_x4 = 203004;
        new_Skin.K98_x6 = 203015;
        new_Skin.K98_x8 = 203005;
    }
    
    if (preferences.Config.Skin.K98 == 5){
        new_Skin.K98 = 1103001160;
        new_Skin.K98_reddot = 203001;
        new_Skin.K98_holo = 203002;
        new_Skin.K98_x2 = 203003;
        new_Skin.K98_x3 = 203014;
        new_Skin.K98_x4 = 203004;
        new_Skin.K98_x6 = 203015;
        new_Skin.K98_x8 = 203005;
    }
    
    if (preferences.Config.Skin.K98 == 6){
        new_Skin.K98 = 1103001060;
        new_Skin.K98_reddot = 203001;
        new_Skin.K98_holo = 203002;
        new_Skin.K98_x2 = 203003;
        new_Skin.K98_x3 = 203014;
        new_Skin.K98_x4 = 203004;
        new_Skin.K98_x6 = 203015;
        new_Skin.K98_x8 = 203005;
    }
    
    
    if (preferences.Config.Skin.K98 == 7){
        new_Skin.K98 = 1103001191;
        new_Skin.K98_reddot = 1030011857;
        new_Skin.K98_holo = 1030011856;
        new_Skin.K98_x2 = 1030011855;
        new_Skin.K98_x3 = 1030011854;
        new_Skin.K98_x4 = 1030011853;
        new_Skin.K98_x6 = 1030011852;
        new_Skin.K98_x8 = 1030011851;
    }
    
    if (preferences.Config.Skin.K98 == 8){
        new_Skin.K98 = 1103001183;
        new_Skin.K98_reddot = 203001;
        new_Skin.K98_holo = 203002;
        new_Skin.K98_x2 = 203003;
        new_Skin.K98_x3 = 203014;
        new_Skin.K98_x4 = 203004;
        new_Skin.K98_x6 = 203015;
        new_Skin.K98_x8 = 203005;
    }
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    if (preferences.Config.Skin.M24 == 0){
        new_Skin.M24 = 103002;
        new_Skin.M24_reddot = 203001;
        new_Skin.M24_holo = 203002;
        new_Skin.M24_x2 = 203003;
        new_Skin.M24_x3 = 203014;
        new_Skin.M24_x4 = 203004;
        new_Skin.M24_x6 = 203015;
        new_Skin.M24_x8 = 203005;
    }
    if (preferences.Config.Skin.M24 == 1){
        new_Skin.M24 = 1103002087;
        new_Skin.M24_reddot = 203001;
        new_Skin.M24_holo = 203002;
        new_Skin.M24_x2 = 203003;
        new_Skin.M24_x3 = 203014;
        new_Skin.M24_x4 = 203004;
        new_Skin.M24_x6 = 203015;
        new_Skin.M24_x8 = 203005;
    }
    if (preferences.Config.Skin.M24 == 2){
        new_Skin.M24 = 1103002030;
        new_Skin.M24_reddot = 203001;
        new_Skin.M24_holo = 203002;
        new_Skin.M24_x2 = 203003;
        new_Skin.M24_x3 = 203014;
        new_Skin.M24_x4 = 203004;
        new_Skin.M24_x6 = 203015;
        new_Skin.M24_x8 = 203005;
    }
    
    if (preferences.Config.Skin.M24 == 3){
        new_Skin.M24 = 1103002049;
        new_Skin.M24_reddot = 203001;
        new_Skin.M24_holo = 203002;
        new_Skin.M24_x2 = 203003;
        new_Skin.M24_x3 = 203014;
        new_Skin.M24_x4 = 203004;
        new_Skin.M24_x6 = 203015;
        new_Skin.M24_x8 = 203005;
    }
    if (preferences.Config.Skin.M24 == 4){
        new_Skin.M24 = 1103002059;
        new_Skin.M24_reddot = 203001;
        new_Skin.M24_holo = 203002;
        new_Skin.M24_x2 = 203003;
        new_Skin.M24_x3 = 203014;
        new_Skin.M24_x4 = 203004;
        new_Skin.M24_x6 = 203015;
        new_Skin.M24_x8 = 203005;
    }
    if (preferences.Config.Skin.M24 == 5){
        new_Skin.M24 = 1103002106;
        new_Skin.M24_reddot = 1030021008;
        new_Skin.M24_holo = 1030021007;
        new_Skin.M24_x2 = 1030021006;
        new_Skin.M24_x3 = 1030021005;
        new_Skin.M24_x4 = 1030021004;
        new_Skin.M24_x6 = 1030021003;
        new_Skin.M24_x8 = 1030021002;
    }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    if (preferences.Config.Skin.AWM == 0){
        new_Skin.AWM = 103003;
        new_Skin.AWM_reddot = 203001;
        new_Skin.AWM_holo = 203002;
        new_Skin.AWM_x2 = 203003;
        new_Skin.AWM_x3 = 203014;
        new_Skin.AWM_x4 = 203004;
        new_Skin.AWM_x6 = 203015;
        new_Skin.AWM_x8 = 203005;
    }
    if (preferences.Config.Skin.AWM == 1){
        new_Skin.AWM = 1103003087;
        new_Skin.AWM_reddot = 203001;
        new_Skin.AWM_holo = 203002;
        new_Skin.AWM_x2 = 203003;
        new_Skin.AWM_x3 = 203014;
        new_Skin.AWM_x4 = 203004;
        new_Skin.AWM_x6 = 203015;
        new_Skin.AWM_x8 = 203005;
    }
    if (preferences.Config.Skin.AWM == 2){
        new_Skin.AWM = 1103003022;
        new_Skin.AWM_reddot = 203001;
        new_Skin.AWM_holo = 203002;
        new_Skin.AWM_x2 = 203003;
        new_Skin.AWM_x3 = 203014;
        new_Skin.AWM_x4 = 203004;
        new_Skin.AWM_x6 = 203015;
        new_Skin.AWM_x8 = 203005;
    }
    if (preferences.Config.Skin.AWM == 3){
        new_Skin.AWM = 1103003042;
        new_Skin.AWM_reddot = 203001;
        new_Skin.AWM_holo = 203002;
        new_Skin.AWM_x2 = 203003;
        new_Skin.AWM_x3 = 203014;
        new_Skin.AWM_x4 = 203004;
        new_Skin.AWM_x6 = 203015;
        new_Skin.AWM_x8 = 203005;
    }
    if (preferences.Config.Skin.AWM == 4){
        new_Skin.AWM = 1103003051;
        new_Skin.AWM_reddot = 203001;
        new_Skin.AWM_holo = 203002;
        new_Skin.AWM_x2 = 203003;
        new_Skin.AWM_x3 = 203014;
        new_Skin.AWM_x4 = 203004;
        new_Skin.AWM_x6 = 203015;
        new_Skin.AWM_x8 = 203005;
    }
    if (preferences.Config.Skin.AWM == 5){
        new_Skin.AWM = 1103003062;
        new_Skin.AWM_reddot = 203001;
        new_Skin.AWM_holo = 203002;
        new_Skin.AWM_x2 = 203003;
        new_Skin.AWM_x3 = 203014;
        new_Skin.AWM_x4 = 203004;
        new_Skin.AWM_x6 = 203015;
        new_Skin.AWM_x8 = 203005;
    }
    if (preferences.Config.Skin.AWM == 6){
        new_Skin.AWM = 1103003079;
        new_Skin.AWM_reddot = 1030030738;
        new_Skin.AWM_holo = 1030030737;
        new_Skin.AWM_x2 = 1030030736;
        new_Skin.AWM_x3 = 1030030735;
        new_Skin.AWM_x4 = 1030030734;
        new_Skin.AWM_x6 = 1030030733;
        new_Skin.AWM_x8 = 1030030732;
    }
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    if (preferences.Config.Skin.AMR == 0){
      new_Skin.AMR = 103012;
        new_Skin.AMR_reddot = 203001;
        new_Skin.AMR_holo = 203002;
        new_Skin.AMR_x2 = 203003;
        new_Skin.AMR_x3 = 203014;
        new_Skin.AMR_x4 = 203004;
        new_Skin.AMR_x6 = 203015;
        new_Skin.AMR_x8 = 203005;
    }
    if (preferences.Config.Skin.AMR == 1){
      new_Skin.AMR = 1103012019;
        new_Skin.AMR_reddot = 203001;
        new_Skin.AMR_holo = 203002;
        new_Skin.AMR_x2 = 203003;
        new_Skin.AMR_x3 = 203014;
        new_Skin.AMR_x4 = 203004;
        new_Skin.AMR_x6 = 203015;
        new_Skin.AMR_x8 = 203005;
    }
    
    if (preferences.Config.Skin.AMR == 2){
      new_Skin.AMR = 1103012010;
        new_Skin.AMR_reddot = 203001;
        new_Skin.AMR_holo = 203002;
        new_Skin.AMR_x2 = 203003;
        new_Skin.AMR_x3 = 203014;
        new_Skin.AMR_x4 = 203004;
        new_Skin.AMR_x6 = 203015;
        new_Skin.AMR_x8 = 203005;
    }
    
    if (preferences.Config.Skin.AMR == 3){
        new_Skin.AMR = 1103012031;
        new_Skin.AMR_reddot = 1030120258;
        new_Skin.AMR_holo = 1030120257;
        new_Skin.AMR_x2 = 1030120256;
        new_Skin.AMR_x3 = 1030120255;
        new_Skin.AMR_x4 = 1030120254;
        new_Skin.AMR_x6 = 1030120253;
        new_Skin.AMR_x8 = 1030120252;
    }
    
        
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    if (preferences.Config.Skin.MK14 == 0)
      new_Skin.MK14 = 103007;
    if (preferences.Config.Skin.MK14 == 1)
      new_Skin.MK14 =1103007028;
    if (preferences.Config.Skin.MK14 == 2)
      new_Skin.MK14 = 1103007020;
    
    
    
    
    
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    if (preferences.Config.Skin.Machete == 0)
      new_Skin.Machete = 103003;
    if (preferences.Config.Skin.Machete == 1)
      new_Skin.Machete = 1108001069;
    if (preferences.Config.Skin.Machete == 2)
      new_Skin.Machete = 1108001064;

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    if (preferences.Config.Skin.MINI14 == 0)
      new_Skin.Mini14 = 103006;
    if (preferences.Config.Skin.MINI14 == 1)
      new_Skin.Mini14 =1103006030;
    if (preferences.Config.Skin.MINI14 == 2)
      new_Skin.Mini14 = 1103006058;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.DP28 == 0)
    new_Skin.DP28 = 105002;
  if (preferences.Config.Skin.DP28 == 1)
    new_Skin.DP28 = 1105002035;
  if (preferences.Config.Skin.DP28 == 2)
    new_Skin.DP28 = 1105002018;
  if (preferences.Config.Skin.DP28 == 3)
    new_Skin.DP28 = 1105002058;
  if (preferences.Config.Skin.DP28 == 4)
    new_Skin.DP28 = 1105002063;
    if (preferences.Config.Skin.DP28 == 5)
    new_Skin.DP28 = 1105002091;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (preferences.Config.Skin.M249 == 0)
    new_Skin.M249 = 105001;
    new_Skin.M249s = 205009;
  if (preferences.Config.Skin.M249 == 1)
    
    new_Skin.M249 = 1105001048;
 //   new_Skin.M249s = 1050010542;
  if (preferences.Config.Skin.M249 == 2)
    new_Skin.M249 = 1105001054;
  //  new_Skin.M249s = 1050010412;
  if (preferences.Config.Skin.M249 == 3)
    new_Skin.M249 = 1105001034;
  //  new_Skin.M249s = 1050010482;
  if (preferences.Config.Skin.M249 == 4)
      new_Skin.M249 = 1105001020;
   //   new_Skin.M249s = 1050010351;
   if (preferences.Config.Skin.M249 == 5)
      new_Skin.M249 = 1105001069;
  
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

   if (preferences.Config.Skin.Bigfoot == 0)
    new_Skin.Bigfoot = 1953001;
  if (preferences.Config.Skin.Bigfoot == 1)
    new_Skin.Bigfoot = 1953004;
    if (preferences.Config.Skin.Bigfoot == 2)
      new_Skin.Bigfoot = 1953008;
    
    if (preferences.Config.Skin.RZR == 0)
     new_Skin.RZR = 1966017;
   if (preferences.Config.Skin.RZR == 1)
     new_Skin.RZR = 1966017;
     if (preferences.Config.Skin.RZR == 2)
       new_Skin.RZR = 1966016;
     
    
    
    
    
    
    
    
    
    
  if (preferences.Config.Skin.Mirado == 0)
    new_Skin.Mirado = 1914001;
  if (preferences.Config.Skin.Mirado == 1)
    new_Skin.Mirado = 1915011;
    if (preferences.Config.Skin.Mirado == 2)
      new_Skin.Mirado = 1915009;
    if (preferences.Config.Skin.Mirado == 3)
      new_Skin.Mirado = 1915008;
    if (preferences.Config.Skin.Mirado == 4)
      new_Skin.Mirado = 1915007;
    if (preferences.Config.Skin.Mirado == 5)
      new_Skin.Mirado = 1915006;
    if (preferences.Config.Skin.Mirado == 6)
      new_Skin.Mirado = 1915005;
    if (preferences.Config.Skin.Mirado == 7)
      new_Skin.Mirado = 1915012;
    if (preferences.Config.Skin.Mirado == 8)
      new_Skin.Mirado = 1915010;
    
    
    
    
    
    
    
    
    
    
    
  if (preferences.Config.Skin.Moto == 0)
    new_Skin.Moto = 1901001;
  if (preferences.Config.Skin.Moto == 1)
    new_Skin.Moto = 1901073;
  if (preferences.Config.Skin.Moto == 2)
    new_Skin.Moto = 1901074;
  if (preferences.Config.Skin.Moto == 3)
    new_Skin.Moto = 1901075;
  if (preferences.Config.Skin.Moto == 4)
    new_Skin.Moto = 1901047;
  if (preferences.Config.Skin.Moto == 5)
    new_Skin.Moto = 1901085;
  if (preferences.Config.Skin.Moto == 6)
    new_Skin.Moto = 1901076;
  if (preferences.Config.Skin.Moto == 7)
    new_Skin.Moto = 1901027;
  if (preferences.Config.Skin.Moto == 8)
    new_Skin.Moto = 1901018;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

if (preferences.Config.Skin.Buggy == 0)
    new_Skin.Buggy = 1907001;
  if (preferences.Config.Skin.Buggy == 1)
    new_Skin.Buggy = 1907047;
  if (preferences.Config.Skin.Buggy == 2)
    new_Skin.Buggy = 1907008;
if (preferences.Config.Skin.Buggy == 3)
    new_Skin.Buggy = 1907010;
if (preferences.Config.Skin.Buggy == 4)
    new_Skin.Buggy = 1907011;
if (preferences.Config.Skin.Buggy == 5)
    new_Skin.Buggy = 1907012;
if (preferences.Config.Skin.Buggy == 6)
    new_Skin.Buggy = 1907013;
if (preferences.Config.Skin.Buggy == 7)
    new_Skin.Buggy = 1907014;
if (preferences.Config.Skin.Buggy == 8)
    new_Skin.Buggy = 1907007;
if (preferences.Config.Skin.Buggy == 9)
    new_Skin.Buggy = 1907016;
if (preferences.Config.Skin.Buggy == 10)
    new_Skin.Buggy = 1907018;
if (preferences.Config.Skin.Buggy == 11)
    new_Skin.Buggy = 1907019;
if (preferences.Config.Skin.Buggy == 12)
    new_Skin.Buggy = 1907021;
if (preferences.Config.Skin.Buggy == 13)
    new_Skin.Buggy = 1907022;
if (preferences.Config.Skin.Buggy == 14)
    new_Skin.Buggy = 1907023;
if (preferences.Config.Skin.Buggy == 15)
    new_Skin.Buggy = 1907025;
if (preferences.Config.Skin.Buggy == 16)
    new_Skin.Buggy = 1907026;
if (preferences.Config.Skin.Buggy == 17)
    new_Skin.Buggy = 1907027;
if (preferences.Config.Skin.Buggy == 18)
    new_Skin.Buggy = 1907028;
if (preferences.Config.Skin.Buggy == 19)
    new_Skin.Buggy = 1907029;
if (preferences.Config.Skin.Buggy == 20)
    new_Skin.Buggy = 1907030;
if (preferences.Config.Skin.Buggy == 21)
    new_Skin.Buggy = 1907032;
if (preferences.Config.Skin.Buggy == 22)
    new_Skin.Buggy = 1907033;
if (preferences.Config.Skin.Buggy == 23)
    new_Skin.Buggy = 1907034;
if (preferences.Config.Skin.Buggy == 24)
    new_Skin.Buggy = 1907035;
if (preferences.Config.Skin.Buggy == 25)
    new_Skin.Buggy = 1907036;
if (preferences.Config.Skin.Buggy == 26)
    new_Skin.Buggy = 1907037;
if (preferences.Config.Skin.Buggy == 27)
    new_Skin.Buggy = 1907038;
if (preferences.Config.Skin.Buggy == 28)
    new_Skin.Buggy = 1907040;
if (preferences.Config.Skin.Buggy == 29)
    new_Skin.Buggy = 1907041;
    
    
    
    
    
  if (preferences.Config.Skin.Dacia == 0)
    new_Skin.Dacia = 1903001;
  if (preferences.Config.Skin.Dacia == 1)
    new_Skin.Dacia =1903201;
  if (preferences.Config.Skin.Dacia == 2)
    new_Skin.Dacia =1903200;
  if (preferences.Config.Skin.Dacia == 3)
    new_Skin.Dacia = 1903193;
  if (preferences.Config.Skin.Dacia == 4)
    new_Skin.Dacia = 1903192;
  if (preferences.Config.Skin.Dacia == 5)
    new_Skin.Dacia = 1903191;
  if (preferences.Config.Skin.Dacia == 6)
    new_Skin.Dacia = 1903080;
  if (preferences.Config.Skin.Dacia == 7)
    new_Skin.Dacia = 1903079;
  if (preferences.Config.Skin.Dacia == 8)
    new_Skin.Dacia = 1903076;
  if (preferences.Config.Skin.Dacia == 9)
    new_Skin.Dacia = 1903075;
  if (preferences.Config.Skin.Dacia == 10)
    new_Skin.Dacia = 1903074;
  if (preferences.Config.Skin.Dacia == 11)
    new_Skin.Dacia = 1903071;
  if (preferences.Config.Skin.Dacia == 12)
    new_Skin.Dacia = 1903073;
  if (preferences.Config.Skin.Dacia == 13)
    new_Skin.Dacia = 1903072;
  if (preferences.Config.Skin.Dacia == 14)
    new_Skin.Dacia = 1903090;
  if (preferences.Config.Skin.Dacia == 15)
    new_Skin.Dacia = 1903089;
  if (preferences.Config.Skin.Dacia == 16)
    new_Skin.Dacia = 1903088;
  if (preferences.Config.Skin.Dacia == 17)
    new_Skin.Dacia = 1903204;
  if (preferences.Config.Skin.Dacia == 18)
    new_Skin.Dacia = 1903203;
  if (preferences.Config.Skin.Dacia == 19)
    new_Skin.Dacia = 1903202;
  if (preferences.Config.Skin.Dacia == 20)
    new_Skin.Dacia = 1903017;
  if (preferences.Config.Skin.Dacia == 21)
    new_Skin.Dacia = 1903014;
    if (preferences.Config.Skin.Dacia == 22)
      new_Skin.Dacia = 1903023;
    if (preferences.Config.Skin.Dacia == 23)
      new_Skin.Dacia = 1903022;
    if (preferences.Config.Skin.Dacia == 24)
      new_Skin.Dacia = 1903019;
      
  
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  
if (preferences.Config.Skin.MiniBus == 0)
    new_Skin.MiniBus = 1904001;
  if (preferences.Config.Skin.MiniBus == 1)
    new_Skin.MiniBus = 1904005;
if (preferences.Config.Skin.MiniBus == 2)
    new_Skin.MiniBus = 1904007;
if (preferences.Config.Skin.MiniBus == 3)
    new_Skin.MiniBus = 1904008;
if (preferences.Config.Skin.MiniBus == 4)
    new_Skin.MiniBus = 1904009;
if (preferences.Config.Skin.MiniBus == 5)
    new_Skin.MiniBus = 1904010;
if (preferences.Config.Skin.MiniBus == 6)
    new_Skin.MiniBus = 1904011;
if (preferences.Config.Skin.MiniBus == 7)
    new_Skin.MiniBus = 1904012;
if (preferences.Config.Skin.MiniBus == 8)
    new_Skin.MiniBus = 1904013;
if (preferences.Config.Skin.MiniBus == 9)
    new_Skin.MiniBus = 1904014;
if (preferences.Config.Skin.MiniBus == 10)
    new_Skin.MiniBus = 1904015;
if (preferences.Config.Skin.MiniBus == 11)
    new_Skin.MiniBus = 1904004;
  
  if (preferences.Config.Skin.CoupeRP == 0)
    new_Skin.CoupeRP = 1961001;
  if (preferences.Config.Skin.CoupeRP == 1)
    new_Skin.CoupeRP = 1961024;
  if (preferences.Config.Skin.CoupeRP == 2)
    new_Skin.CoupeRP = 1961047;
  if (preferences.Config.Skin.CoupeRP == 3)
    new_Skin.CoupeRP = 1961034;
  if (preferences.Config.Skin.CoupeRP == 4)
    new_Skin.CoupeRP = 1961018;
  if (preferences.Config.Skin.CoupeRP == 5)
    new_Skin.CoupeRP = 1961007;
  if (preferences.Config.Skin.CoupeRP == 6)
    new_Skin.CoupeRP = 1961010;
  if (preferences.Config.Skin.CoupeRP == 7)
    new_Skin.CoupeRP = 1961049;
  if (preferences.Config.Skin.CoupeRP == 8)
    new_Skin.CoupeRP = 1961048;
  if (preferences.Config.Skin.CoupeRP == 9)
    new_Skin.CoupeRP = 1961012;
  if (preferences.Config.Skin.CoupeRP == 10)
    new_Skin.CoupeRP = 1961013;
  if (preferences.Config.Skin.CoupeRP == 11)
    new_Skin.CoupeRP = 1961014;
  if (preferences.Config.Skin.CoupeRP == 12)
    new_Skin.CoupeRP = 1961015;
  if (preferences.Config.Skin.CoupeRP == 13)
    new_Skin.CoupeRP = 1961016;
  if (preferences.Config.Skin.CoupeRP == 14)
    new_Skin.CoupeRP = 1961017;
  if (preferences.Config.Skin.CoupeRP == 15)
    new_Skin.CoupeRP = 1961020;
  if (preferences.Config.Skin.CoupeRP == 16)
    new_Skin.CoupeRP = 1961021;
  if (preferences.Config.Skin.CoupeRP == 17)
    new_Skin.CoupeRP = 1961025;
  if (preferences.Config.Skin.CoupeRP == 18)
    new_Skin.CoupeRP = 1961029;
  if (preferences.Config.Skin.CoupeRP == 19)
    new_Skin.CoupeRP = 1961030;
  if (preferences.Config.Skin.CoupeRP == 20)
    new_Skin.CoupeRP = 1961031;
  if (preferences.Config.Skin.CoupeRP == 21)
    new_Skin.CoupeRP = 1961032;
  if (preferences.Config.Skin.CoupeRP == 22)
    new_Skin.CoupeRP = 1961033;
  if (preferences.Config.Skin.CoupeRP == 23)
    new_Skin.CoupeRP = 1961035;
  if (preferences.Config.Skin.CoupeRP == 24)
    new_Skin.CoupeRP = 1961036;
  if (preferences.Config.Skin.CoupeRP == 22)
    new_Skin.CoupeRP = 1961037;
  if (preferences.Config.Skin.CoupeRP == 26)
    new_Skin.CoupeRP = 1961038;
  if (preferences.Config.Skin.CoupeRP == 27)
    new_Skin.CoupeRP = 1961039;
  if (preferences.Config.Skin.CoupeRP == 28)
    new_Skin.CoupeRP = 1961040;
  if (preferences.Config.Skin.CoupeRP == 29)
    new_Skin.CoupeRP = 1961041;
  if (preferences.Config.Skin.CoupeRP == 30)
    new_Skin.CoupeRP = 1961042;
  if (preferences.Config.Skin.CoupeRP == 31)
    new_Skin.CoupeRP = 1961043;
  if (preferences.Config.Skin.CoupeRP == 32)
    new_Skin.CoupeRP = 1961044;
  if (preferences.Config.Skin.CoupeRP == 33)
    new_Skin.CoupeRP = 1961045;
  if (preferences.Config.Skin.CoupeRP == 34)
    new_Skin.CoupeRP = 1961046;
  if (preferences.Config.Skin.CoupeRP == 35)
    new_Skin.CoupeRP = 1961050;
  if (preferences.Config.Skin.CoupeRP == 36)
    new_Skin.CoupeRP = 1961051;
  if (preferences.Config.Skin.CoupeRP == 37)
    new_Skin.CoupeRP = 1961052;
  if (preferences.Config.Skin.CoupeRP == 38)
    new_Skin.CoupeRP = 1961053;
  if (preferences.Config.Skin.CoupeRP == 39)
    new_Skin.CoupeRP = 1961054;
  if (preferences.Config.Skin.CoupeRP == 40)
    new_Skin.CoupeRP = 1961055;
  if (preferences.Config.Skin.CoupeRP == 41)
    new_Skin.CoupeRP = 1961056;
  if (preferences.Config.Skin.CoupeRP == 42)
    new_Skin.CoupeRP = 1961057;
    if (preferences.Config.Skin.CoupeRP == 43)
      new_Skin.CoupeRP = 1961138;
    if (preferences.Config.Skin.CoupeRP == 44)
      new_Skin.CoupeRP = 1961139;
    
    

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  if (preferences.Config.Skin.UAZ == 0)
    new_Skin.UAZ = 1908001;
  if (preferences.Config.Skin.UAZ == 1)
    new_Skin.UAZ = 1908095;
  if (preferences.Config.Skin.UAZ == 2)
    new_Skin.UAZ = 1908094;
  if (preferences.Config.Skin.UAZ == 3)
    new_Skin.UAZ = 1908085;
  if (preferences.Config.Skin.UAZ == 4)
    new_Skin.UAZ = 1908084;
  if (preferences.Config.Skin.UAZ == 5)
    new_Skin.UAZ = 1908078;
  if (preferences.Config.Skin.UAZ == 6)
    new_Skin.UAZ = 1908077;
  if (preferences.Config.Skin.UAZ == 7)
    new_Skin.UAZ = 1908076;
  if (preferences.Config.Skin.UAZ == 8)
    new_Skin.UAZ = 1908075;
  if (preferences.Config.Skin.UAZ == 9)
    new_Skin.UAZ = 1908070;
  if (preferences.Config.Skin.UAZ == 10)
    new_Skin.UAZ = 1908069;
  if (preferences.Config.Skin.UAZ == 11)
    new_Skin.UAZ = 1908078;
  if (preferences.Config.Skin.UAZ == 12)
    new_Skin.UAZ = 1908067;
  if (preferences.Config.Skin.UAZ == 13)
    new_Skin.UAZ = 1908066;
  if (preferences.Config.Skin.UAZ == 14)
    new_Skin.UAZ = 1908019;
  if (preferences.Config.Skin.UAZ == 15)
    new_Skin.UAZ = 1908013;
  if (preferences.Config.Skin.UAZ == 16)
    new_Skin.UAZ = 1908036;
  if (preferences.Config.Skin.UAZ == 17)
    new_Skin.UAZ = 1908032;
    if (preferences.Config.Skin.UAZ == 18)
      new_Skin.UAZ = 1908010;
    
 
 if (preferences.Config.Skin.Boat == 0)
    new_Skin.Boat = 1911001;
  if (preferences.Config.Skin.Boat == 1)
    new_Skin.Boat = 1911013;
  if (preferences.Config.Skin.Boat == 2)
    new_Skin.Boat = 1911003;
if (preferences.Config.Skin.Boat == 3)
    new_Skin.Boat = 1911004;
if (preferences.Config.Skin.Boat == 4)
    new_Skin.Boat = 1911005;
if (preferences.Config.Skin.Boat == 5)
    new_Skin.Boat = 1911006;
if (preferences.Config.Skin.Boat == 6)
    new_Skin.Boat = 1911007;
if (preferences.Config.Skin.Boat == 7)
    new_Skin.Boat = 1911008;
if (preferences.Config.Skin.Boat == 8)
    new_Skin.Boat = 1911010;
if (preferences.Config.Skin.Boat == 9)
    new_Skin.Boat = 1911011;
if (preferences.Config.Skin.Boat == 10)
    new_Skin.Boat = 1911012;

}

int m4v[] = { 101004, 1101004046, 1101004062, 1101004078, 1101004086, 1101004098, 1101004138, 1101004163,1101004201,1101004209,1101004218,1101004226,1101004154,1101004151,1101004089,1101004034,1101004002,1101004227,1101004236};



int scar[] = { 101003, 1101003057, 1101003070, 1101003080, 1101003119, 1101003146, 1101003167, 1101003181,1101003195,1101003099,1101003173};
int akmv[] = { 101001,1101001213, 1101001103, 1101001116, 1101001128, 1101001143, 1101001154, 1101001174,1101001089,1101001231,1101001242,1101001249, 1101001256,1101001023,1101001068,1101001265};






//----------------------------------------------------------------//

int m7[] = { 101008, 1101008026, 1101008051, 1101008061, 1101008081, 1101008104, 1101008116, 1101008126,1101008136,1101008070,1101008146,1101008154,1101008163};

int m7reddot[] = {         203001,203001,203001,203001,203001,203001,203001,203001,203001,203001,1010081396,1010081396};
int m7holo[] = {           203002,203002,203002,203002,203002,203002,203002,203002,203002,203002,1010081395,1010081395};
int m7x2[] = {             203003,203003,203003,203003,203003,203003,203003,203003,203003,203003,1010081394,1010081394};
int m7x3[] = {             203014,203014,203014,203014,203014,203014,203014,203014,203014,203014,1010081393,1010081393};
int m7x4[] = {             203004,203004,203004,203004,203004,203004,203004,203004,203004,203004,1010081392,1010081392};
int m7x6[] = {             203015,203015,203015,203015,203015,203015,203015,203015,203015,203015,1010081391,1010081391};
int m7Lazer[] = {          202007,202007,202007,202007,202007,202007,202007,202007,202007,202007,1010081409,1010081409};
int m7Flash[] = {          201010,201010,201010,201010,201010,201010,201010,201010,201010,201010,1010081399,1010081399};

//-------------------------------------------------------------------//












//----------------------------------------------------------------//

int awm[] = { 103003, 1103003087, 1103003022, 1103003042, 1103003051, 1103003062, 1103003079};

int awmreddot[] = {         203001,203001,203001,203001,203001,203001,};
int awmholo[] = {           203002,203002,203002,203002,203002,203002,};
int awmx2[] = {             203003,203003,203003,203003,203003,203003,};
int awmx3[] = {             203014,203014,203014,203014,203014,203014,};
int awmx4[] = {             203004,203004,203004,203004,203004,203004,};
int awmx6[] = {             203015,203015,203015,203015,203015,203015,};
int awmx8[] = {             203005,203005,203005,203005,203005,203005,};

//-------------------------------------------------------------------//






//----------------------------------------------------------------//

int amr[] = { 103012, 1103012019, 1103012010,1030120101,1103012031};

int amrreddot[] = {         203001,203001,203001,203001,};
int amrholo[] = {           203002,203002,203002,203002,};
int amrx2[] = {             203003,203003,203003,203003,};
int amrx3[] = {             203014,203014,203014,203014,};
int amrx4[] = {             203004,203004,203004,203004,};
int amrx6[] = {             203015,203015,203015,203015,};
int amrx8[] = {             203005,203005,203005,203005,};

//-------------------------------------------------------------------//






int machete[] = { 108001, 1108001069, 1108001064};
int mk14[] = { 103007, 1103007028, 1103007020};
int mini14[] = { 103006, 1103006030, 1103006058};

//----------------------------------------------------------------//

int kar[] = { 103001, 1103001060, 1103001079, 1103001101, 1103001145, 1103001160, 1103001179,1103001191,1103001183};

int karreddot[] = {         203001,203001,203001,203001,203001,203001,203001,1030011857};
int karholo[] = {           203002,203002,203002,203002,203002,203002,203002,1030011856};
int karx2[] = {             203003,203003,203003,203003,203003,203003,203003,1030011855};
int karx3[] = {             203014,203014,203014,203014,203014,203014,203014,1030011854};
int karx4[] = {             203004,203004,203004,203004,203004,203004,203004,1030011853};
int karx6[] = {             203015,203015,203015,203015,203015,203015,203015,1030011852};
int karx8[] = {             203005,203005,203005,203005,203005,203005,203005,1030011851};

//-------------------------------------------------------------------//





int mg3[] = { 105010, 1105010019,1105010008};

int mg3reddot[] = {         203001,203001,};
int mg3holo[] = {           203002,203002,};
int mg3x2[] = {             203003,203003,};
int mg3x3[] = {             203014,203014,};
int mg3x4[] = {             203004,203004,};
int mg3x6[] = {             203015,203015,};

//-------------------------------------------------------------------//

int s1897[] = { 104002, 1104002022,1104002035,1104002004};
int dbs[] = { 104004, 1104004035,1104004014,1104004015,1104004024};
int s12k[] = { 104003, 1104003038,1104003037,1104003026};
int honey[] = { 101012, 1101012009};




//----------------------------------------------------------------//

int m24[] = { 103002, 1103002087, 1103002030, 1103002048, 1103002056, 1103002059, 1103002106};

int m24reddot[] = {         203001,203001,203001,203001,203001,203001,};
int m24holo[] = {           203002,203002,203002,203002,203002,203002,};
int m24x2[] = {             203003,203003,203003,203003,203003,203003,};
int m24x3[] = {             203014,203014,203014,203014,203014,203014,};
int m24x4[] = {             203004,203004,203004,203004,203004,203004,};
int m24x6[] = {             203015,203015,203015,203015,203015,203015,};
int m24x8[] = {             203005,203005,203005,203005,203005,203005,};

//-------------------------------------------------------------------//
















int dp[] = { 105002, 1105002018, 1105002035, 1105002058, 1105002063, 1105002091};
int m249[] = { 105001, 1105001020, 1105001034, 1105001048, 1105001054, 1105001069};

//----------------------------------------------------------------//
int groza[] = { 101005, 1101005019, 1101005025, 1101005038, 1101005043, 1101005052, 1101005082,1101005098};
int Groza_2[] = {             291005,1010050381,1010050521,1010050821,1010050191,1010050251,1010050431};
int grozareddot[] = {         203001,1010050326,1010050466,203001,    203001,    203001,    203001};
int grozasilent[] = {         201011,1010050327,1010050467,201011,    201011,    201011,    201011};
int grozaholo[] = {           203002,1010050325,1010050465,203002,    203002,    203002,    203002};
int grozax2[] = {             203003,1010050324,1010050464,203003,    203003,    203003,    203003};
int grozax3[] = {             203014,1010050323,1010050463,203014,    203014,    203014,    203014};
int grozax4[] = {             203004,1010050322,1010050462,203004,    203004,    203004,    203004};
int grozax6[] = {             203015,203015,    203015,    203015,    203015,    203015,    203015};
int grozaquickMag[] = {       204012,1010050328,1010050468,204012,    204012,    204012,    204012};
int grozaextendedMag[] = {    204011,1010050329,1010050469,204011,    204011,    204011,    204011};
int grozaquickNextended[] = { 204013,1010050330,1010050470,204013,    204013,    204013,    204013};
//----------------------------------------------------------------//

int famas[] ={ 101100,1101100012,1101100013};

int famasreddot[] = {         203001,203001,203001,};
int famasholo[] = {           203002,203002,203002,};
int famasx2[] = {             203003,203003,203003,};
int famasx3[] = {             203014,203014,203014,};
int famasx4[] = {             203004,203004,203004,};
int famasx6[] = {             203015,203015,203015,};



//----------------------------------------------------------------//

int aug[] = { 101006, 1101006033, 1101006044, 1101006062,1101006075,1101006067,1101006085};

int augreddot[] = {         203001,1010060562,203001,203001,1010060696,};
int augholo[] = {           203002,1010060561,203002,203002,1010060695,};
int augx2[] = {             203003,1010060554,203003,203003,1010060694,};
int augx3[] = {             203014,1010060553,203014,203014,1010060693,};
int augx4[] = {             203004,1010060552,203004,203004,1010060692,};
int augx6[] = {             203015,1010060551,203015,203015,1010060691,};
int augLazer[] = {             202007,1010060574,202007,202007,1010060707,};
int augFlash[] = {            201010,1010060571,201010,201010,1010060699,};

//-------------------------------------------------------------------//











int qbz[] = { 101007, 1101007062, 1101007046, 1101007036, 1101007025};
int m16[] = { 101002, 1101002029, 1101002056, 1101002068, 1101002081, 1101002103};
int uzi[] = { 102001, 1102001024, 1102001036, 1102001058, 1102001069, 1102001089, 1102001102, 1102001130};

//-----------------------------------------------------------------//
int ump[] = { 102002,1102002136, 1102002061, 1102002090, 1102002117, 1102002124, 1102002129, 1102002043,1102002030,1102002083,1102002424};

int umpreddot[] = {         203001,203001,203001,203001,203001,203001,203001,203001,203001,203001};
int umpholo[] = {           203002,203002,203002,203002,203002,203002,203002,203002,203002,203002};
int umpx2[] = {             203003,203003,203003,203003,203003,203003,203003,203003,203003,203003};
int umpx3[] = {             203014,203014,203014,203014,203014,203014,203014,203014,203014,203014};
int umpx4[] = {             203004,203004,203004,203004,203004,203004,203004,203004,203004,203004};
int umpx6[] = {             203015,203015,203015,203015,203015,203015,203015,203015,203015,203015};


//----------------------------------------------------------------//

int vectorr[] = { 102003, 1102003020, 1102003031, 1102003065, 1102003080};
int tommy[] = { 102004, 1102004018, 1102004034};
int p90[] = { 102105, 1102105012};
int bizon[] = { 102005, 1102005007, 1102005020, 1102005041, 1102005064};


//-------------------------------------------------------------------//





int ace32[] = { 101102, 1101102007, 1101102017,1101102025};


int ace32reddot[] = {         203001,203001,203001,203001};
int ace32holo[] = {           203002,203002,203002,203002};
int ace32x2[] = {             203003,203003,203003,203003};
int ace32x3[] = {             203014,203014,203014,203014};
int ace32x4[] = {             203004,203004,203004,203004};
int ace32x6[] = {             203015,203015,203015,203015};

//-------------------------------------------------------------------//





int pan[] = { 108004, 1108004125, 1108004145, 1108004160, 1108004283, 1108004337, 1108004356, 1108004365, 1108004054, 1108004008, 1108004033};

int m249s[] = { 205009, 1050010351, 1050010412, 1050010482, 1050010542};

//-------------------------------------------------------------------//

int akmmag[] = { 291001,204013,204011,204012,1010010891, 1010011031, 1010011161,1010011281, 1010011431, 1010011541, 1010011741,1010012131,1010012311,1010012421,1010012491,1101001023};
int akreddot[] = { 203001,1010012066,1010011105,1010011226,    1010011486,1010011666,1010012506,1010012266};
int akflash[] = {201010,1010012067, 1010011106,1010011232,    1010011487,1010011667,1010012507,1010012267};
int akcompe[] = {201009,1010012068,1010011107,1010011233,    1010011488,1010011668,1010012508,1010012274};
int aksilent[] = {201011,1010012069,1010011108,1010011234,    1010011489,1010011669,1010012509,1010012269};
int akholo[] = {203002,1010012065, 1010011104,1010011225,    1010011485,1010011665,1010012265, 1010012505,1010012265};
int akx2[] = {203003,1010012064, 1010011103,1010011224,    1010011484,1010011664,1010012504 ,1010012264};
int akx3[] = {203014,1010012063, 1010011223, 1010011483,1010011663,1010012503,1010012263};
int akx4[] = {203004,1010012062,1010011222,1010011222,1010011482,1010011662,1010012502  ,1010012262};
int akx6[] = {203015,1010012516,1010012276};
int akquickMag[] = {204012,1010012070,  1010011109,1010011227,    1010011490,1010011670,1010012512 };
int akextendedMag[] = {204011,1010012072,  1010011228,    1010011493,1010011673,1010012513  };
int akquickNextended[] = { 204013,1010012073,   1010011112,1010011229,    1010011494,1010011674,1010012514  };

//-------------------------------------------------------------------//

int m7mag[] = { 291008,204013,204011,204012,1010080261, 1010080511, 1010080611, 1010080811, 1010081041, 1010081161, 1010081261,1010081361};




//-----------------------------------------------------------//
int scarmag[] = { 291003,204013,204011,204012,1010030571, 1010030701, 1010030801, 1010031191, 1010031461, 1010031671, 1010031811};
int scarsight[] = {          203007,203007    ,1010031672,1010031192,1010030702,1010030572,1010030802,1010031462      };
int scarreddot[] = {         203001,1010031757,1010031606,1010031136};
int scarflash[] = {          201010,1010031765,1010031609,1010031139};
int scarcompe[] = {          201009,1010031764,1010031610,1010031140};
int scarsilent[] = {         201011,1010031766,1010031613,1010031142};
int scarholo[] = {           203002,1010031756,1010031605,1010031135};
int scarx2[] = {             203003,1010031755,1010031604,1010031134};
int scarx3[] = {             203014,1010031754,1010031603,1010031133};
int scarx4[] = {             203004,1010031753,1010031602,1010031132};
int scarx6[] = {             203015,1010031752,203015    ,203015    };
int scarquickMag[] = {       204012,1010031758,1010031607,1010031137};
int scarextendedMag[] = {    204011,1010031759,1010031608,1010031138};
int scarquickNextended[] = { 204013,1010031763,1010031617,1010031146};
int scarverical[] = {        202002,1010031769,1010031615,1010031144};
int scarangle[] = {          202001,1010031767,1010031614,1010031143};
int scarlightgrip[] = {      202004,1010031773,202004    ,202004    };
int scarpink[] = {           202005,1010031774,202005    ,202005    };
int scarlazer[] = {          202007,1010031772,202007    ,202007    };
int scarthumb[] = {          202006,1010031768,1010031616,1010031145};
//-----------------------------------------------------------//

int m4mag[] = { 291004,204013,204011,204012,1010040461,1010040611,1010040781,1010040861,1010040981,1010041381,1010041631,1010042011,1010042073,1010042153,1010042181,1010042214,1010042361  };


int m4sight[] = { 203008,1010040462,1010040612,1010040782,1010040862,1010040982,1010041382,1010041632,1010042012,1010042083,1010042163,1010042182,1010042215,1010042362  };

int m4stock[] = { 205005,1010040463,1010040613,1010040783,1010040863,1010040983,1010041383,1010041633,1010042013,1010042093,1010042173,1010042183,1010042216,1010042363  };

int m4stock1[] = { 205002,1010040480,205002,205002,205002,205002,1010041146,1010041579,1010041966,1010042137,1010042173  };

int m4reddot[] = { 203001,1010040470,203001,203001,203001,203001,1010041128,1010041566,1010041948,1010042029,1010042119,1010042119  };
    
int m4holo[] = { 203002,1010040469,203002,203002,203002,203002,1010041127,1010041565,1010041947,1010042028,1010042118,1010042232  };
int M416_x2[] = { 203003,1010040468,203003,203003,203003,203003,1010041126,1010041564,1010041946,1010042027,1010042117,1010042231  };
int M416_x3[] = { 203014,203014,1010040467,203014,203014,203014,1010041125,1010041560,1010041945,1010042026,1010042116,1010042219 };
 
int m4x4[] = {203004,1010040466,203004,203004,203004,203004,1010041124,1010041554,1010041944,1010042025,1010042115,1010042218
    };
    
int m4x6[] = {203015,1010040481,203015,203015,203015,203015,203015,203015,1010041967,1010042024,1010042114,1010042217
    };

int m16s[] = { 205007, 1010020292, 1010020562, 1010020682, 1010020812, 1010021032};
int m16mag[] = { 291002,204013,204011,204012, 1010020291, 1010020561, 1010020681, 1010020811, 1010021031};


int emote1[] = { 2200101,12220023,12219677,12219716,12209401,12220028,12209701,12209801,12209901 };
int emote2[] = { 2200201,12210201,12210601,12220028,12219819,12211801,12212001,12212201,12212401 };
int emote3[] = { 2200301,12212601,12213201,12219715,12219814,12213601,12213801,12214001,12214201 };

int SuitX[] = { 403003,1406469,1405870,1407140,1407141,1406311,1406475,1406638,1406872,1406971,1407103, 1407366,1407259,1407512,1400687,1406891,1407277,1400687,1407106,1407049,1406244,1407160,1400782,1407188,1407187,1400569,1404000,1404049,1407202,1407210,1407212,1407195,1407194,1407225,1407285,1407275,1407276,1407307,1407286,1407277,1400117,1407618};

int Gloves[] = { 0,452001,452002,452003 };

int Bag1[] =     {501001, 1501003174, 1501003220, 1501003607, 1501003318, 1501003411, 1501003422, 1501003443, 1501003466, 1501003061, 1501003047,1501003039,1501003471,1501003487,1501003503,1501003515,1501003550,1501003558,1501003058,1501003057,1501003051,1501003043,1501003042,1501003229,1501003023,1501003022};

int Bag2[] =     {501001, 1501003174, 1501003220, 1501003607, 1501003318, 1501003411, 1501003422, 1501003443, 1501003466, 1501003061, 1501003047,1501003039,1501003471,1501003487,1501003503,1501003515,1501003550,1501003558,1501003058,1501003057,1501003051,1501003043,1501003042,1501003229,1501003023,1501003022};

int Bag[] =     {501001, 1501003174, 1501003220, 1501003607, 1501003318, 1501003411, 1501003422, 1501003443, 1501003466, 1501003061, 1501003047,1501003039,1501003471,1501003487,1501003503,1501003515,1501003550,1501003558,1501003058,1501003057,1501003051,1501003043,1501003042,1501003229,1501003023,1501003022};


int Helmet1[] = {502001,1502003014,1502003349,1502003012,1502003009,1502003397,1502003390,1502003381,1502003358,1502003350,1502003342,1502003336,   1502003333,1502003327,1502003325,1502003299,1502003295,1502003222,1502003069,1502003054,1502003033,1502003016,1502003031,1502003023,1502003018};

int Helmet2[] = {502001,1502003014,1502003349,1502003012,1502003009,1502003397,1502003390,1502003381,1502003358,1502003350,1502003342,1502003336,   1502003333,1502003327,1502003325,1502003299,1502003295,1502003222,1502003069,1502003054,1502003033,1502003016,1502003031,1502003023,1502003018};

int Helmet[] = {502001,1502003014,1502003349,1502003012,1502003009,1502003397,1502003390,1502003381,1502003358,1502003350,1502003342,1502003336,   1502003333,1502003327,1502003325,1502003299,1502003295,1502003222,1502003069,1502003054,1502003033,1502003016,1502003031,1502003023,1502003018};


static int prevXSuits = preferences.Config.Skin.XSuits;
static int prevBalo = preferences.bag;
static int prevMu = preferences.helmet;
static int prevgangtay = preferences.Config.Skin.Gloves;
static int prevdu = preferences.Config.Skin.Parachute;
static auto start = std::chrono::high_resolution_clock::now();
static bool callFunction = false;



//-----------------------Hết Khai Báo Mod Skin---------------------------//


@implementation ImGuiDrawView2

kaddr getRealOffset(kaddr offset){
    return (unsigned long)Get_module_base()+offset; //rootfull
}
long obbbbl() {
        NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
        NSString *BundID = [infoDictionary objectForKey:@"CFBundleIdentifier"];
        if([BundID containsString:@"ig"]){
            return getRealOffset(0x10A87AC70);
        }
        if([BundID containsString:@"kr"]){
            return getRealOffset(0x10AA5C770);
        }
        if([BundID containsString:@"rekoo"]){
            return getRealOffset(0x10AA36670);
        }
        if([BundID containsString:@"vn"]){
            return getRealOffset(0x10A4A4A70);
        }
        return false;
};
UWorld *GEWorld;
int GWorldNum = 0;
TUObjectArray gobjects;
UWorld *GetFullWorld()
{
    if(GWorldNum == 0) {
        gobjects = UObject::GUObjectArray->ObjObjects;
        for (int i=0; i< gobjects.Num(); i++)
            if (auto obj = gobjects.GetByIndex(i)) {
                if(obj->IsA(UEngine::StaticClass())) {
                    auto GEngine = (UEngine *) obj;
                    if(GEngine) {
                        auto ViewPort = GEngine->GameViewport;
                        if (ViewPort)
                        {
                            GEWorld = ViewPort->World;
                            GWorldNum = i;
                            return ViewPort->World;
                        }
                    }
                }
            }
    }else {
        auto GEngine = (UEngine *) (gobjects.GetByIndex(GWorldNum));
        if(GEngine) {
            auto ViewPort = GEngine->GameViewport;
            if(ViewPort) {
                GEWorld = ViewPort->World;
                return ViewPort->World;
            }
        }
    }
    return 0;
}

TNameEntryArray *GetGNames() {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
      NSString *BundID = [infoDictionary objectForKey:@"CFBundleIdentifier"];
    if([BundID containsString:@"ig"]){
        return ((TNameEntryArray *(*)()) ((unsigned long)Get_module_base() + 0x104AB914C))();
    }
    if([BundID containsString:@"kr"]){
        return ((TNameEntryArray *(*)()) ((unsigned long)Get_module_base() + 0x104C630A0))();
    }
    if([BundID containsString:@"rekoo"]){
        return ((TNameEntryArray *(*)()) ((unsigned long)Get_module_base() + 0x104C3A12C))();
    }
    if([BundID containsString:@"vn"]){
        return ((TNameEntryArray *(*)()) ((unsigned long)Get_module_base() + 0x104A847E0))();
    }
    return 0;
}







template <class T> void GetAllActors(std::vector<T*>& Actors) {
    UGameplayStatics* gGameplayStatics = (UGameplayStatics*)gGameplayStatics->StaticClass();
    auto GWorld = GetFullWorld();
    if (GWorld) {
        TArray<AActor*> Actors2;
        gGameplayStatics->GetAllActorsOfClass((UObject*)GWorld, T::StaticClass(), &Actors2);
        for (int i = 0; i < Actors2.Num(); i++) {
            Actors.push_back((T*)Actors2[i]);
        }
    }
}


//------------------------------END-------------------------------//
ASTExtraPlayerCharacter *g_LocalPlayer = 0;
ASTExtraPlayerController *g_PlayerController = 0;

FTransform (*O_GetMuzzleTransform)(ASTExtraShootWeapon *weapon);

FTransform GetMuzzleTransform(ASTExtraShootWeapon *weapon) {
    auto result = O_GetMuzzleTransform(weapon);
    result.Translation.Z += muzzleOffsetZ;
    return result;
}
//==============================KHAI BÁO FVector=================================//

FVector GetBoneLocationByName(ASTExtraPlayerCharacter *Actor, const struct FName BoneName) {
    return Actor->GetBonePos(BoneName, FVector());
}

//==============================END KHAI BÁO FVector=================================//




//--------------------------Khai Báo Vẽ---------------------------------------//
float GetD3DDistance(FVector a, FVector b)
{
    FVector vector = {a.X - b.X, a.Y - b.Y, a.Z - b.Z};
    return sqrt(((vector.X * vector.X) + (vector.Y * vector.Y)) + (vector.Z * vector.Z));
}

//----------------------------khai báo mod skin-------------------------------//

static std::unordered_set<uint32_t> AlreadyChangedSet;
uintptr_t GetVirtualFunctionAddress(uintptr_t clazz, uintptr_t index)
{
    if (!clazz)
    {
        return 0;
    }
    uintptr_t vtablePtr = *(uintptr_t*)clazz;
    if (!vtablePtr)
    {
        return 0;
    }
    if (index < 0)
    {
        return 0;
    }
    return *((uintptr_t*)vtablePtr + index);
}
void ChangeItemAVc(uintptr_t thiz, int InItemID)
{
    if (thiz)
    {
        auto PrechangeitemAvatar_addr = GetVirtualFunctionAddress(thiz, 184); //vtable idx
        if (PrechangeitemAvatar_addr)
        {
            return ((void(*)(uintptr_t, int, bool))PrechangeitemAvatar_addr)(thiz, InItemID, true);
        }
    }
}


UKismetMathLibrary* umcc = (UKismetMathLibrary*)UKismetMathLibrary::StaticClass();


UGameplayStatics* iosde = (UGameplayStatics*)UGameplayStatics::StaticClass();
ASTExtraPlayerController *localPlayerController = 0;

void IMGUI_GOD(FRotator &angles) {
    if (angles.Pitch > 180)
        angles.Pitch -= 360;
    if (angles.Pitch < -180)
        angles.Pitch += 360;

    if (angles.Pitch < -75.f)
        angles.Pitch = -75.f;
    else if (angles.Pitch > 75.f)
        angles.Pitch = 75.f;

    while (angles.Yaw < -180.0f)
        angles.Yaw += 360.0f;
    while (angles.Yaw > 180.0f)
        angles.Yaw -= 360.0f;
}
void IMGUI_GOD(float *angles) {
    if (angles[0] > 180)
        angles[0] -= 360;
    if (angles[0] < -180)
        angles[0] += 360;

    if (angles[0] < -75.f)
        angles[0] = -75.f;
    else if (angles[0] > 75.f)
        angles[0] = 75.f;

    while (angles[1] < -180.0f)
        angles[1] += 360.0f;
    while (angles[1] > 180.0f)
        angles[1] -= 360.0f;
}

void IMGUI_GOD(FVector2D angles) {
    if (angles.X > 180)
        angles.X -= 360;
    if (angles.X < -180)
        angles.X += 360;

    if (angles.X < -75.f)
        angles.X = -75.f;
    else if (angles.X > 75.f)
        angles.X = 75.f;

    while (angles.Y < -180.0f)
        angles.Y += 360.0f;
    while (angles.Y > 180.0f)
        angles.Y -= 360.0f;
}

//--------------------------kết thúc Khai Báo Vẽ ---------------------------------------//

auto GetTargetForAimBotByFOV() {
    UGameplayStatics *GameplayStatics = (UGameplayStatics *) UGameplayStatics::StaticClass();
    ASTExtraPlayerCharacter *result = 0;
    ASTExtraPlayerCharacter *localPlayer = 0;
    ASTExtraPlayerController *localPlayerController = 0;

    auto GWorld = GetFullWorld();
    if (GWorld) {
        UNetDriver *NetDriver = GWorld->NetDriver;
        if (NetDriver) {
            UNetConnection *ServerConnection = NetDriver->ServerConnection;
            if (ServerConnection) {
                localPlayerController = (ASTExtraPlayerController *) ServerConnection->PlayerController;
            }
        }
        if (localPlayerController) {
            std::vector<ASTExtraPlayerCharacter*> PlayerCharacter;
            GetAllActors(PlayerCharacter);
            for (auto actor = PlayerCharacter.begin(); actor != PlayerCharacter.end(); actor++) {
                auto Actor = *actor;
                if (Actor->PlayerKey == ((ASTExtraPlayerController *) localPlayerController)->PlayerKey) {
                    localPlayer = Actor;
                    break;
                }
            }
            float max = std::numeric_limits<float>::infinity();
            std::vector<ASTExtraPlayerCharacter*> PlayerCharacter2;
            GetAllActors(PlayerCharacter2);
            for (auto actor = PlayerCharacter2.begin(); actor != PlayerCharacter2.end();
                 actor++)
            {
                
                auto Player = *actor;
                float Distance = Player->GetDistanceTo(localPlayer) / 100.f;
                if(IsDistanceAimbot < Distance)
                        continue;
                if (Player->PlayerKey == localPlayer->PlayerKey)
                    continue;
                if (Player->TeamID == localPlayer->TeamID)
                    continue;
                if (Player->bDead)
                    continue;
                if (Player->bHidden )
                    continue;
                if (!Player->Mesh)
                    continue;
                if (!Player->RootComponent)
                    continue;
                if (IsIgnoreKnock) {
                    if (Player->Health == 0.0f)
                        continue;
                }
                if(isAimvisual){
                    if (!localPlayerController->LineOfSightTo(Player, {0, 0, 0}, true))
                        continue;
                }
                if (Igronebot) {
                    if (Player->bEnsure)
                        continue;
                }
                auto Root = GetBoneLocationByName(Player, "Root");
                auto Head = GetBoneLocationByName(Player, "Head");
                FVector2D RootSc, HeadSc;
                if (GameplayStatics->ProjectWorldToScreen(g_PlayerController, Root, false, &RootSc) && GameplayStatics->ProjectWorldToScreen(g_PlayerController, Head, false, &HeadSc)) {
                    float height = abs(HeadSc.Y - RootSc.Y);
                    float width = height * 0.65f;
                    FVector middlePoint = {HeadSc.X + (width / 2), HeadSc.Y + (height / 2), 0};
                    if ((middlePoint.X >= 0 && middlePoint.X <= screenWidth) && (middlePoint.Y >= 0 && middlePoint.Y <= screenHeight)) {
                        FVector2D v2Middle = FVector2D((float) (screenWidth / 2), (float) (screenHeight / 2));
                        FVector2D v2Loc = FVector2D(middlePoint.X, middlePoint.Y);
                        if(isInsideFOV((int)middlePoint.X, (int)middlePoint.Y)) {
                            float dist = FVector2D::Distance(v2Middle, v2Loc);
                            if (dist < max) {
                                max = dist;
                                result = Player;
                            }
                        }
                    }
                }
            }
        }
    }
    return result;
}

static inline float Dot3(const FVector& a, const FVector& b){ return a.X*b.X + a.Y*b.Y + a.Z*b.Z; }
static inline float Len (const FVector& v){ return sqrtf(v.X*v.X + v.Y*v.Y + v.Z*v.Z); }
static inline float DegToRad(float d){ return d * 0.017453292519943295f; } // PI/180

static ASTExtraVehicleBase* PickVehicleNearCrosshair(
    APlayerController* PC, const FVector& start, const FRotator& shotRot, float coneDeg, bool doVis)
{
    if (!PC || !g_LocalPlayer) return nullptr;

    TArray<AActor*> all;
    UGameplayStatics::GetAllActorsOfClass((UObject*)PC, AActor::StaticClass(), &all);

    FVector aimDir = UKismetMathLibrary::GetForwardVector(shotRot);
    float l2 = aimDir.X*aimDir.X + aimDir.Y*aimDir.Y + aimDir.Z*aimDir.Z;
    if (l2 < 0.5f && PC->PlayerCameraManager)
        aimDir = UKismetMathLibrary::GetForwardVector(PC->PlayerCameraManager->GetCameraRotation());

    const float coneCos = cosf(DegToRad(coneDeg>0.f?coneDeg:10.f));
    FVector viewLoc = g_LocalPlayer->GetBonePos("Head", {}); viewLoc.Z += 10.f;

    float best = 1e9f;
    ASTExtraVehicleBase* bestVeh = nullptr;

    for (int i=0;i<all.Num();++i){
        AActor* a = all[i];
        if (!a || !a->IsA(ASTExtraVehicleBase::StaticClass())) continue;

        auto* V = (ASTExtraVehicleBase*)a;
        if (!V->RootComponent) continue;
        if (doVis && !IsPartiallyVisible(PC, V, viewLoc)) continue;

        FVector to = UKismetMathLibrary::Subtract_VectorVector(V->K2_GetActorLocation(), start);
        float d = Len(to); if (d < 1.f) continue;

        FVector dir = { to.X/d, to.Y/d, to.Z/d };
        float dot = Dot3(aimDir, dir);
        if (dot < coneCos) continue;

        float score = (1.f - dot)*1000.f + (d * 0.001f);
        if (score < best){ best = score; bestVeh = V; }
    }
    return bestVeh;
}

static ASTExtraPlayerCharacter* FindVehicleOccupant(ASTExtraVehicleBase* Veh){
    if (!Veh) return nullptr;

    TArray<AActor*> allP;
    UGameplayStatics::GetAllActorsOfClass((UObject*)Veh, ASTExtraPlayerCharacter::StaticClass(), &allP);

    ASTExtraPlayerCharacter* best = nullptr;
    float bestD = 1e9f;

    FVector cam = g_LocalPlayer ? g_LocalPlayer->GetBonePos("Head", {}) : FVector();
    cam.Z += 10.f;

    for (int i=0;i<allP.Num();++i){
        auto* P = (ASTExtraPlayerCharacter*)allP[i];
        if (!P || P==g_LocalPlayer) continue;
        if (P->bDead) continue;
        if (P->CurrentVehicle != Veh) continue;

        float d = Len(UKismetMathLibrary::Subtract_VectorVector(P->K2_GetActorLocation(), cam));
        if (d < bestD){ bestD = d; best = P; }
    }
    return best;
}

static ASTExtraPlayerCharacter* PickAirborneOrPeekNearCrosshair(
    APlayerController* PC, const FVector& start, const FRotator& shotRot, float coneDeg)
{
    if (!PC || !g_LocalPlayer) return nullptr;

    TArray<AActor*> allP;
    UGameplayStatics::GetAllActorsOfClass((UObject*)PC, ASTExtraPlayerCharacter::StaticClass(), &allP);

    FVector aimDir = UKismetMathLibrary::GetForwardVector(shotRot);
    float l2 = aimDir.X*aimDir.X + aimDir.Y*aimDir.Y + aimDir.Z*aimDir.Z;
    if (l2 < 0.5f && PC->PlayerCameraManager)
        aimDir = UKismetMathLibrary::GetForwardVector(PC->PlayerCameraManager->GetCameraRotation());

    const float coneCos = cosf(DegToRad(coneDeg>0.f?coneDeg:8.f));
    FVector viewLoc = g_LocalPlayer->GetBonePos("Head", {}); viewLoc.Z += 10.f;

    ASTExtraPlayerCharacter* best = nullptr;
    float bestScore = 1e9f;

    for (int i=0;i<allP.Num();++i){
        auto* P = (ASTExtraPlayerCharacter*)allP[i];
        if (!P || P==g_LocalPlayer) continue;
        if (P->bDead) continue;

        FVector v = P->GetVelocity();
        bool airborneish = (fabsf(v.Z) > 120.f);

        if (!airborneish && !IsPartiallyVisible(PC, (AActor*)P, viewLoc)) continue;

        FVector to = UKismetMathLibrary::Subtract_VectorVector(P->K2_GetActorLocation(), start);
        float d = Len(to); if (d < 1.f) continue;

        FVector dir = { to.X/d, to.Y/d, to.Z/d };
        float dot = Dot3(aimDir, dir);
        if (dot < coneCos) continue;

        float score = (1.f - dot)*1000.f + (d * 0.001f);
        if (score < bestScore){ bestScore = score; best = P; }
    }
    return best;
}

auto GetTargetByCrossDist() {
    ASTExtraPlayerCharacter *result = 0;
    float max = std::numeric_limits<float>::infinity();

    auto localPlayer = g_LocalPlayer;
    auto localController = g_PlayerController;

    if (localPlayer && localController) {
        std::vector<ASTExtraPlayerCharacter *> PlayerCharacter;
        GetAllActors(PlayerCharacter);
        for (auto actor = PlayerCharacter.begin(); actor != PlayerCharacter.end(); actor++) {
            auto Player = *actor;
                
            if (Player->PlayerKey == localPlayer->PlayerKey)
                continue;

            if (Player->TeamID == localPlayer->TeamID)
                continue;

            if (Player->bDead)
                continue;

            if (Player->bHidden) //
                continue;

            if (!Player->Mesh) //
                continue;

            if (!Player->RootComponent) //
                continue;

            if (IsIgnoreKnock) {
                if (Player->Health == 0.0f)
                    continue;
            }

            if (Igronebot) {
                if (Player->bEnsure)
                    continue;
            }
           
            float dist = localPlayer->GetDistanceTo(Player) / 100.0f;
                if (dist > IsDistanceAimbot)
                continue;
            
            if (isAimvisual) {
                if (!localController->LineOfSightTo(Player, {0, 0, 0}, true))
                    continue;
            }


        }
    }
    return result;
}

static float GetPingSeconds(APlayerController* /*PC*/) {
    float ms = SilentAimPingMs;
    if (ms < 0.f)   ms = 0.f;
    if (ms > 400.f) ms = 400.f;
    return ms * 0.001f;
}

static bool IsPartiallyVisible(APlayerController* PC, AActor* Other, const FVector& viewLoc){
    if (!PC || !Other) return false;
    if (PC->LineOfSightTo(Other, viewLoc, true)) return true;

    FVector to = UKismetMathLibrary::Subtract_VectorVector(Other->K2_GetActorLocation(), viewLoc);
    float   d  = Len(to);
    if (d <= 12000.f) {
        FRotator rot = PC->GetControlRotation();
        FVector fwd  = UKismetMathLibrary::GetForwardVector(rot);
        FVector dir  = { to.X/d, to.Y/d, to.Z/d };
        float   cosT = Dot3(fwd, dir);
        if (cosT > cosf(DegToRad(6.0f))) return true;
    }
    return false;
}

static bool IsVisiblePoint(APlayerController* PC, AActor* Target, const FVector& from, const FVector& to) {
    if (!PC || !Target) return false;
    // PUBG SDK me 'LineOfSightTo' ek location leta hai — hum 'to' pass karenge.
    return PC->LineOfSightTo(Target, to, true);
}

static FVector GetBestBonePosVisible(ASTExtraPlayerCharacter* P, APlayerController* PC, const FVector& viewLoc){
    if (!P) return FVector{0,0,0};

    // order tuned for peek/cover cases
    static const char* bones[] = {
        "Head","neck_01","spine_03","spine_02",
        "hand_r","hand_l","lowerarm_r","lowerarm_l","upperarm_r","upperarm_l",
        "foot_r","foot_l","calf_r","calf_l","thigh_r","thigh_l",
        "spine_01","pelvis"
    };

    FVector fallback{0,0,0};
    for (int i=0;i<(int)(sizeof(bones)/sizeof(bones[0])); ++i) {
        FVector p = P->GetBonePos(bones[i], {});
        if (!(p.X||p.Y||p.Z)) continue;
        if (IsVisiblePoint(PC, (AActor*)P, viewLoc, p)) {
            return p; // first visible bone wins
        }
        if (!(fallback.X||fallback.Y||fallback.Z)) fallback = p;
    }
    if (fallback.X||fallback.Y||fallback.Z) return fallback;
    FVector h = P->GetBonePos("Head", {}); if (h.X||h.Y||h.Z) return h;
    return P->GetBonePos("pelvis", {});
}

auto GetCurrentWeaponReplicated(ASTExtraPlayerCharacter * mode) {
    auto WeaponManagerComponent = mode->WeaponManagerComponent;
    if (WeaponManagerComponent) {
        auto propSlot = WeaponManagerComponent->GetCurrentUsingPropSlot();
        if ((int)propSlot.GetValue() >= 1 && (int)propSlot.GetValue() <= 3) {
            return (ASTExtraShootWeapon *)WeaponManagerComponent->CurrentWeaponReplicated;
        }
    }
}



bool isInsideFOV(int x, int y) {
    if (!IsRadius)
        return true;
    int circle_x = screenWidth / 2;
    int circle_y = screenHeight / 2;
    int rad = (int) IsRadius * 2.0f;
    return (x - circle_x) * (x - circle_x) + (y - circle_y) * (y - circle_y) <= rad * rad;
}

auto VIP_Fov_Based() -> ASTExtraPlayerCharacter* {
    ASTExtraPlayerController* PC = nullptr;
    ASTExtraPlayerCharacter*  me = nullptr;
    ASTExtraPlayerCharacter*  best = nullptr;
    float bestDist = IsRadius;

    if (auto* GWorld = GetFullWorld()) {
        if (GWorld->NetDriver && GWorld->NetDriver->ServerConnection)
            PC = (ASTExtraPlayerController*)GWorld->NetDriver->ServerConnection->PlayerController;
    }
    if (!PC) return nullptr;

    std::vector<ASTExtraPlayerCharacter*> players;
    GetAllActors(players);

    for (auto* A : players) { if (A && A->PlayerKey == PC->PlayerKey) { me = A; break; } }
    if (!me) return nullptr;

    const float cx = screenWidth * 0.5f, cy = screenHeight * 0.5f;

    for (auto* P : players) {
        if (!P || P == me)                        continue;
        if (P->TeamID == me->TeamID)              continue;
        if (P->bDead || P->bHidden)               continue;
        if (!P->Mesh || !P->RootComponent)        continue;
        if (IsIgnoreKnock && P->Health == 0.0f) continue;
        if (Igronebot && P->bEnsure)            continue;

        const FVector HeadPos    = P->GetBonePos("Head", {});
        const FVector neck_01    = P->GetBonePos("neck_01", {});
        const FVector spine_03   = P->GetBonePos("spine_03", {});
        const FVector spine_02   = P->GetBonePos("spine_02", {});
        const FVector hand_r     = P->GetBonePos("hand_r", {});
        const FVector hand_l     = P->GetBonePos("hand_l", {});
        const FVector lowerarm_r = P->GetBonePos("lowerarm_r", {});
        const FVector lowerarm_l = P->GetBonePos("lowerarm_l", {});
        const FVector upperarm_r = P->GetBonePos("upperarm_r", {});
        const FVector upperarm_l = P->GetBonePos("upperarm_l", {});
        const FVector foot_r     = P->GetBonePos("foot_r", {});
        const FVector foot_l     = P->GetBonePos("foot_l", {});
        const FVector calf_r     = P->GetBonePos("calf_r", {});
        const FVector calf_l     = P->GetBonePos("calf_l", {});
        const FVector thigh_r    = P->GetBonePos("thigh_r", {});
        const FVector thigh_l    = P->GetBonePos("thigh_l", {});
        const FVector spine_01   = P->GetBonePos("spine_01", {});
        const FVector pelvis     = P->GetBonePos("pelvis", {});

        const FVector bones[] = {
            HeadPos, neck_01, spine_03, spine_02,
            hand_r, hand_l, lowerarm_r, lowerarm_l, upperarm_r, upperarm_l,
            foot_r, foot_l, calf_r, calf_l, thigh_r, thigh_l,
            spine_01, pelvis
        };

        float bestBoneDist = 1e9f;
        bool  anyBoneOk = false;

        for (const FVector& w : bones) {
            if (!(w.X || w.Y || w.Z)) continue;
            if (isAimvisual && !PC->LineOfSightTo(P, w, true)) continue;

            FVector2D s;
            if (!UGameplayStatics::ProjectWorldToScreen(PC, w, true, &s)) continue;

            const float dx = s.X - cx, dy = s.Y - cy;
            const float pd = sqrtf(dx * dx + dy * dy);

            if (pd < bestBoneDist) { bestBoneDist = pd; anyBoneOk = true; }
        }

        if (anyBoneOk && bestBoneDist <= bestDist) {
            bestDist = bestBoneDist;
            best = P;
        }
    }

        // 🔹 Fake Damage FIX (CameraCache compatible with your SDK)
    if (best && PC->PlayerCameraManager) {
        auto CameraCache = PC->PlayerCameraManager->CameraCache;
        FVector camLoc = CameraCache.POV.Location;
        FRotator camRot = CameraCache.POV.Rotation;

        // manual zero check (since IsZero() missing)
        if (camLoc.X == 0 && camLoc.Y == 0 && camLoc.Z == 0) {
            // fallback: use K2_ functions (your SDK’s valid versions)
            camLoc = PC->PlayerCameraManager->K2_GetActorLocation();
            camRot = PC->PlayerCameraManager->K2_GetActorRotation();
        }

        FVector target = best->GetBonePos("Head", {});

        FVector dir;
        dir.X = target.X - camLoc.X;
        dir.Y = target.Y - camLoc.Y;
        dir.Z = target.Z - camLoc.Z;

        float mag = sqrtf(dir.X * dir.X + dir.Y * dir.Y + dir.Z * dir.Z);
        if (mag > 0.0001f) {
            dir.X /= mag;
            dir.Y /= mag;
            dir.Z /= mag;
        }

        PC->ControlRotation = UKismetMathLibrary::MakeRotFromX(dir);
    }

    return best;
}



void RenderESP( AHUD *HUD,int ScreenWidth, int ScreenHeight) {
    updateSkin();
    ASTExtraPlayerCharacter *localPlayer = 0;
    ASTExtraPlayerController *localPlayerController = 0;
    screenWidth = ScreenWidth;
    screenHeight = ScreenHeight;
if(Unlock120FPS){
    static USTExtraGameInstance *Instance = nullptr;

if (!Instance)
    Instance = UObject::FindObject<USTExtraGameInstance>("STExtraGameInstance Transient.UAEGameEngine_1.STExtraGameInstance_1");

if (Instance != nullptr)
{
    auto& UserSettings = Instance->UserDetailSetting;
    UserSettings.PUBGDeviceFPSDef = 120;
    UserSettings.PUBGDeviceFPSLow = 120;
    UserSettings.PUBGDeviceFPSMid = 120;
    UserSettings.PUBGDeviceFPSHigh = 120;
    UserSettings.PUBGDeviceFPSHDR = 120;
    UserSettings.PUBGDeviceFPSUltralHigh = 120;
    UserSettings.DeviceMaxQualityLevel = 3;
}}
        
        UGameplayStatics* gGameplayStatics = (UGameplayStatics*)UGameplayStatics::StaticClass();
        
        UKismetMathLibrary* UMC = (UKismetMathLibrary*)UKismetMathLibrary::StaticClass();
        
        auto GWorld = GetFullWorld();
        if(skinlobby) {

        if (!GWorld || !GWorld->PersistentLevel) return;
    
    auto Actors = *(TArray<AActor*>*)((uintptr_t)GWorld->PersistentLevel + 0xA0);
    for (int i = 0; i < Actors.Num(); ++i) {
        AActor* object = Actors[i];
        if (!object) continue;
        
        if (object->IsA(ASTExtraLobbyCharacter::StaticClass())) {
            auto LobbyPlayer = (ASTExtraLobbyCharacter*)object;
            if (!LobbyPlayer) continue;
            
            auto CharacterAvatarComponent2 = *(UCharacterAvatarComponent2**)((uintptr_t)LobbyPlayer + 0xb50);
            if (CharacterAvatarComponent2) {
                auto NetAvatarData = * (FNetAvatarSyncData * )((uintptr_t) CharacterAvatarComponent2 + 0x388);
                auto Slotsybc = NetAvatarData.SlotSyncData;
                for (int i = 0; i < Slotsybc.Num(); i++)
{
    auto& id = Slotsybc[i].ItemId;
    auto sl = Slotsybc[i].SlotID;

    if (preferences.Outfit && sl == 5 && id != new_Skin.XSuits) {
        id = new_Skin.XSuits;
        CharacterAvatarComponent2->OnRep_BodySlotStateChanged();
    }
    if (preferences.Parachute && sl == 11 && id != new_Skin.Parachute){
                               id = new_Skin.Parachute;
        CharacterAvatarComponent2->OnRep_BodySlotStateChanged();
}
if (preferences.Gloves && sl == 7 && id != new_Skin.Gloves){
                               id = new_Skin.Gloves;
        CharacterAvatarComponent2->OnRep_BodySlotStateChanged();
}

    if (preferences.Bagg) {
        if (sl == 8 && id > 0 && id != bag1 && id != bag2 && id != bag3) {
            switch (id) {
                case 501001: case 501004: case 501007:
                case 501010: case 501101: case 501104:
                case 1501001174: case 1501001220: case 1501001024:
                case 1501001047:
                    id = bag1;
                    CharacterAvatarComponent2->OnRep_BodySlotStateChanged();
                    break;
                case 501002: case 501005: case 501008:
                case 501011: case 501102: case 501105:
                case 1501002174: case 1501002220: case 1501002024:
                case 1501002047:
                    id = bag2;
                    CharacterAvatarComponent2->OnRep_BodySlotStateChanged();
                    break;
                case 501006: case 501003: case 501009:
                case 501012: case 501015: case 501106:
                case 501103:
                case 1501003174: case 1501003220: case 1501003024:
                case 1501003047:
                    id = bag3;
                    CharacterAvatarComponent2->OnRep_BodySlotStateChanged();
                    break;
            }
        }
    }
    if (preferences.Helmett) {
        if (sl == 9 && id > 0 && id != helmett1 && id != helmett2 && id != helmett3) {
            switch (id) {
                case 502004: case 502001: case 502110:
                case 502107: case 502104:
                case 1502001014: case 1502001069:
                    id = helmett1;
                    CharacterAvatarComponent2->OnRep_BodySlotStateChanged();
                    break;
                case 502005: case 502002: case 502111:
                case 502108: case 502105:
                case 1502002014: case 1502002069:
                    id = helmett2;
                    CharacterAvatarComponent2->OnRep_BodySlotStateChanged();
                    break;
                case 502106:  case 502109: case 502112:
                case 502003:
                case 1502003014: case 1502003069:
                    id = helmett3;
                    CharacterAvatarComponent2->OnRep_BodySlotStateChanged();
                    break;
            }
        }
    }
    CharacterAvatarComponent2->OnRep_BodySlotStateChanged();


                }

            }
            auto LobbyEmote = (ASTExtraLobbyCharacter*)object;
            if (LobbyEmote) {
                auto LobbyPlayEmote = *(ULobbyPlayEmoteComponent**)((uintptr_t)LobbyEmote + 0xb28);
                if (LobbyPlayEmote) {
                    int oldEmoteID = LobbyPlayEmote->GetCurrentEmoteID();
                    if (preferences.Emote) {
                        if (oldEmoteID == 2200101) {
                            FString extraInfo;
                            LobbyPlayEmote->OnPlayEmote(sEmote1, 0, extraInfo);
                        }
                    }
                }
            }
        }
        if (object->IsA(ASTExtraLobbyVehicle::StaticClass())) {
            auto LobbyVehicle = (ASTExtraLobbyVehicle*)object;
            if (!LobbyVehicle) continue;
            
            auto VehicleAvatar = LobbyVehicle->VehicleAvatar;
            if (!VehicleAvatar) continue;
            
            int defaultSkin = VehicleAvatar->GetDefaultAvatarID();
            Active::SkinCarDefault = defaultSkin;
            
            std::string SkinIDStr = std::to_string(defaultSkin);
            Active::SkinCarNew = false;
            
            if (preferences.Moto && SkinIDStr.find("1901") != std::string::npos) {
                Active::SkinCarMod = new_Skin.Moto;
                Active::SkinCarNew = true;
            }
            else if (preferences.Dacia && SkinIDStr.find("1903") != std::string::npos) {
                Active::SkinCarMod = new_Skin.Dacia;
                Active::SkinCarNew = true;
            }
            else if (preferences.CoupeRB && SkinIDStr.find("1961") != std::string::npos) {
                Active::SkinCarMod = new_Skin.CoupeRP;
                Active::SkinCarNew = true;
            }
            else if (preferences.UAZ && SkinIDStr.find("1908") != std::string::npos) {
                Active::SkinCarMod = new_Skin.UAZ;
                Active::SkinCarNew = true;
            }
            else if (preferences.Buggy && SkinIDStr.find("1907") != std::string::npos) {
                Active::SkinCarMod = new_Skin.Buggy;
                Active::SkinCarNew = true;
            }
            if (Active::SkinCarNew && Active::SkinCarMod != Active::SkinCarDefault) {
                VehicleAvatar->ChangeItemAvatar(Active::SkinCarMod, true);
                Active::SkinCarDefault = Active::SkinCarMod;
            }
        }
    }}
       
        if (GWorld) {
            UNetDriver *NetDriver = GWorld->NetDriver;
            if (NetDriver) {
                UNetConnection *ServerConnection = NetDriver->ServerConnection;
                if (ServerConnection) {
                    localPlayerController = (ASTExtraPlayerController *) ServerConnection->PlayerController;
                }
            }

            
    
    
            
            
            if (localPlayerController) {
                std::vector<ASTExtraPlayerCharacter*> PlayerCharacter;
                GetAllActors(PlayerCharacter);
                
                for (auto actor = PlayerCharacter.begin(); actor != PlayerCharacter.end(); actor++) {
                    auto Actor = *actor;
                    if (Actor->PlayerKey == ((ASTExtraPlayerController *) localPlayerController)->PlayerKey) {
                        localPlayer = Actor;
                        break;
                    }
                }

                
                
                
                
                if (localPlayer) {
                    if (localPlayer->PartHitComponent) {
                        auto ConfigCollisionDistSqAngles = localPlayer->PartHitComponent->ConfigCollisionDistSqAngles;
                        for (int j = 0; j < ConfigCollisionDistSqAngles.Num(); j++) {
                            ConfigCollisionDistSqAngles[j].Angle = 90.f;
                        }
                        localPlayer->PartHitComponent->ConfigCollisionDistSqAngles = ConfigCollisionDistSqAngles;
                    }

                        if (DeadBox) {
    std::vector<APlayerTombBox*> TombBox;
    GetAllActors(TombBox);
    for (auto actor = TombBox.begin(); actor != TombBox.end(); actor++) {
        auto TombBoxx = *actor;
        if (TombBoxx && TombBoxx->DamageCauser && TombBoxx->TargetPlayer && localPlayerController) {
            if (TombBoxx->DamageCauser->PlayerKey == localPlayerController->PlayerKey) {
                auto PlayerKey = TombBoxx->TargetPlayer->PlayerKey;
                if (AlreadyChangedSet.find(PlayerKey) == AlreadyChangedSet.end()) {
                    if (g_LocalPlayer && g_LocalPlayer->WeaponManagerComponent) {
                        auto DeadBoxAvatarCompPtr = (uintptr_t*)((uintptr_t)TombBoxx + 0x6b0);
                        if (DeadBoxAvatarCompPtr) {
                            auto DeadBoxAvatarComp = *DeadBoxAvatarCompPtr;
                            auto CurrentWeaponReplicated = g_LocalPlayer->WeaponManagerComponent->CurrentWeaponReplicated;
                            if (CurrentWeaponReplicated) {
                                auto Weaponid = CurrentWeaponReplicated->GetWeaponID();

                                if (Weaponid == 101001)       ChangeItemAVc(DeadBoxAvatarComp, new_Skin.AKM);
                                else if (Weaponid == 101002)  ChangeItemAVc(DeadBoxAvatarComp, new_Skin.M16A4);
                                else if (Weaponid == 101003)  ChangeItemAVc(DeadBoxAvatarComp, new_Skin.Scar);
                                else if (Weaponid == 101004)  ChangeItemAVc(DeadBoxAvatarComp, new_Skin.M416_1);
                                else if (Weaponid == 101005)  ChangeItemAVc(DeadBoxAvatarComp, new_Skin.Groza);
                                else if (Weaponid == 101006)  ChangeItemAVc(DeadBoxAvatarComp, new_Skin.AUG);
                                else if (Weaponid == 101007)  ChangeItemAVc(DeadBoxAvatarComp, new_Skin.QBZ);
                                else if (Weaponid == 101008)  ChangeItemAVc(DeadBoxAvatarComp, new_Skin.M762);
                                else if (Weaponid == 101100)  ChangeItemAVc(DeadBoxAvatarComp, new_Skin.FAMAS);
                                else if (Weaponid == 101102)  ChangeItemAVc(DeadBoxAvatarComp, new_Skin.ACE32);
                                else if (Weaponid == 102001)  ChangeItemAVc(DeadBoxAvatarComp, new_Skin.UZI);
                                else if (Weaponid == 102002)  ChangeItemAVc(DeadBoxAvatarComp, new_Skin.UMP);
                                else if (Weaponid == 102003)  ChangeItemAVc(DeadBoxAvatarComp, new_Skin.Vector);
                                else if (Weaponid == 102004)  ChangeItemAVc(DeadBoxAvatarComp, new_Skin.Thompson);
                                else if (Weaponid == 102005)  ChangeItemAVc(DeadBoxAvatarComp, new_Skin.Bizon);
                                else if (Weaponid == 102105)  ChangeItemAVc(DeadBoxAvatarComp, new_Skin.P90);
                                else if (Weaponid == 103001)  ChangeItemAVc(DeadBoxAvatarComp, new_Skin.K98);
                                else if (Weaponid == 103002)  ChangeItemAVc(DeadBoxAvatarComp, new_Skin.M24);
                                else if (Weaponid == 103003)  ChangeItemAVc(DeadBoxAvatarComp, new_Skin.AWM);
                                else if (Weaponid == 103004)  ChangeItemAVc(DeadBoxAvatarComp, new_Skin.SKS);
                                else if (Weaponid == 103006)  ChangeItemAVc(DeadBoxAvatarComp, new_Skin.Mini14);
                                else if (Weaponid == 103007)  ChangeItemAVc(DeadBoxAvatarComp, new_Skin.MK14);
                                else if (Weaponid == 103012)  ChangeItemAVc(DeadBoxAvatarComp, new_Skin.AMR);
                                else if (Weaponid == 105001)  ChangeItemAVc(DeadBoxAvatarComp, new_Skin.M249);
                                else if (Weaponid == 105002)  ChangeItemAVc(DeadBoxAvatarComp, new_Skin.DP28);
                                else if (Weaponid == 105010)  ChangeItemAVc(DeadBoxAvatarComp, new_Skin.MG3);
                                else if (Weaponid == 108004)  ChangeItemAVc(DeadBoxAvatarComp, new_Skin.Pan);
                                else if (Weaponid == 104004)  ChangeItemAVc(DeadBoxAvatarComp, new_Skin.DBS);
                                else if (Weaponid == 104003)  ChangeItemAVc(DeadBoxAvatarComp, new_Skin.S12K);
                                else if (Weaponid == 104002)  ChangeItemAVc(DeadBoxAvatarComp, new_Skin.S1897);

                                AlreadyChangedSet.insert(PlayerKey);
                            }
                        }
                    }
                }
            }
        }
    }
}
                    
                    if (ModSkinn){
                        
                        
                        
                        if (localPlayer->WeaponManagerComponent != 0) {
                            if (localPlayer->WeaponManagerComponent->CurrentWeaponReplicated != 0 ) {
                                int weapowep = localPlayer->WeaponManagerComponent->CurrentWeaponReplicated->GetWeaponID();
                                auto currentTime = std::chrono::steady_clock::now();
                                auto landchud = localPlayer->WeaponManagerComponent->CurrentWeaponReplicated->synData;
                                auto timeDiff = std::chrono::duration_cast<std::chrono::milliseconds>(currentTime - lastWeaponChangeTime).count();
                                if (timeDiff > 1000) {
                                    for (int j = 0; j < landchud.Num(); j++) {
                                        auto& weaponInfo = landchud[j];
                                        auto weaponid = weaponInfo.DefineID.TypeSpecificID;
                                        if (weaponid != 0)
                                        {

                                            if (preferences.AKM && weapowep == 101001){
                                                for (int i = 0; i < sizeof(akmv) / sizeof(akmv[0]); i++) {
                                                    if (weaponid == akmv[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.AKM;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(akmmag) / sizeof(akmmag[0]); i++) {
                                                    if (weaponid == akmmag[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.AKM_Mag;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(akreddot) / sizeof(akreddot[0]); i++) {
                                                    if (weaponid == akreddot[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.AKM_reddot;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(akflash) / sizeof(akflash[0]); i++) {
                                                    if (weaponid == akflash[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.AKM_flash;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(akcompe) / sizeof(akcompe[0]); i++) {
                                                    if (weaponid == akcompe[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.AKM_compe;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(aksilent) / sizeof(aksilent[0]); i++) {
                                                    if (weaponid == aksilent[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.AKM_silent;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(akholo) / sizeof(akholo[0]); i++) {
                                                    if (weaponid == akholo[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.AKM_holo;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(akx2) / sizeof(akx2[0]); i++) {
                                                    if (weaponid == akx2[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.AKM_x2;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(akx3) / sizeof(akx3[0]); i++) {
                                                    if (weaponid == akx3[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.AKM_x3;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(akx4) / sizeof(akx4[0]); i++) {
                                                    if (weaponid == akx4[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.AKM_x4;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(akx6) / sizeof(akx6[0]); i++) {
                                                    if (weaponid == akx6[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.AKM_x6;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(akextendedMag) / sizeof(akextendedMag[0]); i++) {
                                                    if (weaponid == akextendedMag[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.AKM_extendedMag;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(akquickNextended) / sizeof(akquickNextended[0]); i++) {
                                                    if (weaponid == akquickNextended[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.AKM_quickNextended;
                                                        break;
                                                    }
                                                }
                                            }
                                        
                                        
                                            
                                            
                                            
                                            
                                            if (preferences.KAR98 && weapowep == 103001){
                                                for (int i = 0; i < sizeof(kar) / sizeof(kar[0]); i++) {
                                                    if (weaponid == kar[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.K98;
                                                        break;
                                                    }
                                                }
                                                
                                                
                                                
                                                
                                                for (int i = 0; i < sizeof(karreddot) / sizeof(karreddot[0]); i++) {
                                                    if (weaponid == karreddot[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.K98_reddot;
                                                        break;
                                                    }
                                                }
                                                
                                                
                                                
                                                
                                                for (int i = 0; i < sizeof(karholo) / sizeof(karholo[0]); i++) {
                                                    if (weaponid == karholo[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.K98_holo;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(karx2) / sizeof(karx2[0]); i++) {
                                                    if (weaponid == karx2[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.K98_x2;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(karx3) / sizeof(karx3[0]); i++) {
                                                    if (weaponid == karx3[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.K98_x3;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(karx4) / sizeof(karx4[0]); i++) {
                                                    if (weaponid == karx4[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.K98_x4;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(karx6) / sizeof(karx6[0]); i++) {
                                                    if (weaponid == karx6[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.K98_x6;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(karx8) / sizeof(karx8[0]); i++) {
                                                    if (weaponid == karx8[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.K98_x8;
                                                        break;
                                                    }
                                                }
                                            }
                                            
                                            
                                            
                                            
                                            if (preferences.M24 && weapowep == 103002){
                                                for (int i = 0; i < sizeof(m24) / sizeof(m24[0]); i++) {
                                                    if (weaponid == m24[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.M24;
                                                        break;
                                                    }
                                                }
                                                
                                                
                                                
                                                
                                                for (int i = 0; i < sizeof(m24reddot) / sizeof(m24reddot[0]); i++) {
                                                    if (weaponid == m24reddot[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.M24_reddot;
                                                        break;
                                                    }
                                                }
                                                
                                                
                                                
                                                
                                                for (int i = 0; i < sizeof(m24holo) / sizeof(m24holo[0]); i++) {
                                                    if (weaponid == m24holo[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.M24_holo;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(m24x2) / sizeof(m24x2[0]); i++) {
                                                    if (weaponid == m24x2[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.M24_x2;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(m24x3) / sizeof(m24x3[0]); i++) {
                                                    if (weaponid == m24x3[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.M24_x3;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(m24x4) / sizeof(m24x4[0]); i++) {
                                                    if (weaponid == m24x4[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.M24_x4;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(m24x6) / sizeof(m24x6[0]); i++) {
                                                    if (weaponid == m24x6[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.M24_x6;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(m24x8) / sizeof(m24x8[0]); i++) {
                                                    if (weaponid == m24x8[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.M24_x8;
                                                        break;
                                                    }
                                                }
                                            }
                                            
                                            
                                            
                                            if (preferences.AWM && weapowep == 103003){
                                                for (int i = 0; i < sizeof(awm) / sizeof(awm[0]); i++) {
                                                    if (weaponid == awm[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.AWM;
                                                        break;
                                                    }
                                                }
                                                
                                                
                                                
                                                
                                                for (int i = 0; i < sizeof(awmreddot) / sizeof(awmreddot[0]); i++) {
                                                    if (weaponid == awmreddot[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.AWM_reddot;
                                                        break;
                                                    }
                                                }
                                                
                                                
                                                
                                                
                                                for (int i = 0; i < sizeof(awmholo) / sizeof(awmholo[0]); i++) {
                                                    if (weaponid == awmholo[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.AWM_holo;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(awmx2) / sizeof(awmx2[0]); i++) {
                                                    if (weaponid == awmx2[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.AWM_x2;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(awmx3) / sizeof(awmx3[0]); i++) {
                                                    if (weaponid == awmx3[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.AWM_x3;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(awmx4) / sizeof(awmx4[0]); i++) {
                                                    if (weaponid == awmx4[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.AWM_x4;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(awmx6) / sizeof(awmx6[0]); i++) {
                                                    if (weaponid == awmx6[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.AWM_x6;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(awmx8) / sizeof(awmx8[0]); i++) {
                                                    if (weaponid == awmx8[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.AWM_x8;
                                                        break;
                                                    }
                                                }
                                            }
                                            
                                            
                                            if (preferences.Machete && weapowep == 108001){
                                                for (int i = 0; i < sizeof(machete) / sizeof(machete[0]); i++) {
                                                    if (weaponid == machete[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.Machete;
                                                        break;
                                                    }
                                                }
                                            }
                                            
                                            if (preferences.AMR && weapowep == 103012){
                                                for (int i = 0; i < sizeof(amr) / sizeof(amr[0]); i++) {
                                                    if (weaponid == amr[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.AMR;
                                                        break;
                                                    }
                                                }
                                                
                                                
                                                
                                                
                                                for (int i = 0; i < sizeof(amrreddot) / sizeof(amrreddot[0]); i++) {
                                                    if (weaponid == amrreddot[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.AMR_reddot;
                                                        break;
                                                    }
                                                }
                                                
                                                
                                                
                                                
                                                for (int i = 0; i < sizeof(amrholo) / sizeof(amrholo[0]); i++) {
                                                    if (weaponid == amrholo[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.AMR_holo;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(amrx2) / sizeof(amrx2[0]); i++) {
                                                    if (weaponid == amrx2[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.AMR_x2;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(amrx3) / sizeof(amrx3[0]); i++) {
                                                    if (weaponid == amrx3[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.AMR_x3;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(amrx4) / sizeof(amrx4[0]); i++) {
                                                    if (weaponid == amrx4[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.AMR_x4;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(amrx6) / sizeof(amrx6[0]); i++) {
                                                    if (weaponid == amrx6[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.AMR_x6;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(amrx8) / sizeof(amrx8[0]); i++) {
                                                    if (weaponid == amrx8[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.AMR_x8;
                                                        break;
                                                    }
                                                }
                                            }
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            if (preferences.MK14 && weapowep == 103007){
                                                for (int i = 0; i < sizeof(mk14) / sizeof(mk14[0]); i++) {
                                                    if (weaponid == mk14[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.MK14;
                                                        break;
                                                    }
                                                }
                                            }
                                            
                                            
                                            
                                            
                                            
                                            
                                            if (preferences.MINI14 && weapowep == 103006){
                                                for (int i = 0; i < sizeof(mini14) / sizeof(mini14[0]); i++) {
                                                    if (weaponid == mini14[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.Mini14;
                                                        break;
                                                    }
                                                }
                                            }
                                            
                                            if (preferences.TOMMY && weapowep == 102004){
                                                for (int i = 0; i < sizeof(tommy) / sizeof(tommy[0]); i++) {
                                                    if (weaponid == tommy[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.Thompson;
                                                        break;
                                                    }
                                                }
                                            }
                                            if (preferences.P90 && weapowep == 102105){
                                                for (int i = 0; i < sizeof(p90) / sizeof(p90[0]); i++) {
                                                    if (weaponid == p90[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.P90;
                                                        break;
                                                    }
                                                }
                                            }
                                            
                                            
                                            if (preferences.ACE32 && weapowep == 101102){
                                                for (int i = 0; i < sizeof(ace32) / sizeof(ace32[0]); i++) {
                                                    if (weaponid == ace32[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.ACE32;
                                                        break;
                                                    }
                                                }
                                                
                                                
                                                for (int i = 0; i < sizeof(ace32) / sizeof(ace32[0]); i++) {
                                                    if (weaponid == ace32[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.ACE32;
                                                        break;
                                                    }
                                                }
                                                
                                                
                                                
                                                
                                                for (int i = 0; i < sizeof(ace32reddot) / sizeof(ace32reddot[0]); i++) {
                                                    if (weaponid == ace32reddot[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.ACE32_reddot;
                                                        break;
                                                    }
                                                }
                                                
                                                
                                                
                                                
                                                for (int i = 0; i < sizeof(ace32holo) / sizeof(ace32holo[0]); i++) {
                                                    if (weaponid == ace32holo[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.ACE32_holo;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(ace32x2) / sizeof(ace32x2[0]); i++) {
                                                    if (weaponid == ace32x2[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.ACE32_x2;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(ace32x3) / sizeof(ace32x3[0]); i++) {
                                                    if (weaponid == ace32x3[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.ACE32_x3;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(ace32x4) / sizeof(ace32x4[0]); i++) {
                                                    if (weaponid == ace32x4[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.ACE32_x4;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(ace32x6) / sizeof(ace32x6[0]); i++) {
                                                    if (weaponid == ace32x6[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.ACE32_x6;
                                                        break;
                                                    }
                                                }
                                            }
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            if (preferences.BIZON && weapowep == 102005){
                                                for (int i = 0; i < sizeof(bizon) / sizeof(bizon[0]); i++) {
                                                    if (weaponid == bizon[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.Bizon;
                                                        break;
                                                    }
                                                }
                                            }
                                            
                                            if (preferences.VECTOR && weapowep == 102003){
                                                for (int i = 0; i < sizeof(vectorr) / sizeof(vectorr[0]); i++) {
                                                    if (weaponid == vectorr[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.Vector;
                                                        break;
                                                    }
                                                }
                                            }
                                            if (preferences.UMP && weapowep == 102002){
                                                for (int i = 0; i < sizeof(ump) / sizeof(ump[0]); i++) {
                                                    if (weaponid == ump[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.UMP;
                                                        break;
                                                    }
                                                }
                                                
                                                
                                                
                                                
                                                for (int i = 0; i < sizeof(umpreddot) / sizeof(umpreddot[0]); i++) {
                                                    if (weaponid == umpreddot[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.UMP_reddot;
                                                        break;
                                                    }
                                                }
                                                
                                                
                                                
                                                
                                                for (int i = 0; i < sizeof(umpholo) / sizeof(umpholo[0]); i++) {
                                                    if (weaponid == umpholo[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.UMP_holo;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(umpx2) / sizeof(umpx2[0]); i++) {
                                                    if (weaponid == umpx2[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.UMP_x2;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(umpx3) / sizeof(umpx3[0]); i++) {
                                                    if (weaponid == umpx3[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.UMP_x3;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(umpx4) / sizeof(umpx4[0]); i++) {
                                                    if (weaponid == umpx4[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.UMP_x4;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(umpx6) / sizeof(umpx6[0]); i++) {
                                                    if (weaponid == umpx6[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.UMP_x6;
                                                        break;
                                                    }
                                                }
                                            }
                                            if (preferences.UZI && weapowep == 102001){
                                                for (int i = 0; i < sizeof(uzi) / sizeof(uzi[0]); i++) {
                                                    if (weaponid == uzi[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.UZI;
                                                        break;
                                                    }
                                                }
                                            }
                                            if (preferences.M16 && weapowep == 101002){
                                                for (int i = 0; i < sizeof(m16) / sizeof(m16[0]); i++) {
                                                    if (weaponid == m16[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.M16A4;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(m16s) / sizeof(m16s[0]); i++) {
                                                    if (weaponid == m16s[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.M16A4_Stock;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(m16mag) / sizeof(m16mag[0]); i++) {
                                                    if (weaponid == m16mag[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.M16A4_Mag;
                                                        break;
                                                    }
                                                }
                                            }
                                            if (preferences.PAN && weapowep == 108004){
                                                for (int i = 0; i < sizeof(pan) / sizeof(pan[0]); i++) {
                                                    if (weaponid == pan[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.Pan;
                                                        break;
                                                    }
                                                }
                                            }
                                            
                                            
                                            
                                            if (preferences.AUG && weapowep == 101006){
                                                for (int i = 0; i < sizeof(aug) / sizeof(aug[0]); i++) {
                                                    if (weaponid == aug[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.AUG;
                                                        break;
                                                    }
                                                }
                                                
                                                
                                                for (int i = 0; i < sizeof(aug) / sizeof(aug[0]); i++) {
                                                    if (weaponid == aug[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.AUG;
                                                        break;
                                                    }
                                                }
                                                
                                                
                                                
                                                
                                                for (int i = 0; i < sizeof(augreddot) / sizeof(augreddot[0]); i++) {
                                                    if (weaponid == augreddot[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.AUG_reddot;
                                                        break;
                                                    }
                                                }
                                                
                                                
                                                
                                                
                                                for (int i = 0; i < sizeof(augholo) / sizeof(augholo[0]); i++) {
                                                    if (weaponid == augholo[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.AUG_holo;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(augx2) / sizeof(augx2[0]); i++) {
                                                    if (weaponid == augx2[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.AUG_x2;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(augx3) / sizeof(augx3[0]); i++) {
                                                    if (weaponid == augx3[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.AUG_x3;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(augx4) / sizeof(augx4[0]); i++) {
                                                    if (weaponid == augx4[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.AUG_x4;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(augx6) / sizeof(augx6[0]); i++) {
                                                    if (weaponid == augx6[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.AUG_x6;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(augLazer) / sizeof(augLazer[0]); i++) {
                                                    if (weaponid == augLazer[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.AUG_lazer;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(augFlash) / sizeof(augFlash[0]); i++) {
                                                    if (weaponid == augFlash[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.AUG_flash;
                                                        break;
                                                    }
                                                }
                                            }
                                            
                                            
                                            if (preferences.QBZ && weapowep == 101007){
                                                for (int i = 0; i < sizeof(qbz) / sizeof(qbz[0]); i++) {
                                                    if (weaponid == qbz[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.QBZ;
                                                        break;
                                                    }
                                                }
                                            }
                                            
                                            if (preferences.GROZA && weapowep == 101005){
                                                for (int i = 0; i < sizeof(groza) / sizeof(groza[0]); i++) {
                                                    if (weaponid == groza[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.Groza;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(Groza_2) / sizeof(Groza_2[0]); i++) {
                                                    if (weaponid == Groza_2[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.Groza_2;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(grozasilent) / sizeof(grozasilent[0]); i++) {
                                                    if (weaponid == grozasilent[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.Groza_silent;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(grozareddot) / sizeof(grozareddot[0]); i++) {
                                                    if (weaponid == grozareddot[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.Groza_reddot;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(grozaholo) / sizeof(grozaholo[0]); i++) {
                                                    if (weaponid == grozaholo[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.Groza_holo;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(grozax2) / sizeof(grozax2[0]); i++) {
                                                    if (weaponid == grozax2[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.Groza_x2;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(grozax3) / sizeof(grozax3[0]); i++) {
                                                    if (weaponid == grozax3[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.Groza_x3;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(grozax4) / sizeof(grozax4[0]); i++) {
                                                    if (weaponid == grozax4[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.Groza_x4;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(grozax6) / sizeof(grozax6[0]); i++) {
                                                    if (weaponid == grozax6[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.Groza_x6;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(grozaquickMag) / sizeof(grozaquickMag[0]); i++) {
                                                    if (weaponid == grozaquickMag[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.Groza_quickMag;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(grozaextendedMag) / sizeof(grozaextendedMag[0]); i++) {
                                                    if (weaponid == grozaextendedMag[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.Groza_extendedMag;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(grozaquickNextended) / sizeof(grozaquickNextended[0]); i++) {
                                                    if (weaponid == grozaquickNextended[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.Groza_quickNextended;
                                                        break;
                                                    }
                                                }
                                            }
                                            if (preferences.FAMAS && weapowep == 101100){
                                                for (int i = 0; i < sizeof(famas) / sizeof(famas[0]); i++) {
                                                    if (weaponid == famas[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.Famas;
                                                        break;
                                                    }
                                                }
                                                
                                                
                                                for (int i = 0; i < sizeof(famas) / sizeof(famas[0]); i++) {
                                                    if (weaponid == famas[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.Famas;
                                                        break;
                                                    }
                                                }
                                                
                                                
                                                
                                                
                                                for (int i = 0; i < sizeof(famasreddot) / sizeof(famasreddot[0]); i++) {
                                                    if (weaponid == famasreddot[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.FAMAS_reddot;
                                                        break;
                                                    }
                                                }
                                                
                                                
                                                
                                                
                                                for (int i = 0; i < sizeof(famasholo) / sizeof(famasholo[0]); i++) {
                                                    if (weaponid == famasholo[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.FAMAS_holo;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(famasx2) / sizeof(famasx2[0]); i++) {
                                                    if (weaponid == famasx2[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.Famas_x2;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(famasx3) / sizeof(famasx3[0]); i++) {
                                                    if (weaponid == famasx3[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.Famas_x3;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(famasx4) / sizeof(famasx4[0]); i++) {
                                                    if (weaponid == famasx4[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.Famas_x4;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(famasx6) / sizeof(famasx6[0]); i++) {
                                                    if (weaponid == famasx6[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.Famas_x6;
                                                        break;
                                                    }
                                                }
                                            }
                                            
                                            
                                            
                                            
                                            if (preferences.DP28 && weapowep == 105002){
                                                for (int i = 0; i < sizeof(dp) / sizeof(dp[0]); i++) {
                                                    if (weaponid == dp[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.DP28;
                                                        break;
                                                    }
                                                }
                                            }
                                            if (preferences.MG3 && weapowep == 105010){
                                                for (int i = 0; i < sizeof(mg3) / sizeof(mg3[0]); i++) {
                                                    if (weaponid == mg3[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.MG3;
                                                        break;
                                                    }
                                                }
                                                
                                                
                                                
                                                
                                                for (int i = 0; i < sizeof(mg3reddot) / sizeof(mg3reddot[0]); i++) {
                                                    if (weaponid == mg3reddot[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.MG3_reddot;
                                                        break;
                                                    }
                                                }
                                                
                                                
                                                
                                                
                                                for (int i = 0; i < sizeof(mg3holo) / sizeof(mg3holo[0]); i++) {
                                                    if (weaponid == mg3holo[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.MG3_holo;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(mg3x2) / sizeof(mg3x2[0]); i++) {
                                                    if (weaponid == mg3x2[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.MG3_x2;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(mg3x3) / sizeof(mg3x3[0]); i++) {
                                                    if (weaponid == mg3x3[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.MG3_x3;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(mg3x4) / sizeof(mg3x4[0]); i++) {
                                                    if (weaponid == mg3x4[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.MG3_x4;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(mg3x6) / sizeof(mg3x6[0]); i++) {
                                                    if (weaponid == mg3x6[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.MG3_x6;
                                                        break;
                                                    }
                                                }
                                            }
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            if (preferences.Honey && weapowep == 101012){
                                                for (int i = 0; i < sizeof(honey) / sizeof(honey[0]); i++) {
                                                    if (weaponid == honey[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.Honey;
                                                        break;
                                                    }
                                                }
                                            }
                                            
                                            if (preferences.S12K && weapowep == 104003){
                                                for (int i = 0; i < sizeof(s12k) / sizeof(s12k[0]); i++) {
                                                    if (weaponid == s12k[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.S12K;
                                                        break;
                                                    }
                                                }
                                            }
                                            
                                            
                                            
                                            
                                            
                                            
                                            if (preferences.S1897 && weapowep == 104002){
                                                for (int i = 0; i < sizeof(s1897) / sizeof(s1897[0]); i++) {
                                                    if (weaponid == s1897[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.S1897;
                                                        break;
                                                    }
                                                }
                                            }
                                            if (preferences.DBS && weapowep == 104004){
                                                for (int i = 0; i < sizeof(dbs) / sizeof(dbs[0]); i++) {
                                                    if (weaponid == dbs[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.DBS;
                                                        break;
                                                    }
                                                }
                                            }
                                            
                                            
                                            
                                            
                                            
                                            if (preferences.M249 && weapowep == 105001){
                                                for (int i = 0; i < sizeof(m249) / sizeof(m249[0]); i++) {
                                                    if (weaponid == m249[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.M249;
                                                        break;
                                                    }
                                                }
                                                /* for (int i = 0; i < sizeof(m249s) / sizeof(m249s[0]); i++) {
                                                 if (weaponid == m249s[i]) {
                                                 weaponInfo.DefineID.TypeSpecificID = new_Skin.M249s;
                                                 break;
                                                 }
                                                 }*/
                                            }
                                            
                                            if (preferences.SCARL && weapowep == 101003){
                                                for (int i = 0; i < sizeof(scar) / sizeof(scar[0]); i++) {
                                                    if (weaponid == scar[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.Scar;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(scarmag) / sizeof(scarmag[0]); i++) {
                                                    if (weaponid == scarmag[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.Scar_Mag;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(scarsight) / sizeof(scarsight[0]); i++) {
                                                    if (weaponid == scarsight[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.Scar_3;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(scarflash) / sizeof(scarflash[0]); i++) {
                                                    if (weaponid == scarflash[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.Scar_flash;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(scarcompe) / sizeof(scarcompe[0]); i++) {
                                                    if (weaponid == scarcompe[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.Scar_compe;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(scarsilent) / sizeof(scarsilent[0]); i++) {
                                                    if (weaponid == scarsilent[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.Scar_silent;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(scarreddot) / sizeof(scarreddot[0]); i++) {
                                                    if (weaponid == scarreddot[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.Scar_reddot;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(scarholo) / sizeof(scarholo[0]); i++) {
                                                    if (weaponid == scarholo[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.Scar_holo;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(scarx2) / sizeof(scarx2[0]); i++) {
                                                    if (weaponid == scarx2[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.Scar_x2;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(scarx3) / sizeof(scarx3[0]); i++) {
                                                    if (weaponid == scarx3[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.Scar_x3;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(scarx4) / sizeof(scarx4[0]); i++) {
                                                    if (weaponid == scarx4[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.Scar_x4;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(scarx6) / sizeof(scarx6[0]); i++) {
                                                    if (weaponid == scarx6[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.Scar_x6;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(scarquickMag) / sizeof(scarquickMag[0]); i++) {
                                                    if (weaponid == scarquickMag[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.Scar_quickMag;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(scarextendedMag) / sizeof(scarextendedMag[0]); i++) {
                                                    if (weaponid == scarextendedMag[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.Scar_extendedMag;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(scarquickNextended) / sizeof(scarquickNextended[0]); i++) {
                                                    if (weaponid == scarquickNextended[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.Scar_quickNextended;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(scarverical) / sizeof(scarverical[0]); i++) {
                                                    if (weaponid == scarverical[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.Scar_verical;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(scarangle) / sizeof(scarangle[0]); i++) {
                                                    if (weaponid == scarangle[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.Scar_angle;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(scarlightgrip) / sizeof(scarlightgrip[0]); i++) {
                                                    if (weaponid == scarlightgrip[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.Scar_lightgrip;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(scarpink) / sizeof(scarpink[0]); i++) {
                                                    if (weaponid == scarpink[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.Scar_pink;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(scarlazer) / sizeof(scarlazer[0]); i++) {
                                                    if (weaponid == scarlazer[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.Scar_lazer;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(scarthumb) / sizeof(scarthumb[0]); i++) {
                                                    if (weaponid == scarthumb[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.Scar_thumb;
                                                        break;
                                                    }
                                                }
                                            }
                                            
                                            if (preferences.M762 && weapowep == 101008){
                                                for (int i = 0; i < sizeof(m7) / sizeof(m7[0]); i++) {
                                                    if (weaponid == m7[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.M762;
                                                        break;
                                                    }
                                                }
                                                
                                                
                                                for (int i = 0; i < sizeof(m7) / sizeof(m7[0]); i++) {
                                                    if (weaponid == m7[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.M762;
                                                        break;
                                                    }
                                                }
                                                
                                                for (int i = 0; i < sizeof(m7mag) / sizeof(m7mag[0]); i++) {
                                                    if (weaponid == m7mag[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.M762_Mag;
                                                        break;
                                                    }
                                                }
                                                
                                                
                                                for (int i = 0; i < sizeof(m7reddot) / sizeof(m7reddot[0]); i++) {
                                                    if (weaponid == m7reddot[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.M762_reddot;
                                                        break;
                                                    }
                                                }
                                                
                                                
                                                
                                                
                                                for (int i = 0; i < sizeof(m7holo) / sizeof(m7holo[0]); i++) {
                                                    if (weaponid == m7holo[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.M762_holo;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(m7x2) / sizeof(m7x2[0]); i++) {
                                                    if (weaponid == m7x2[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.M762_x2;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(m7x3) / sizeof(m7x3[0]); i++) {
                                                    if (weaponid == m7x3[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.M762_x3;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(m7x4) / sizeof(m7x4[0]); i++) {
                                                    if (weaponid == m7x4[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.M762_x4;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(m7x6) / sizeof(m7x6[0]); i++) {
                                                    if (weaponid == m7x6[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.M762_x6;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(m7Lazer) / sizeof(m7Lazer[0]); i++) {
                                                    if (weaponid == m7Lazer[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.M762_lazer;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(m7Flash) / sizeof(m7Flash[0]); i++) {
                                                    if (weaponid == m7Flash[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.M762_flash;
                                                        break;
                                                    }
                                                }
                                            }
                                                
                                                
                                                
                                                
                                                
                                            
                                            if (preferences.M416 && weapowep == 101004){
                                                for (int i = 0; i < sizeof(m4v) / sizeof(m4v[0]); i++) {
                                                    if (weaponid == m4v[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_1;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(m4mag) / sizeof(m4mag[0]); i++) {
                                                    if (weaponid == m4mag[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_2;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(m4sight) / sizeof(m4sight[0]); i++) {
                                                    if (weaponid == m4sight[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_3;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(m4stock) / sizeof(m4stock[0]); i++) {
                                                    if (weaponid == m4stock[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_4;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(m4stock1) / sizeof(m4stock1[0]); i++) {
                                                    if (weaponid == m4stock1[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_stock;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(m4reddot) / sizeof(m4reddot[0]); i++) {
                                                    if (weaponid == m4reddot[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_reddot;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(m4holo) / sizeof(m4holo[0]); i++) {
                                                    if (weaponid == m4holo[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_holo;
                                                        break;
                                                    }
                                                }
                                                
                                                for (int i = 0; i < sizeof(M416_x2) / sizeof(M416_x2[0]); i++) {
                                                    if (weaponid == M416_x2[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_x2;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(M416_x3) / sizeof(M416_x3[0]); i++) {
                                                    if (weaponid == M416_x3[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_x3;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(m4x4) / sizeof(m4x4[0]); i++) {
                                                    if (weaponid == m4x4[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_x4;
                                                        break;
                                                    }
                                                }
                                                for (int i = 0; i < sizeof(m4x6) / sizeof(m4x6[0]); i++) {
                                                    if (weaponid == m4x6[i]) {
                                                        weaponInfo.DefineID.TypeSpecificID = new_Skin.M416_x6;
                                                        break;
                                                    }
                                                }
                                            }
                                            localPlayer->WeaponManagerComponent->CurrentWeaponReplicated->DelayHandleAvatarMeshChanged();
                                            lastWeaponChangeTime = currentTime;
                                        }
                                    }
                                }
                            }
                        }
                        //
                        
                        if (localPlayer -> CurrentVehicle) {
                            if (localPlayer -> CurrentVehicle -> VehicleAvatar) {
                                std::string SkinIDStr = std::to_string((int) localPlayer -> CurrentVehicle -> VehicleAvatar -> GetDefaultAvatarID());
                                Active::SkinCarDefault = localPlayer -> CurrentVehicle -> GetAvatarID();
                                
                                
                                if (preferences.Moto && strstr(SkinIDStr.c_str(), "1901")) {
                                    Active::SkinCarMod = new_Skin.Moto;
                                    Active::SkinCarNew = true;
                                } else if (preferences.Dacia && strstr(SkinIDStr.c_str(), "1903")) {
                                    Active::SkinCarMod = new_Skin.Dacia;
                                    Active::SkinCarNew = true;
                                } else if (preferences.Boat && strstr(SkinIDStr.c_str(), "1911")) {
                                    Active::SkinCarMod = new_Skin.Boat;
                                    Active::SkinCarNew = true;
                                } else if (preferences.MiniBus && strstr(SkinIDStr.c_str(), "1904")) {
                                    Active::SkinCarMod = new_Skin.MiniBus;
                                    Active::SkinCarNew = true;
                                } else if (preferences.Mirado && strstr(SkinIDStr.c_str(), "1914")) {
                                    Active::SkinCarMod = new_Skin.Mirado;
                                    Active::SkinCarNew = true;
                                } else if (preferences.Mirado && strstr(SkinIDStr.c_str(), "1915")) {
                                    Active::SkinCarMod = new_Skin.Mirado;
                                    Active::SkinCarNew = true;
                                } else if (preferences.Buggy && strstr(SkinIDStr.c_str(), "1907")) {
                                    Active::SkinCarMod = new_Skin.Buggy;
                                    Active::SkinCarNew = true;
                                }else if (preferences.CoupeRB && strstr(SkinIDStr.c_str(), "1961")) {
                                    Active::SkinCarMod = new_Skin.CoupeRP;
                                    Active::SkinCarNew = true;
                                } else if (preferences.BigFoot && strstr(SkinIDStr.c_str(), "1953")) {
                                    Active::SkinCarMod = new_Skin.Bigfoot;
                                    Active::SkinCarNew = true;
                                } else if (preferences.RZR && strstr(SkinIDStr.c_str(), "1966")) {
                                    Active::SkinCarMod = new_Skin.RZR;
                                    Active::SkinCarNew = true;
                                    
                                } else if (preferences.UAZ && strstr(SkinIDStr.c_str(), "1908")) {
                                    Active::SkinCarMod = new_Skin.UAZ;
                                    Active::SkinCarNew = true;
                                } else Active::SkinCarNew = false;
                                
                                if (Active::SkinCarDefault != Active::SkinCarMod && Active::SkinCarNew) {
                                    
                                    localPlayer -> CurrentVehicle -> VehicleAvatar -> ChangeItemAvatar(Active::SkinCarMod, true);
                                }
                            }
                        }
                        //if(BagGun){
std::unordered_map<std::string, int> Dataidlobb = {
//M416
{ "101004", new_Skin.M416_1 },
//AKM
{ "101001", new_Skin.AKM },
//KAR
{ "103001", new_Skin.K98 },
//M24
{ "103002", new_Skin.M24 },
//AWM
{ "103003", new_Skin.AWM },
//Thompson
{ "102004", new_Skin.Thompson },
//MK14
{ "103007", new_Skin.MK14 },
//MG3
{ "105010", new_Skin.MG3 },
//P90
{ "102105", new_Skin.P90 },
//AMR
{ "103012", new_Skin.AMR },
//QBZ
{ "101007", new_Skin.QBZ },
//FAMAS
{ "101100", new_Skin.FAMAS },
//Grenades
//{ "602004", new_Skin.Grenades },
//DBS
{ "104004", new_Skin.DBS },
//ACE32
{ "101102", new_Skin.ACE32 },
//UMP
{ "102002", new_Skin.UMP },
//VECTOR
{ "102003", new_Skin.Vector},
//UZI
{ "102001", new_Skin.UZI },
//M16A4
{ "101002", new_Skin.M16A4 },
//PAN
{ "108004", new_Skin.Pan },
//AUG
{ "101006", new_Skin.AUG },
//GROZA
{ "101005", new_Skin.Groza },
//M249
{ "105001", new_Skin.M249 },
//SCAR
{ "101003", new_Skin.Scar },
//M726
{ "101008", new_Skin.M762 },
};
if (!localPlayerController || !localPlayerController->BackpackComponent) return;

auto Backpack = (UBackpackComponent*)localPlayerController->BackpackComponent;
if (!Backpack) return;

auto& bag = Backpack->ItemListNet.IncArray;
bool NeedRefreshBack = false;

for (int j = 0; j < bag.Num(); j++) {
if (!bag.IsValidIndex(j)) continue;

int ID = bag[j].Unit.DefineID.TypeSpecificID;

auto& AdditionalData = bag[j].Unit.AdditionalData;
bool bFoundAvatar = false;

std::string SkinId = std::to_string(ID);
for (const auto& [prefix, skinID] : Dataidlobb) {
if (SkinId.find(prefix) != std::string::npos) {
for (int k = 0; k < AdditionalData.Num(); k++) {
if (!AdditionalData.IsValidIndex(k)) continue;

if (AdditionalData[k].EDataType == EBattleItemAdditionalDataType::EBattleItemAdditionalDataType__WeaponAvatar) {
AdditionalData[k].IntData = skinID;
bFoundAvatar = true;
NeedRefreshBack = true;
}
}
if (!bFoundAvatar) {
FBattleItemAdditionalData NewEntry;
NewEntry.EDataType = EBattleItemAdditionalDataType::EBattleItemAdditionalDataType__WeaponAvatar;
NewEntry.IntData = skinID;
AdditionalData.Add(NewEntry);
NeedRefreshBack = true;
}
break;
}
}
}
if (NeedRefreshBack && Backpack) {
Backpack->OnRep_ItemListNet();
}
//}
                        
                        if (localPlayerController->BackpackComponent){
                            auto data = localPlayerController->BackpackComponent->ItemListNet;
                            auto bag = data.IncArray;
                            for (int j = 0; j < bag.Num(); j++) {
                                int ID = bag[j].Unit.DefineID.TypeSpecificID;
                                if (preferences.Outfit){
                                    for (int i = 0; i < sizeof(SuitX) / sizeof(SuitX[0]); i++) {
                                        if (ID == SuitX[i]) {
                                            bag[j].Unit.DefineID.TypeSpecificID = new_Skin.XSuits;
                                            break;
                                        }
                                    }
                                }
                                if (preferences.Gloves){
                                    for (int i = 0; i < sizeof(Gloves) / sizeof(Gloves[0]); i++) {
                                        if (ID == Gloves[i]) {
                                            bag[j].Unit.DefineID.TypeSpecificID = new_Skin.Gloves;
                                            break;
                                        }
                                    }
                                }
                                if (preferences.Bagg){
                                    for (int i = 0; i < sizeof(Bag) / sizeof(Bag[0]); i++) {
                                        if (ID == Bag1[i]) {
                                            bag[j].Unit.DefineID.TypeSpecificID = bag1;
                                            break;
                                        }
                                        if (ID == Bag2[i]) {
                                            bag[j].Unit.DefineID.TypeSpecificID = bag2;
                                            break;
                                        }
                                        if (ID == Bag[i]) {
                                            bag[j].Unit.DefineID.TypeSpecificID = bag3;
                                            break;
                                        }
                                    }
                                }
                                if (preferences.Helmett){
                                    for (int i = 0; i < sizeof(Helmet) / sizeof(Helmet[0]); i++) {
                                        if (ID == Helmet1[i]) {
                                            bag[j].Unit.DefineID.TypeSpecificID = helmett1;
                                            break;
                                        }
                                        if (ID == Helmet2[i]) {
                                            bag[j].Unit.DefineID.TypeSpecificID = helmett2;
                                            break;
                                        }
                                        if (ID == Helmet[i]) {
                                            bag[j].Unit.DefineID.TypeSpecificID = helmett3;
                                            break;
                                        }
                                    }
                                }
                                if (preferences.Emote){
                                    for (int i = 0; i < sizeof(emote1) / sizeof(emote1[0]); i++) {
                                        if (ID == emote1[i]) {
                                            bag[j].Unit.DefineID.TypeSpecificID = sEmote1;
                                            break;
                                        }
                                    }
                                    for (int i = 0; i < sizeof(emote2) / sizeof(emote2[0]); i++) {
                                        if (ID == emote2[i]) {
                                            bag[j].Unit.DefineID.TypeSpecificID = sEmote2;
                                            break;
                                        }
                                    }
                                    for (int i = 0; i < sizeof(emote3) / sizeof(emote3[0]); i++) {
                                        if (ID == emote3[i]) {
                                            bag[j].Unit.DefineID.TypeSpecificID = sEmote3;
                                            break;
                                        }
                                    }
                                }
                            }
                        }
                        
                        
                        if (localPlayer -> AvatarComponent2) {
                            
                            auto AvatarComp = localPlayer -> AvatarComponent2;
                            
                FNetAvatarSyncData* NetAvatarComp = (FNetAvatarSyncData*)((uintptr_t)AvatarComp + 0x388);

                if (!NetAvatarComp) return;  // is valid

                auto& Slotsybc = NetAvatarComp->SlotSyncData; 
                
                
                
                          //  if (preferences.Parachute){
                            //   if (Slotsybc.Num() > 9) Slotsybc[9].ItemId = new_Skin.Parachute;
                         //   }
                          //  if (preferences.Hieuungbay){
                                //Slotsybc[15].ItemId = new_Skin.Hieuungbay;
                          //  }
                          //  if (preferences.Fac){
                                //Slotsybc[16].ItemId = new_Skin.Fac;
                         //   }
                            
                          //  if (preferences.Outfit){
                           //     if (Slotsybc.Num() > 2)  Slotsybc[2].ItemId = new_Skin.XSuits;
                                /*int autovip[] = {403003};
  // for (int j = 0; j < Slotsybc.Num(); j++) {
     for (int i = 0; i < sizeof(autovip) / sizeof(autovip[0]); i++) {
                 if (Slotsybc[j].ItemId == autovip[i]) {
      Slotsybc[j].ItemId = new_Skin.XSuits;
     }}*/
   // }
                               //  Slotsybc[5].ItemId = new_Skin.XSuits;
                                //if (Slotsybc.Num() > 3) Slotsybc[3].ItemId = new_Skin.quan;
                                //if (Slotsybc.Num() > 4) Slotsybc[4].ItemId = new_Skin.giay;
                                //if (Slotsybc.Num() > 5) Slotsybc[5].ItemId = new_Skin.Kaaba;
                         //   }
                          //  if (preferences.Bagg){
                           // int unban1[] = {501001,501004,501007,501010,501101,501104,501002,501005,501008,501011,501102,501105,501006,501003,501009,501012,501015,501106,501103,1501003174,1501003220,1501003024,1501003047,0};
   
     //for (int i = 0; i < sizeof(unban1) / sizeof(unban1[0]); i++) {
                // if (Slotsybc[j].ItemId == unban1[i]) {
  //    Slotsybc[j].ItemId = bag3;
    // }}
  //  }

                          //  }
                          //  if (preferences.Helmett){
                           //     int hel1[] = {502004,502001,502110,502107,502104,502005,502002,502111,502108,502105,502106,502109,502112,502003,1502003014,1502003069,0};
  // for (int j = 0; j < Slotsybc.Num(); j++) {
  //   for (int i = 0; i < sizeof(hel1) / sizeof(hel1[0]); i++) {
            //     if (Slotsybc[j].ItemId == hel1[i]) {
      //Slotsybc[j].ItemId = helmett3;
      
   //  }}
  //  }

                         //   }
                         
                        //    localPlayer->AvatarComponent2->OnRep_BodySlotStateChanged();
                        //    localPlayerController->BackpackComponent->OnRep_ItemListNet();
                            /*auto now = std::chrono::high_resolution_clock::now();
                            auto elapsed = std::chrono::duration_cast<std::chrono::seconds>(now - start).count();
                            
                            if (elapsed < 1 && callFunction) {
                                localPlayer->AvatarComponent2->OnRep_BodySlotStateChanged();
                                localPlayerController->BackpackComponent->OnRep_ItemListNet();
                            } else {
                                callFunction = false;
                            }*/
                           // if (preferences.Parachute){
                               // if (Slotsybc.Num() > 11) {
                               //     Slotsybc[11].ItemId = new_Skin.Parachute;
                              //      localPlayer->AvatarComponent2->OnRep_BodySlotStateChanged();
                            //localPlayerController->BackpackComponent->OnRep_ItemListNet();
                             //   }
                          //  }
                          //  if (preferences.Hieuungbay){
                              //  Slotsybc[15].ItemId = new_Skin.Hieuungbay;
                         //   }
                          //  if (preferences.Fac){
                            //    Slotsybc[16].ItemId = new_Skin.Fac;
                         //   }
                            
                            


for (int i = 0; i < Slotsybc.Num(); i++)
{
    auto& id = Slotsybc[i].ItemId;
    auto sl = Slotsybc[i].SlotID;

    if (preferences.Outfit && sl == 5 && id != new_Skin.XSuits) {
        id = new_Skin.XSuits;
        localPlayer->AvatarComponent2->OnRep_BodySlotStateChanged();
localPlayerController->BackpackComponent->OnRep_ItemListNet();
    }

    if (preferences.Parachute && sl == 11 && id != new_Skin.Parachute){
                               id = new_Skin.Parachute;
localPlayer->AvatarComponent2->OnRep_BodySlotStateChanged();
localPlayerController->BackpackComponent->OnRep_ItemListNet();
}
if (preferences.Gloves && sl == 7 && id != new_Skin.Gloves){
                               id = new_Skin.Gloves;
localPlayer->AvatarComponent2->OnRep_BodySlotStateChanged();
localPlayerController->BackpackComponent->OnRep_ItemListNet();
}

    if (preferences.Bagg) {
        if (sl == 8 && id > 0 && id != bag1 && id != bag2 && id != bag3) {
            switch (id) {
                case 501001: case 501004: case 501007:
                case 501010: case 501101: case 501104:
                case 1501001174: case 1501001220: case 1501001024:
                case 1501001047:
                    id = bag1;
                    localPlayer->AvatarComponent2->OnRep_BodySlotStateChanged();
localPlayerController->BackpackComponent->OnRep_ItemListNet();
                    break;
                case 501002: case 501005: case 501008:
                case 501011: case 501102: case 501105:
                case 1501002174: case 1501002220: case 1501002024:
                case 1501002047:
                    id = bag2;
                    localPlayer->AvatarComponent2->OnRep_BodySlotStateChanged();
localPlayerController->BackpackComponent->OnRep_ItemListNet();
                    break;
                case 501006: case 501003: case 501009:
                case 501012: case 501015: case 501106:
                case 501103:
                case 1501003174: case 1501003220: case 1501003024:
                case 1501003047:
                    id = bag3;
                    localPlayer->AvatarComponent2->OnRep_BodySlotStateChanged();
localPlayerController->BackpackComponent->OnRep_ItemListNet();
                    break;
            }
        }
    }
    if (preferences.Helmett) {
        if (sl == 9 && id > 0 && id != helmett1 && id != helmett2 && id != helmett3) {
            switch (id) {
                case 502004: case 502001: case 502110:
                case 502107: case 502104:
                case 1502001014: case 1502001069:
                    id = helmett1;
                    localPlayer->AvatarComponent2->OnRep_BodySlotStateChanged();
localPlayerController->BackpackComponent->OnRep_ItemListNet();
                    break;
                case 502005: case 502002: case 502111:
                case 502108: case 502105:
                case 1502002014: case 1502002069:
                    id = helmett2;
                    localPlayer->AvatarComponent2->OnRep_BodySlotStateChanged();
localPlayerController->BackpackComponent->OnRep_ItemListNet();
                    break;
                case 502106:  case 502109: case 502112:
                case 502003:
                case 1502003014: case 1502003069:
                    id = helmett3;
                    localPlayer->AvatarComponent2->OnRep_BodySlotStateChanged();
localPlayerController->BackpackComponent->OnRep_ItemListNet();
                    break;
            }
        }
    }
} 



                            
                        }
                    }
                    

                    if(!g_PlayerController == 0){

            
            auto VTable = *(void ***)g_PlayerController;
            
            if (VTable && (VTable[1002] != hk_Broadcast)) {
                orig_Broadcast = decltype(orig_Broadcast)(VTable[1002]);
                
                VTable[1002] = (void *)hk_Broadcast;

            }}
                    
                    int totalEnemies = 0, totalBots = 0;
                    std::vector<ASTExtraPlayerCharacter*> PlayerCharacter2;
                    GetAllActors(PlayerCharacter2);
                    for (auto actor = PlayerCharacter2.begin(); actor != PlayerCharacter2.end(); actor++) {
                        auto Player = *actor;
                        float  Distance = Player->GetDistanceTo(localPlayer) / 100.f;
                        if(450 < Distance)
                            continue;
                        if (Player->PlayerKey == localPlayer->PlayerKey)
                            continue;
                        if (Player->TeamID == localPlayer->TeamID)
                            continue;
                        if (Player->bDead)
                            continue;
                        if (Player->bHidden )
                            continue;
                        if (!Player->Mesh)
                            continue;
                        if (!Player->RootComponent)
                            continue;
                        if (boquabot) {
                            if (Player->bEnsure)
                                continue;
                        }
                        
                        if (Player->bEnsure)
                            totalBots++;
                        else totalEnemies++;
                        FVector   Head = GetBoneLocationByName(Player, "Head");
                        Head.Z += 12.5f;
                        FVector Root = GetBoneLocationByName(Player, "Root");
                        headp = GetBoneLocationByName(Player, "Head");
                        
                        bool IsVisible = localPlayerController->LineOfSightTo(Player, {0,0,0}, true);

                        
    
                    }PlayerCharacter2.clear();  
                }
                
                
                
                //---------------------AIMBOT------------------//
                
                if(localPlayer){

                    
                    if (IsAimbots) {
                        
                        ASTExtraPlayerCharacter *Target = GetTargetForAimBotByFOV();
                        if (Target) {
                            bool triggerOk = true;
                            if (batchedoaim) {
                                
                                if (IsMode == 1) {
                                    triggerOk = localPlayer->bIsWeaponFiring;
                                } else if (IsMode == 2) {
                                    triggerOk = localPlayer->bIsGunADS;
                                } else if (IsMode == 3)  {//IsBothaim
                                    triggerOk = localPlayer->bIsWeaponFiring && localPlayer->bIsGunADS;
                                } else if (IsMode == 4) {
                                    triggerOk = localPlayer->bIsWeaponFiring || localPlayer->bIsGunADS;
                                }
                                
                            } else triggerOk = true;
                            if (triggerOk) {
                                FVector targetAimPos;//aimpos();//  speed
                                if(IsPart == 0){//head
                                    targetAimPos = Target->GetBonePos("Head", {});
                                }else if(IsPart == 1){//nick
                                    targetAimPos = Target->GetBonePos("spine_02", {});
                                }
                                auto WeaponManagerComponent = localPlayer->WeaponManagerComponent;
                                if (WeaponManagerComponent) {
                                    auto propSlot = WeaponManagerComponent->GetCurrentUsingPropSlot();
                                    if ((int) propSlot.GetValue() >= 1 &&
                                        (int) propSlot.GetValue() <= 3) {
                                        auto CurrentWeaponReplicated = (ASTExtraShootWeapon *) WeaponManagerComponent->CurrentWeaponReplicated;
                                        if (CurrentWeaponReplicated) {
                                            auto ShootWeaponComponent = CurrentWeaponReplicated->ShootWeaponComponent;
                                            if (ShootWeaponComponent) {
                                                UShootWeaponEntity *ShootWeaponEntityComponent = ShootWeaponComponent->ShootWeaponEntityComponent;
                                                
                                                //aim dự đoán
                                                if (ShootWeaponEntityComponent) {
                                                    ASTExtraVehicleBase *CurrentVehicle = Target->CurrentVehicle;
                                                    if (CurrentVehicle) {
                                                        FVector LinearVelocity = CurrentVehicle->ReplicatedMovement.LinearVelocity;
                                                        float dist = localPlayer->GetDistanceTo(Target);
                                                        auto timeToTravel = dist /
                                                        ShootWeaponEntityComponent->BulletFireSpeed;
                                                        targetAimPos = UMC->Add_VectorVector(targetAimPos,UMC->Multiply_VectorFloat(LinearVelocity, timeToTravel));
                                                    } else {
                                                        FVector Velocity = Target->GetVelocity();
                                                        float dist = localPlayer->GetDistanceTo(Target);
                                                        auto timeToTravel = dist /
                                                        ShootWeaponEntityComponent->BulletFireSpeed;
                                                        targetAimPos = UMC->Add_VectorVector(targetAimPos, UMC->Multiply_VectorFloat(Velocity, timeToTravel));
                                                    }
                                                    //       if (localPlayer->bIsGunADS) {
                                                    if (localPlayer->bIsWeaponFiring) {
                                                        float dist = localPlayer->GetDistanceTo(Target) / 100.f;
                                                        targetAimPos.Z -= dist * IsRecoil;
                                                    }
                                                    /*              }}
                                                     
                                                     localPlayerController->ClientSetLocation(localPlayer->K2_GetActorLocation(), ToRotator(localPlayerController->PlayerCameraManager->CameraCache.POV.Location, targetAimPos));
                                                     }}
                                                     */
                                                    
                                                    FVector fDir = UKismetMathLibrary::Subtract_VectorVector(targetAimPos, localPlayerController->PlayerCameraManager->CameraCache.POV.Location);
                                                    FRotator Yaptr = UKismetMathLibrary::Conv_VectorToRotator(fDir);
                                                    FRotator CpYaT = localPlayerController->PlayerCameraManager->CameraCache.POV.Rotation;
                                                    Yaptr.Pitch -= CpYaT.Pitch;
                                                    Yaptr.Yaw -= CpYaT.Yaw;
                                                    Yaptr.Roll = 0.f;
                                                    IMGUI_GOD(Yaptr);
                                                    CpYaT.Pitch += Yaptr.Pitch / IsSpeed; //AIMSPEED HORIZON
                                                    CpYaT.Yaw += Yaptr.Yaw / IsSpeed; // AIMSPEED VERTICAL
                                                    CpYaT.Roll = 0.f;
                                                    localPlayerController->SetControlRotation(CpYaT,"");
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }


                //ipadview
                if(g_LocalPlayer){





                    if (IsBunnyJUMP) {


    UCharacterMovementComponent *CharacterMovement = g_LocalPlayer->CharacterMovement;
    if (CharacterMovement) {
        CharacterMovement->JumpZVelocity = 1050.0f;
        CharacterMovement->GravityScale = 0.02f;
        CharacterMovement->BrakingDecelerationFalling = 15.0f;
        CharacterMovement->FallingLateralFriction = 0.01f;
        CharacterMovement->Velocity.X = 0.0f;
        CharacterMovement->AirControl = 5.0f;
        CharacterMovement->MaxWalkSpeed = 5000.0f;
        CharacterMovement->bNotifyApex = true;
        CharacterMovement->GroundFriction = 8.0f;
        
        // الطريقة الموصى بها لتعيين RotationRate:
        FRotator NewRotation;
        NewRotation.Pitch = 0.0f;
        NewRotation.Yaw = 360.0f;
        NewRotation.Roll = 0.0f;
        CharacterMovement->RotationRate = NewRotation;
    }
}
                    if (AutoFlashUPP) {
    if (g_LocalPlayer->PoseState == ESTEPoseState::ESTEPoseState__Crouch ||
        g_LocalPlayer->PoseState == ESTEPoseState::ESTEPoseState__CrouchSprint) {
        FlashUPP = true;
    } else {
        FlashUPP = false;
    }
}

if (FlashUPP) {
    g_LocalPlayer->CustomTimeDilation = flashFuckk1;
} else {
    g_LocalPlayer->CustomTimeDilation = 1.f;
}
                    if(Snow){
g_LocalPlayer->STPlayerController->SetIsSnowy(true);
}  else {
    g_LocalPlayer->STPlayerController->SetIsSnowy(false);
}          
 if (GiveUp) {
                                g_LocalPlayer->STPlayerController->RPC_GiveUpGame();

}   
if (NoGravity) {
UCharacterMovementComponent *CharacterMovement = g_LocalPlayer->CharacterMovement;
if (CharacterMovement) {
CharacterMovement->GravityScale = 0.f;
}}                    

if(Rain){
g_LocalPlayer->STPlayerController->SetIsRainy(true);
} else {
    g_LocalPlayer->STPlayerController->SetIsRainy(false);
}
                    if (IsScaleCharacter) {
                        USceneComponent* MeshContainer = g_LocalPlayer->MeshContainer;
                        if(localPlayer->bIsGunADS) {MeshContainer->SetWorldScale3D({1, 1, 1});
                                                }else{

MeshContainer->SetWorldScale3D({X1, X1, X1});
                                                }
} else {
                            USceneComponent* MeshContainer = g_LocalPlayer->MeshContainer;
                            MeshContainer->SetWorldScale3D({1.f, 1.f, 1.f});
                        }
                }
                if(localPlayerController){
                        if (tam7mau) {

                            static float cnt = 0.0f;
                            const float RainbowSpeed = 8.0f;
                            const int RainbowColorCount = 7;
                            const float FullCircle = 360.0f;
                            const float IncrementValue = 0.02f;

                            FLinearColor rainbowColors[RainbowColorCount] = {
                                FLinearColor(1.0f, 0.0f, 0.0f, 1.0f),
                                FLinearColor(1.0f, 0.5f, 0.0f, 1.0f),
                                FLinearColor(1.0f, 1.0f, 0.0f, 1.0f),
                                FLinearColor(0.0f, 1.0f, 0.0f, 1.0f),
                                FLinearColor(0.0f, 0.0f, 1.0f, 1.0f),
                                FLinearColor(0.5f, 0.0f, 1.0f, 1.0f),
                                FLinearColor(1.0f, 0.0f, 1.0f, 1.0f)
                            };

                            int rainbowColorIndex = static_cast<int>(fmod(cnt * RainbowSpeed, RainbowColorCount));
                            FLinearColor color1 = rainbowColors[rainbowColorIndex];
                            FLinearColor color2 = rainbowColors[(rainbowColorIndex + 1) % RainbowColorCount];
                            float rainbowPhase = fmod(cnt * RainbowSpeed, 1.0f);
                            FLinearColor interpolatedColor = FLinearColor(
                                color1.R + (color2.R - color1.R) * rainbowPhase,
                                color1.G + (color2.G - color1.G) * rainbowPhase,
                                color1.B + (color2.B - color1.B) * rainbowPhase, 1.0f);
                            localPlayerController->CrossHairColor = interpolatedColor;

                            if (cnt >= FullCircle) {
                                cnt = 0.0f;
                            } else {
                                cnt += IncrementValue;
                            }
                                                                
                            }else {
                            localPlayerController->CrossHairColor = FLinearColor(0.0f, 0.0f, 0.0f, 1.0f);;
                        }}
                        if (IsView){
                            localPlayer->ThirdPersonCameraComponent->SetFieldOfView(IsTPPValue);
                            localPlayer->FPPCameraComp->SetFieldOfView(IsFPPValue);
                        } else {
                            localPlayer->ThirdPersonCameraComponent->SetFieldOfView(90);
                            localPlayer->FPPCameraComp->SetFieldOfView(90);
                        }

                        if (IsSpinCharacters) {
                                                if(localPlayer->bIsGunADS) {localPlayer->MeshContainer->RelativeRotation = { 0,360,0 };
                                                }else{
                                                    USceneComponent* MeshContainer = localPlayer->MeshContainer;
                                                    MeshContainer->RelativeRotation = { DanceValues,DanceValues ,DanceValues };
                                                    DanceValues += DancerValues;
                                                    if (DanceValues >= 360.0f)
                                                        DanceValues = 0.0f;
                                                    DanceValues += (spinspeeds);
                                                }
                                            }
                         
                        if (IsSpinCharacter) {
                                                if(localPlayer->bIsGunADS) {localPlayer->MeshContainer->RelativeRotation = { 0,360,0 };
                                                }else{
                                                    USceneComponent* MeshContainer = localPlayer->MeshContainer;
                                                    MeshContainer->RelativeRotation = { 0,DanceValue ,0 };
                                                    DanceValue += DancerValue;
                                                    if (DanceValue >= 360.0f)
                                                        DanceValue = 0.0f;
                                                    DanceValue += (spinspeed);
                                                }
                                            } else {
                                                localPlayer->MeshContainer->RelativeRotation = { 0,360,0 };
                                            }
                        //IsJump
                        if(IsJump){
                            localPlayer->CharacterMovement->GravityScale = (int) -15;
                            localPlayer->CharacterMovement->JumpZVelocity = 10.f;
                            localPlayer->CharacterMovement->JumpOffJumpZFactor = 10.f;
                        }
                        if(AUOTJUMPAN){
                            localPlayer->Jump();
                        }
                        if(ongngamzoom){
                            UCameraComponent *ScopeCameraComp = localPlayer->ScopeCameraComp;
                            if (ScopeCameraComp){
                                ScopeCameraComp->SetFieldOfView(SetZoom);
                            }
                        }
                        if(autotap){
                            localPlayer->SetWeaponShootType(ESTEWeaponShootType::ESTEWeaponShootType__Auto);
                        }
                        
    
    
                        

                                                        if (AttackTeammates) {
    auto WeaponManagerComponent = localPlayer->WeaponManagerComponent;
    if (WeaponManagerComponent) {
        auto CurrentWeaponReplicated = (SDK::ASTExtraShootWeapon*)WeaponManagerComponent->CurrentWeaponReplicated;
        if (CurrentWeaponReplicated && CurrentWeaponReplicated->ShootWeaponEntityComp) {
            CurrentWeaponReplicated->ShootWeaponEntityComp->bCanShootSameTeam = true;
        }
    }
}
            
                        
  
                        //show players weapon name --------------
                        
                        
                        
                        if(!localPlayer->IsUsingGrenade()) {
                            auto WeaponManagerComponent = localPlayer->WeaponManagerComponent;
                            if (WeaponManagerComponent) {
                                auto propSlot = WeaponManagerComponent->GetCurrentUsingPropSlot();
                                if ((int) propSlot.GetValue() >= 1 &&
                                    (int) propSlot.GetValue() <= 3) {
                                    auto CurrentWeaponReplicated = (ASTExtraShootWeapon *) WeaponManagerComponent->CurrentWeaponReplicated;
                                    if (CurrentWeaponReplicated) {
                                        auto ShootWeaponEntityComp = CurrentWeaponReplicated->ShootWeaponEntityComp;
                                        auto ShootWeaponEffectComp = CurrentWeaponReplicated->ShootWeaponEffectComp;
                                        
                                        if (ShootWeaponEntityComp && ShootWeaponEffectComp)
                                        {
                                            
                                            //-----------------------------------MEMORY-----------------------------------------------//
                                            if(xoaytam){
                                            static auto aa1 = std::chrono::high_resolution_clock::now();
                                            auto aa2 = std::chrono::high_resolution_clock::now();
                                            float aa3 = std::chrono::duration<float>(aa2 - aa1).count();
                                            float xx = fmod(aa3 * -180.f, 360.f); 
                                            auto WeaponManagerComponent = g_LocalPlayer->WeaponManagerComponent;
                                            if (WeaponManagerComponent) {
                                                auto CurrentWeaponReplicated = (ASTExtraShootWeapon *) WeaponManagerComponent->CurrentWeaponReplicated;
                                                if (CurrentWeaponReplicated) {
                                                   // auto ShootWeaponEntityComp = CurrentWeaponReplicated->ShootWeaponEntityComp;
                                                    auto CachedCrossHairComponent = CurrentWeaponReplicated->CachedCrossHairComponent;
                                                    if (CachedCrossHairComponent) {
                                                        CachedCrossHairComponent->RotateAngle = xx;
                                                       // ShootWeaponEntityComp->GameDeviationFactor = 0.0f;
                                                    }}}
                                                } else {auto WeaponManagerComponent = g_LocalPlayer->WeaponManagerComponent;
                                            if (WeaponManagerComponent) {
                                                auto CurrentWeaponReplicated = (ASTExtraShootWeapon *) WeaponManagerComponent->CurrentWeaponReplicated;
                                                if (CurrentWeaponReplicated) {
                                                   // auto ShootWeaponEntityComp = CurrentWeaponReplicated->ShootWeaponEntityComp;
                                                    auto CachedCrossHairComponent = CurrentWeaponReplicated->CachedCrossHairComponent;
                                                    if (CachedCrossHairComponent) {
                                                    CachedCrossHairComponent->RotateAngle = 0;
                                                    }
                                                }
                                            }
                                                }

                                                if (FastReload) {
                                    ShootWeaponEntityComp->ReloadRate = 0.0f;                        
							    }
                                if(IsOneShotKill) {                                                            
                                                        ShootWeaponEntityComp->BulletNumSingleShot = 15;
                                                                                                           
}
if (IsAimlock) {
                      ShootWeaponEntityComp->AutoAimingConfig.OuterRange.Speed = 99999999999;
                      ShootWeaponEntityComp->AutoAimingConfig.InnerRange.Speed = 99999999999;
                                    }

                                                if (FastScope) {



    auto ShootWeaponEntityComp = CurrentWeaponReplicated->ShootWeaponEntityComp;
    if (ShootWeaponEntityComp) {
        ShootWeaponEntityComp->WeaponAimFOV = 99999999999;
        ShootWeaponEntityComp->WeaponAimInTime = 99999999999;
    }
}   
                                            
                                         //   if (tamnho) {
                                             //   auto WeaponManagerComponent = localPlayer->WeaponManagerComponent;
                                           //     if (WeaponManagerComponent) {
                                               ////     auto CurrentWeaponReplicated = (ASTExtraShootWeapon *) WeaponManagerComponent->CurrentWeaponReplicated;
                                                 //   if (CurrentWeaponReplicated) {
                                                  //      auto ShootWeaponEntityComp = CurrentWeaponReplicated->ShootWeaponEntityComp;
                                                   //     auto ShootWeaponEffectComp = CurrentWeaponReplicated->ShootWeaponEffectComp;
                                                //        if (ShootWeaponEntityComp && ShootWeaponEffectComp) {
                                                            if (tamnho) {
                                                                ShootWeaponEntityComp->GameDeviationFactor = 0.0f;
                                                            }
                                                            
                                                     //   }
                                                 //   }
                                             //   }
                                       //    }
                                            if (IsFastSwitch)
{
ShootWeaponEntityComp->SwitchFromBackpackToIdleTime = 0.0f;
 ShootWeaponEntityComp->SwitchFromIdleToBackpackTime = 0.0f;
                                }
                                            
                                            if(IsCrossHair){
                                                memset(&ShootWeaponEntityComp->DeviationInfo, 0, sizeof(FSDeviation));
                                                ShootWeaponEntityComp->ShotGunCenterPerc = 0.0f;
                                                ShootWeaponEntityComp->ShotGunVerticalSpread = 0.0f;
                                                ShootWeaponEntityComp->ShotGunHorizontalSpread = 0.0f;
                                                ShootWeaponEntityComp->GameDeviationFactor = 0.0f;
                                                ShootWeaponEntityComp->GameDeviationAccuracy = 0.0f;
                                                ShootWeaponEntityComp->CrossHairInitialSize = 0.0f;
                                                ShootWeaponEntityComp->CrossHairBurstSpeed = 0.0f;
                                                ShootWeaponEntityComp->CrossHairBurstIncreaseSpeed = 0.0f;
                                                ShootWeaponEntityComp->VehicleWeaponDeviationAngle = 0.0f;
                                            }
                                            if(IsHitXPL){
                                                ShootWeaponEntityComp->ExtraHitPerformScale = 100;
                                                ShootWeaponEntityComp->HUDAlphaDecreaseSpeedScale = 1.f;
                                            }
                                            if(IsNocamerashake) {
                                                ShootWeaponEffectComp->CameraShakeInnerRadius = 0.0f;
                                                ShootWeaponEffectComp->CameraShakeOuterRadius = 0.0f;
                                                ShootWeaponEffectComp->CameraShakFalloff = 0.0f;
                                                ShootWeaponEntityComp->AnimationKick = 0;
                                            }
                                            if(IsNorecoil2){
                                                            ShootWeaponEntityComp->RecoilKickADS = 0.0f;
                                                        }
                                            if(IsNorecoil){
                                                //{
                                                memset(&ShootWeaponEntityComp->RecoilInfo, 0, sizeof(FSRecoilInfo));
                                                    memset(&ShootWeaponEntityComp->DeviationInfo, 0, sizeof(FSDeviation));
                                                    ShootWeaponEntityComp->AccessoriesVRecoilFactor = 0.0f;
                                                    ShootWeaponEntityComp->AccessoriesHRecoilFactor = 0.0f;
                                                    ShootWeaponEntityComp->AccessoriesRecoveryFactor = 0.0f;
                                                    
                                                    //memset(&ShootWeaponEntityComp->DeviationInfo, 0, sizeof(FSDeviation));
                                                //}
                                            }
                                            if(IsFastshoot){
                                                ShootWeaponEntityComp->ShootInterval =0.060606f;
                                            }
                                            if(IsFastBullet) {
                                                ShootWeaponEntityComp->BulletFireSpeed = 80000.f;
                                            }
                                            if (IsScaleWeapon) {
                                                if (localPlayer->bIsGunADS) {
                                                localPlayer->WeaponManagerComponent->CurrentWeaponReplicated->RootComponent->RelativeScale3D.Y = 1;
                                                localPlayer->WeaponManagerComponent->CurrentWeaponReplicated->RootComponent->RelativeScale3D.Z = 1;
                                                localPlayer->WeaponManagerComponent->CurrentWeaponReplicated->RootComponent->RelativeScale3D.X = 1;
                                                } else {
                                                localPlayer->WeaponManagerComponent->CurrentWeaponReplicated->RootComponent->RelativeScale3D.Y = WeaponScaleChanger;
                                                localPlayer->WeaponManagerComponent->CurrentWeaponReplicated->RootComponent->RelativeScale3D.Z = WeaponScaleChanger;
                                                localPlayer->WeaponManagerComponent->CurrentWeaponReplicated->RootComponent->RelativeScale3D.X = WeaponScaleChanger;
                                                }
                                            } else {
                                                localPlayer->WeaponManagerComponent->CurrentWeaponReplicated->RootComponent->RelativeScale3D.Y = 1;
                                                localPlayer->WeaponManagerComponent->CurrentWeaponReplicated->RootComponent->RelativeScale3D.Z = 1;
                                                localPlayer->WeaponManagerComponent->CurrentWeaponReplicated->RootComponent->RelativeScale3D.X = 1;
                                            }
                                            
                                            
                                            
                                            
                                            if (GodMode){
                                                APawn* Pawn = GetFullWorld()->NetDriver->ServerConnection->PlayerController->K2_GetPawn();
                                                if ( Pawn != NULL )
                                                {
                                                    if ( Pawn->bCanBeDamaged )
                                                    {
                                                        Pawn->bCanBeDamaged = false;
                                                    }
                                                    else
                                                    {
                                                        Pawn->bCanBeDamaged = true;
                                                    }
                                                }
                                                else
                                                {
                                                    NSLog(@"No APawn* possessed");
                                                }
                                            }
                                            
                                            if (IsFly) {
                                                UCharacterMovementComponent* CharacterMovement = g_LocalPlayer->CharacterMovement;
                                                if (CharacterMovement) {
                                                    CharacterMovement->SetMovementMode(EMovementMode::MOVE_Flying,1);
                                                    FVector NewLocation = g_LocalPlayer->K2_GetActorLocation();
                                                    NewLocation.Z += 1000.0f; // Adjust height as needed
                                                    CharacterMovement->GravityScale = 0.0f;
                                                    g_LocalPlayer->K2_SetActorLocation(NewLocation,0, false,nullptr);
                                                }else {
                                                    CharacterMovement->SetMovementMode(EMovementMode::MOVE_Walking,1);
                                                    CharacterMovement->GravityScale = 1.0f;
                                                }
                                            }
                                            
                                        }
                                    }
                                    
                                    
                                }
                                
                            }
                        }
                }
            }
            //---------------------END AIMBOT------------------//
            
        }


        




    g_LocalPlayer = localPlayer;
    g_PlayerController = localPlayerController;
}
   
void (*orig_Broadcast)(ASTExtraPlayerController* thiz, struct FFatalDamageParameter* FatalDamageParameter);
void hk_Broadcast(ASTExtraPlayerController* thiz, struct FFatalDamageParameter* FatalDamageParameter)
{
    if (hidename) {
        if(!g_PlayerController == 0){
            FatalDamageParameter->String.causerName = FString("");
            FatalDamageParameter->String.VictimName = FString("");
            FatalDamageParameter->String.FuzzyCauserName = FString("");
            FatalDamageParameter->String.FuzzyVictimName = FString("");
            FatalDamageParameter->String.RealKillerName = FString("");
            FatalDamageParameter->String.CauserNation = FString("");
            FatalDamageParameter->String.VictimNation = FString("");
        }
    
    }
    if (initkillmsgopen) {
        if(!g_PlayerController == 0){
            if (g_PlayerController->PlayerKey == FatalDamageParameter->CauserKey)
            {
                uint32_t key = FatalDamageParameter -> CauserKey;
                if (key == g_PlayerController -> PlayerKey) {
                    
                    if (preferences.Config.Skin.XSuits >= 1)
                        FatalDamageParameter -> CauserClothAvatarID = new_Skin.XSuits;
                    
                    if (!g_LocalPlayer -> CurrentVehicle) {
                        auto WeaponManagerComponent = g_LocalPlayer -> WeaponManagerComponent;
                        if (WeaponManagerComponent) {
                            auto CurrentWeaponReplicated = (ASTExtraShootWeapon * ) WeaponManagerComponent -> CurrentWeaponReplicated;
                            if (CurrentWeaponReplicated) {
                                auto ShootWeaponComponent = CurrentWeaponReplicated -> ShootWeaponComponent;
                        
                                if (ShootWeaponComponent) {
                                    int g_WeaponID = g_LocalPlayer -> WeaponManagerComponent -> CurrentWeaponReplicated -> GetWeaponID();
                                    if (g_WeaponID == 101001) {
                                        if (preferences.Config.Skin.AKM >= 1)
                                            FatalDamageParameter -> CauserWeaponAvatarID = new_Skin.AKM;
                                    } else if (g_WeaponID == 101002) {
                                        if (preferences.Config.Skin.M16A4 >= 1)
                                            FatalDamageParameter -> CauserWeaponAvatarID = new_Skin.M16A4;
                                    } else if (g_WeaponID == 101003) {
                                        if (preferences.Config.Skin.Scar >= 1)
                                            FatalDamageParameter -> CauserWeaponAvatarID = new_Skin.Scar;
                                    } else if (g_WeaponID == 101004) {
                                        if (preferences.Config.Skin.M416 >= 1)
                                            FatalDamageParameter -> CauserWeaponAvatarID = new_Skin.M416_1;
                                    } else if (g_WeaponID == 101005) {
                                        if (preferences.Config.Skin.Groza >= 1)
                                            FatalDamageParameter -> CauserWeaponAvatarID = new_Skin.Groza;
                                    } else if (g_WeaponID == 101006) {
                                        if (preferences.Config.Skin.AUG >= 1)
                                            FatalDamageParameter -> CauserWeaponAvatarID = new_Skin.AUG;
                                    } else if (g_WeaponID == 101007) {
                                        if (preferences.Config.Skin.QBZ >= 1)
                                            FatalDamageParameter -> CauserWeaponAvatarID = new_Skin.QBZ;
                                    } else if (g_WeaponID == 101008) {
                                        if (preferences.Config.Skin.M762 >= 1)
                                            FatalDamageParameter -> CauserWeaponAvatarID = new_Skin.M762;
                                    } else if (g_WeaponID == 101102) {
                                        if (preferences.Config.Skin.ACE32 >= 1)
                                            FatalDamageParameter -> CauserWeaponAvatarID = new_Skin.ACE32;
                                    } else if (g_WeaponID == 101012) {
                                        if (preferences.Config.Skin.Honey >= 1)
                                            FatalDamageParameter -> CauserWeaponAvatarID = new_Skin.Honey;
                                    } else if (g_WeaponID == 102001) {
                                        if (preferences.Config.Skin.UZI >= 1)
                                            FatalDamageParameter -> CauserWeaponAvatarID = new_Skin.UZI;
                                    } else if (g_WeaponID == 102002) {
                                        if (preferences.Config.Skin.UMP >= 1)
                                            FatalDamageParameter -> CauserWeaponAvatarID = new_Skin.UMP;
                                    } else if (g_WeaponID == 102003) {
                                        if (preferences.Config.Skin.Vector >= 1)
                                            FatalDamageParameter -> CauserWeaponAvatarID = new_Skin.Vector;
                                    } else if (g_WeaponID == 102004) {
                                        if (preferences.Config.Skin.Thompson >= 1)
                                            FatalDamageParameter -> CauserWeaponAvatarID = new_Skin.Thompson;
                                    } else if (g_WeaponID == 102005) {
                                        if (preferences.Config.Skin.Bizon >= 1)
                                            FatalDamageParameter -> CauserWeaponAvatarID = new_Skin.Bizon;
                                    } else if (g_WeaponID == 103001) {
                                        if (preferences.Config.Skin.K98 >= 1)
                                            FatalDamageParameter -> CauserWeaponAvatarID = new_Skin.K98;
                                    } else if (g_WeaponID == 103002) {
                                        if (preferences.Config.Skin.M24 >= 1)
                                            FatalDamageParameter -> CauserWeaponAvatarID = new_Skin.M24;
                                    } else if (g_WeaponID == 103003) {
                                        if (preferences.Config.Skin.AWM >= 1)
                                            FatalDamageParameter -> CauserWeaponAvatarID = new_Skin.AWM;
                                 //   } else if (g_WeaponID == 103005) {
                                      //  if (skinvss >= 1)
                                          //  FatalDamageParameter -> CauserWeaponAvatarID = new_Skin.VSS;
                                  //  } else if (g_WeaponID == 103004) {
                                        //if (skinsks >= 1)
                                          //  FatalDamageParameter -> CauserWeaponAvatarID = new_Skin.SKS;
                                    } else if (g_WeaponID == 103006) {
                                        if (preferences.Config.Skin.MINI14 >= 1)
                                            FatalDamageParameter -> CauserWeaponAvatarID = new_Skin.Mini14;
                                    } else if (g_WeaponID == 103007) {
                                        if (preferences.Config.Skin.MK14 >= 1)
                                            FatalDamageParameter -> CauserWeaponAvatarID = new_Skin.MK14;
                                  //  } else if (g_WeaponID == 103009) {
                                      //  if (skinslr >= 1)
                                          //  FatalDamageParameter -> CauserWeaponAvatarID = new_Skin.SLR;
                                    } else if (g_WeaponID == 103012) {
                                        if (preferences.Config.Skin.AMR >= 1)
                                            FatalDamageParameter -> CauserWeaponAvatarID = new_Skin.AMR;
                                    } else if (g_WeaponID == 104002) {
                                        if (preferences.Config.Skin.S1897 >= 1)
                                            FatalDamageParameter -> CauserWeaponAvatarID = new_Skin.S1897;
                                    } else if (g_WeaponID == 105002) {
                                        if (preferences.Config.Skin.DP28 >= 1)
                                            FatalDamageParameter -> CauserWeaponAvatarID = new_Skin.DP28;
                                    } else if (g_WeaponID == 105001) {
                                        if (preferences.Config.Skin.M249 >= 1)
                                            FatalDamageParameter -> CauserWeaponAvatarID = new_Skin.M249;
                                    } else if (g_WeaponID == 105010) {
                                        if (preferences.Config.Skin.MG3 >= 1)
                                            FatalDamageParameter -> CauserWeaponAvatarID = new_Skin.MG3;
                                    } else if (g_WeaponID == 106008) {
//                                        if (ModSkin.Skorpion >= 1)
                                            FatalDamageParameter -> CauserWeaponAvatarID = new_Skin.Skorpion;
                                    } else if (g_WeaponID == 108004) {
                                        if (preferences.Config.Skin.Pan >= 1)
                                            FatalDamageParameter -> CauserWeaponAvatarID = new_Skin.Pan;
                                    }
                                    
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    return orig_Broadcast(thiz, FatalDamageParameter);
  }

void *(*oProcessEvent)(UObject *pObj, UFunction *pFunc, void *pArgs);
void *hkProcessEvent(UObject *pObj, UFunction *pFunc, void *pArgs) {
    if (pFunc) {
        if (pFunc->GetFullName() == ("Function Engine.HUD.ReceiveDrawHUD") ){
            AHUD *pHUD = (AHUD *) pObj;
            if (pHUD) {
                auto Params = (AHUD_ReceiveDrawHUD_Params *) pArgs;
                if (Params) {
                    RenderESP(pHUD, Params->SizeX, Params->SizeY);
                    screenWidth = Params->SizeX;
                    screenHeight = Params->SizeY;
                }
            }
        }
    }
    return oProcessEvent(pObj, pFunc, pArgs);
}



//====================.END DEADBOX BETA.====================

void  *RTL_language(){
    
    auto MAIN =(FUObjectArray *) (obbbbl());
    auto gobjects = MAIN->ObjObjects;
    for (int i=0;i< gobjects.Num(); i++)
        if (auto obj = gobjects.GetByIndex(i)) {
            if(obj->IsA(AHUD::StaticClass())) {
                auto HUD = (AHUD *) obj;
                int its = 76;
                auto VTable = (void**)HUD->VTable;
                if (VTable && ( VTable[its] != hkProcessEvent)) {
                    oProcessEvent = decltype(oProcessEvent)(VTable[its]);
                    VTable[its] = (void *) hkProcessEvent;
                }
            }
            if(obj->IsA(ASTExtraPlayerController::StaticClass())) {
                auto HUD = (ASTExtraPlayerController *) obj;
                int its = 76;
                auto VTable = (void**)HUD->VTable;
                if (VTable && ( VTable[its] != hkProcessEvent)) {
                    oProcessEvent = decltype(oProcessEvent)(VTable[its]);
                    VTable[its] = (void *) hkProcessEvent;
                }
            }
        }
    return 0;
}

+ (void)load
{
        FName::GNames = GetGNames();
    while (!FName::GNames) {
        FName::GNames = GetGNames();
          sleep(1);
    }
    
    
    UObject::GUObjectArray = (FUObjectArray *) (obbbbl());
    
    while (!UObject::GUObjectArray) {
    UObject::GUObjectArray = (FUObjectArray *) (obbbbl());
          sleep(1);
    }

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5* NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

    
        //start load but not means language
          [self load1];
        
    });
}
+ (void)load1
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            RTL_language();
    });
}


@end
