#import <Metal/Metal.h>
#import <MetalKit/MetalKit.h>
#import <Foundation/Foundation.h>
#import "Project/Main/MenuB.h"
#import "Project/ImGui/imgui.h"
#import "Project/ImGui/imgui_impl_metal.h"
#import "Project/Extra/ConfigMenu.h"
#include "Project/Extra/Obfuscate.h"
#import "ESP.hpp"
#import "Project/HideHack/HeeeNoScreenShotView.h"
#import "Project/Extra/fa-solid-900.ttf.h"
#import "Project/Extra/Font.h"
#include <dlfcn.h>
#include <arpa/inet.h>
#include <netdb.h>
#include <vector>
#include <string>
#include <unordered_set>
#include <mutex>
#include <thread>
#include <atomic>
#include <errno.h>

#define kWidth  [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height
#define kScale [UIScreen mainScreen].scale

@interface ImGuiDrawView () <MTKViewDelegate>
@property (nonatomic, strong) id <MTLDevice> device;
@property (nonatomic, strong) id <MTLCommandQueue> commandQueue;
@property (nonatomic, assign) BOOL canRunAgain;
@end

@implementation ImGuiDrawView

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
  int AKM = 1;
  int M16A4 = 1;
  int Scar = 1;
  int M416 = 1;
  int Groza = 1;
  int Famas =1;
  int AUG = 1;
  int QBZ = 1;
  int M762 = 1;
  int MG3 = 1;
  int Honey = 1;
  int S12K = 1;
  int DBS = 1;
  int S1897 = 1;
  int ACE32 = 1;
  int Parachute = 1;
  int Gloves = 1;
  int Fac = 1;
  int Hieuungbay = 1;
  int Comrade = 1;
  int UZI = 1;
  int UMP = 1;
  int Vector = 1;
  int Thompson = 1;
  int P90 = 1;
  int Bizon = 1;
  int K98 = 1;
  int M24 = 1;
  int AWM = 1;
  int AMR = 1;
  int Machete = 1;
  int MK14 = 1;
  int MINI14 =1;
  int DP28 = 1;
  int M249 = 1;
  int Pan = 1;
  int Moto = 1;
  int CoupeRP = 1;
  int UAZ = 1;
  int Dacia = 1;
  int Bigfoot = 1;
  int Mirado = 1;
  int OMirado = 1;
  int Buggy = 1;
  int RZR = 1;
  int MiniBus = 1;
  int Boat = 1;
};
sModSkin Skin{false};
        
    };
    sConfig Config{false};

} extern preferences;
extern bool initkillmsgopen;
extern bool ModSkinn;
extern bool DeadBox;
extern bool hidename;
extern bool TeleportEnemy;
extern bool SilentGodView;
extern bool AutoFlashUPP;
extern bool FlashUPP;
extern float flashFuckk1;
extern bool FastScope;
extern bool IsAimlock;
extern bool IsFastSwitch;
extern bool IsBunnyJUMP;
extern bool FastReload;
extern bool IsOneShotKill;
extern bool goodview;
extern bool AttackTeammates;
extern bool GiveUp;
extern bool IsSpinCharacter;
extern bool IsSpinCharacters;
extern bool IsScaleWeapon;
extern bool IsScaleCharacter;
extern bool Unlock120FPS;
extern float spinspeed;
extern float spinspeeds;
extern bool tam7mau;
extern bool xoaytam;
extern bool autotap;
extern bool Snow;
extern bool Rain;
extern bool showdame;
extern bool IsHitXPL;
extern float WeaponScaleChanger;
extern float X1;
extern bool IsNorecoil;
extern bool IsNorecoil2;
extern bool IsNocamerashake;
extern bool tamnho;
extern bool NoGravity;
bool AllCarHacks = false;
extern bool CrazyCar;
extern bool WallHackCar;
extern bool infinitycar;
extern bool carspring;
extern bool CarSpin;
extern float SpinCar360;
extern bool ongngamzoom;
extern float SetZoom;
extern bool skinlobby;
extern bool BagGun;
namespace Settings
{
    static int Tab = 0;
}
ImFont *FontMenu;
HeeeNoScreenShotView *hideesp;
INI* config;
extern int 自瞄模式,自瞄圆圈,雷达大小,雷达X,雷达Y,自瞄范围,预警范围,圆圈模式,圆圈固定,IsPart,人物美化,枪械美化,IsMode,IsStyle;
extern float IsRadius, radiusalert, IsTPPValue, IsFPPValue, Health;
extern float IsRecoil;
extern float 压枪速率,相机视野,IsSpeed,命中率,IsDistanceAimbot,物资距离,IsDistancePlayer,IsThicknessBone,IsThicknessLine;
extern bool 屏蔽人机;
bool IsMatchInfomation = NO;
bool HideHack = YES;
bool drawOutline = YES;
bool IsDeveloperMode = NO;
bool IsView = NO;
bool IsIgnoreKnock = NO;
bool IsNumberPlayer = NO;
bool IsBox=NO;
bool IsFov=NO;
bool IsLine = NO;
bool IsLineAimbot = NO;
bool IsName = NO;
bool IsNation = NO;
bool IsUID = NO;
extern bool boquabots;
bool IsDistance = NO;
bool IsTeam = NO;
bool IsHealth = NO;
bool IsAlert360 = NO;
bool IsBone = NO;
bool IsWeapon = NO;
bool 雷达开关 = NO;
bool 被瞄开关 = NO;
bool 背敌模式 = NO;
bool IsAimbot = NO;
bool IsBulletTrack = NO;
bool IsBulletTrack1=NO;
bool 静默开关 = YES;
bool 倒地开关 = NO;
bool IsAR = NO;
bool IsSR = NO;
bool IsSMG = NO;
bool IsShotGun = NO;
bool IsBom = NO;
bool IsBullet = NO;
bool IsArmor = NO;
bool IsRecovery = NO;
bool IsVehicle = NO;
bool IsScope = NO;
bool 美化开关 = NO;
bool 无后开关 = NO;
bool 防抖开关 = NO;
bool 瞬击开关 = NO;
bool 聚点开关 = NO;
bool IsWarningBom=NO;
bool IsDeadBox=NO;
bool IsAirDrop=NO;
bool MenDeal = true;
int Tab = 0;
int IsCheckAimbot = 0;
extern int AlivePlayerNum, AliveTeamNum, PlayerNum, minutes, seconds, Kill;
extern long NetDriver;
float IsFPSDraw = 30.0f;
extern bool AutoStand;
extern bool FAKEDAMAGE;
extern float muzzleOffsetZ;

extern ImVec4 ColorBoneVisible, ColorBoneInvisible, ColorLineVisible, ColorLineInvisible, ColorBoxVisible, ColorBoxInvisible, outlineColor;

// Biến toàn cục để điều khiển hiển thị banner và nội dung
static bool showBanner = false;
static std::string bannerMessage = "";
static double bannerStartTime = 0.0;

int IsEnglish = 0;





// Hàm để kích hoạt hiển thị banner
void ShowBannerNotification(const std::string& message) {
    showBanner = true;
    bannerMessage = message;
    bannerStartTime = ImGui::GetTime();
}

// Hàm vẽ thông báo banner - gọi trong vòng lặp ImGui
void RenderBannerNotification() {
    if (!showBanner) return;

    float currentTime = ImGui::GetTime();
    float elapsedTime = currentTime - bannerStartTime;

    // Thời gian hiển thị 2.5 giây, trong đó 0.5s để hiện/ẩn
    const float displayDuration = 2.0f;
    const float animationDuration = 0.5f;

    if (elapsedTime > displayDuration + animationDuration) {
        showBanner = false;
        return;
    }

    // Tính alpha để tạo hiệu ứng fade in/out
    float alpha = 1.0f;
    if (elapsedTime < animationDuration)
        alpha = elapsedTime / animationDuration; // Fade in
    else if (elapsedTime > displayDuration)
        alpha = 1.0f - (elapsedTime - displayDuration) / animationDuration; // Fade out

    // Cấu hình màu nền, chữ và viền
    ImVec4 bgColor = ImVec4(1, 1, 1, alpha); // trắng
    ImVec4 textColor = ImVec4(0, 0, 0, alpha); // đen
    ImVec4 borderColor = ImVec4(0, 0, 0, alpha); // Đen, có alpha

    // Kích thước màn hình để căn giữa
    ImVec2 windowSize = ImGui::GetIO().DisplaySize;

    // Tính toán kích thước văn bản
    ImVec2 textSize = ImGui::CalcTextSize(bannerMessage.c_str());
    // Thêm một chút padding cho đẹp
    ImVec2 bannerPadding = ImVec2(20.0f, 10.0f);
    ImVec2 bannerSize = ImVec2(textSize.x + 2 * bannerPadding.x, textSize.y + 2 * bannerPadding.y);
    ImVec2 bannerPos = ImVec2((windowSize.x - bannerSize.x) / 2.0f, 20); // Căn giữa theo chiều ngang

    // Vẽ banner
    ImGui::SetNextWindowPos(bannerPos, ImGuiCond_Always);
    ImGui::SetNextWindowBgAlpha(alpha);

    ImGui::PushStyleColor(ImGuiCol_WindowBg, bgColor);
    ImGui::PushStyleColor(ImGuiCol_Text, textColor);
    ImGui::PushStyleColor(ImGuiCol_Border, borderColor); // Thêm màu viền
    ImGui::PushStyleVar(ImGuiStyleVar_WindowRounding, 8.0f);
    ImGui::PushStyleVar(ImGuiStyleVar_WindowPadding, bannerPadding);

    ImGui::Begin("##BannerNotification", nullptr,
        ImGuiWindowFlags_NoDecoration |
        ImGuiWindowFlags_NoInputs |
        ImGuiWindowFlags_AlwaysAutoResize);

    ImGui::Text("%s", bannerMessage.c_str());

    ImGui::End();
    ImGui::PopStyleVar(2);
    ImGui::PopStyleColor(3);
}


- (instancetype)initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil
{
    hideesp=[[HeeeNoScreenShotView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [[UIApplication sharedApplication].windows[0].rootViewController.view addSubview:hideesp];
    hideesp.userInteractionEnabled=false;  

    NSString *documentsDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"Config.ini"];
    if(![fileManager fileExistsAtPath:filePath]){
        [fileManager createFileAtPath:filePath contents:[NSData data] attributes:nil];
    }
    config = ini_load((char*)filePath.UTF8String);

    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

    _device = MTLCreateSystemDefaultDevice();
    _commandQueue = [_device newCommandQueue];

    if (!self.device) abort();

    IMGUI_CHECKVERSION();
    ImGui::CreateContext();
    ImGuiIO& io = ImGui::GetIO(); (void)io;

    ImGui::StyleColorsLight();

    static const ImWchar ranges[] = { 0x0020, static_cast<ImWchar>(0x10FFFF), 0 };
    FontMenu = io.Fonts->AddFontFromMemoryTTF((void *) arial_data, arial_size , 22.5f, NULL, ranges);
    
    static const ImWchar icons_ranges[] = { 0xf000, 0xffff, 0 }; 
    ImFontConfig icons_config;      
    icons_config.MergeMode = true;

    io.Fonts->AddFontFromMemoryTTF(fa_solid_900_ttf, fa_solid_900_ttf_len, 17.5f, &icons_config, icons_ranges);
    
    ImGui_ImplMetal_Init(_device);

    return self;
}

- (MTKView *)mtkView
{
    return (MTKView *)self.view;
}

- (void)loadView
{
    CGFloat w = [UIApplication sharedApplication].windows[0].rootViewController.view.frame.size.width;
    CGFloat h = [UIApplication sharedApplication].windows[0].rootViewController.view.frame.size.height;
    self.view = [[MTKView alloc] initWithFrame:CGRectMake(0, 0, w, h)];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mtkView.device = self.device;
    self.mtkView.delegate = self;
    self.mtkView.clearColor = MTLClearColorMake(0, 0, 0, 0);
    self.mtkView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    self.mtkView.clipsToBounds = YES;
    self.canRunAgain = YES;
}



#pragma mark - Interaction

- (void)updateIOWithTouchEvent:(UIEvent *)event
{
    UITouch *anyTouch = event.allTouches.anyObject;
    CGPoint touchLocation = [anyTouch locationInView:self.view];
    ImGuiIO &io = ImGui::GetIO();
    io.MousePos = ImVec2(touchLocation.x, touchLocation.y);

    BOOL hasActiveTouch = NO;
    for (UITouch *touch in event.allTouches)
    {
        if (touch.phase != UITouchPhaseEnded && touch.phase != UITouchPhaseCancelled)
        {
            hasActiveTouch = YES;
            break;
        }
    }
    io.MouseDown[0] = hasActiveTouch;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self updateIOWithTouchEvent:event];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self updateIOWithTouchEvent:event];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self updateIOWithTouchEvent:event];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self updateIOWithTouchEvent:event];
}

#pragma mark - MTKViewDelegate

- (void)drawInMTKView:(MTKView*)view
{   
    switch(IsCheckAimbot){
        case 0:
            IsAimbot = NO;
            IsBulletTrack = NO;
            IsBulletTrack1 = NO;
        break;
        case 1:
            IsAimbot = YES;
            IsBulletTrack = NO;
            IsBulletTrack1 = NO;
        break;
        case 2:
            IsAimbot = NO;
            IsBulletTrack = YES;
            IsBulletTrack1 = NO;
        break;
        case 3:
            IsAimbot = NO;
            IsBulletTrack = NO;
            IsBulletTrack1 = YES;
        break;
    }

    if (HideHack) {
        [hideesp addSubview:view];
    } else {
        [[UIApplication sharedApplication].keyWindow addSubview:view];
    }
    if (MenDeal) {
        if (hideesp.userInteractionEnabled !=true) hideesp.userInteractionEnabled =true;
    } else {
        if (hideesp.userInteractionEnabled !=false) hideesp.userInteractionEnabled =false; 
    }

    ImGuiIO& io = ImGui::GetIO();
    io.DisplaySize.x = view.bounds.size.width;
    io.DisplaySize.y = view.bounds.size.height;
    
    
    CGFloat framebufferScale = view.window.screen.nativeScale ?: UIScreen.mainScreen.nativeScale;
    io.DisplayFramebufferScale = ImVec2(framebufferScale, framebufferScale);
    io.DeltaTime = 1 / float(view.preferredFramesPerSecond ?: 60);
    view.preferredFramesPerSecond = IsFPSDraw;
    
    id<MTLCommandBuffer> commandBuffer = [self.commandQueue commandBuffer];
        
    if (MenDeal == true) {
        [self.mtkView setUserInteractionEnabled:YES];
    } else if (MenDeal == false) {
        [self.mtkView setUserInteractionEnabled:NO];
    }

    MTLRenderPassDescriptor* renderPassDescriptor = view.currentRenderPassDescriptor;
    if (renderPassDescriptor != nil)
    {
        id <MTLRenderCommandEncoder> renderEncoder = [commandBuffer renderCommandEncoderWithDescriptor:renderPassDescriptor];
        [renderEncoder pushDebugGroup:@"ImGui Jane"];

            ImGui_ImplMetal_NewFrame(renderPassDescriptor);
            ImGui::NewFrame();
            
            ImFont* font = ImGui::GetFont();
            font->Scale = 14.0f / font->FontSize;

            RenderBannerNotification();  // Vẽ banner nếu đang có
            
            CGSize screenSize = [UIScreen mainScreen].bounds.size;

            ImGui::SetNextWindowSize(ImVec2(screenSize.width, screenSize.height));
            ImGui::SetNextWindowPos(ImVec2(0, 0));
            if (ImGui::Begin("alpha", nullptr, ImGuiWindowFlags_NoBackground | ImGuiWindowFlags_NoTitleBar | ImGuiWindowFlags_NoCollapse | ImGuiWindowFlags_NoResize | ImGuiWindowFlags_NoInputs | ImGuiWindowFlags_NoMove)) {
            GetActors(ImGui::GetBackgroundDrawList());
            }
            ImGui::End();



NSString *aliasKey = @"DRACULA PRO V5"; // <-- Chuỗi bạn muốn hiển thị
const char* ServerName = [aliasKey cStringUsingEncoding:NSUTF8StringEncoding];
std::string str = ServerName;

float fontSize = IsFontDraw * 1.5f; // Kích thước font
float totalWidth = 0.0f;

// Tính tổng chiều rộng để canh giữa
for (char c : str) {
    std::string s(1, c);
    totalWidth += FontMenu->CalcTextSizeA(fontSize, FLT_MAX, 0.0f, s.c_str()).x;
}

float startX = screenSize.width / 2 - totalWidth / 2;
float x = startX;
float y = 75;
float time = ImGui::GetTime(); // thời gian chạy

// Vẽ từng ký tự với hiệu ứng màu mượt
for (int i = 0; i < str.length(); ++i) {
    char c = str[i];
    std::string ch(1, c);

    // Hiệu ứng sóng màu
    float hue = fmodf((time * 0.3f + i * 0.1f), 1.0f);
    ImColor charColor = ImColor::HSV(hue, 1.0f, 1.0f);

    // Vẽ ký tự có viền
    DrawTextWithOutlineX(
        ImGui::GetBackgroundDrawList(),
        ImVec2(x, y),
        ch,
        fontSize,
        charColor,
        outlineColor,
        drawOutline,
        FontMenu
    );

    // Dịch sang ký tự tiếp theo
    x += FontMenu->CalcTextSizeA(fontSize, FLT_MAX, 0.0f, ch.c_str()).x;
}

            
            ImGuiIO& Io = ImGui::GetIO();
            //io.FontGlobalScale = 0.9f;
            ImGui::SetNextWindowPos(ImVec2(Io.DisplaySize.x * 0.5f, Io.DisplaySize.y * 0.5f), ImGuiCond_FirstUseEver, ImVec2(0.5f, 0.5f));
            ImGui::SetNextWindowSize({500, 300}, ImGuiCond_FirstUseEver);
            
            if (MenDeal == true)
            {            
                ImGui::Begin("DRACULA PRO V5", &MenDeal, ImGuiWindowFlags_NoCollapse | ImGuiWindowFlags_NoResize);
                ImVec2 windowSize = ImGui::GetContentRegionAvail();
                float leftColumnWidth = windowSize.x / 4;
                float rightColumnWidth = windowSize.x * 3 / 4 - 4.1;  
                //float windowHeight = ImGui::GetWindowSize().y;
                //float childHeight = windowHeight * 2.0f / 3.0f + 25.0f;
                ImGui::BeginChild("LeftColumn", ImVec2(leftColumnWidth, 0), true);
                int totalButtons = 7;  // Số lượng nút
float childHeight = ImGui::GetContentRegionAvail().y;
float spacing = ImGui::GetStyle().ItemSpacing.y;
float totalSpacing = spacing * (totalButtons - 1);  // Tổng khoảng cách giữa các nút
float buttonHeight = (childHeight - totalSpacing) / totalButtons;  // Chiều cao từng nút

float buttonWidth = ImGui::GetContentRegionAvail().x;

if (ImGui::Button(IsEnglish == 0 ? "\uf015 Home" : "\uf015 Trang Chủ", ImVec2(buttonWidth, buttonHeight))) {
    Tab = 0;
}
if (ImGui::Button(IsEnglish == 0 ? "\uf007 Player" : "\uf007 Người Chơi", ImVec2(buttonWidth, buttonHeight))) {
    Tab = 1;
}
if (ImGui::Button(IsEnglish == 0 ? "\uf0e8 Item" : "\uf0e8 Vật Phẩm", ImVec2(buttonWidth, buttonHeight))) {
    Tab = 2;
}
if (ImGui::Button("\uf05b Aimbot", ImVec2(buttonWidth, buttonHeight))) {
    Tab = 3;
}
if (ImGui::Button("\uf044 Mod", ImVec2(buttonWidth, buttonHeight))) {
    Tab = 4;
}
if (ImGui::Button("\uf538 Memory", ImVec2(buttonWidth, buttonHeight))) {
    Tab = 5;
}
if (ImGui::Button(IsEnglish == 0 ? "\uf013 Setting" : "\uf013 Cài Đặt", ImVec2(buttonWidth, buttonHeight))) {
    Tab = 6;
}
                ImGui::EndChild();
                ImGui::SameLine();
                bool test = false;
                float windowWidth = ImGui::GetContentRegionAvail().x;
                float checkboxWidth = windowWidth / 3.0f;
                ImGui::BeginChild("TabView", ImVec2(0, 0), true);
                if (Tab == 0) {
                  /* // APIClient *API = [[APIClient alloc] init];
                  char const *tenThietbi = [[APIKey getDeviceName] UTF8String];
                  char const *ios = [[APIKey getiOSVersion] UTF8String];
                  char const *jailbreak = [[APIKey getJailbreakStatus] UTF8String];
                  char const *udid = [[APIKey getUDID] UTF8String];
                  char const *AppVersion = [[APIKey getAppVersion] UTF8String];
                  char const *AppName = [[APIKey getAppName] UTF8String];
                  char const *AppBundle = [[APIKey getAppBundle] UTF8String];
                  ImGui::Text(IsEnglish == 0 ? "Device: %s" : "Thiết Bị: %s", tenThietbi);
                  ImGui::Text("iOS: %s", ios);
                  ImGui::Text(IsEnglish == 0 ? "Status: %s" : "Trạng Thái: %s", jailbreak);
                  ImGui::Text("UDID: %s", udid);
                  ImGui::Text(IsEnglish == 0 ? "App Name: %s" : "Tên Ứng Dụng: %s", AppName);
                  ImGui::Text(IsEnglish == 0 ? "App Version: %s" : "Phiên Bản Ứng Dụng: %s", AppVersion);
                  ImGui::Text(IsEnglish == 0 ? "App Bundle: %s" : "Bundle Ứng Dụng: %s", AppBundle);*/
                }
                if (Tab == 1) {
                    ImGui::Checkbox(IsEnglish == 0 ? "Number Enemy" : "Số Địch", &IsNumberPlayer);
                    ImGui::SameLine(checkboxWidth);
                    ImGui::Checkbox(IsEnglish == 0 ? "Bone" : "Xương", &IsBone);
                    ImGui::SameLine(checkboxWidth * 2);
                    ImGui::Checkbox(IsEnglish == 0 ? "Box" : "Hộp", &IsBox);
                    ImGui::Checkbox(IsEnglish == 0 ? "Line" : "Đường Kẻ", &IsLine);
                    ImGui::SameLine(checkboxWidth);
                    ImGui::Checkbox(IsEnglish == 0 ? "Health" : "Máu", &IsHealth);
                    ImGui::SameLine(checkboxWidth * 2);
                    ImGui::Checkbox(IsEnglish == 0 ? "Name" : "Tên", &IsName);
                    ImGui::Checkbox(IsEnglish == 0 ? "Team" : "Đội", &IsTeam);
                    ImGui::SameLine(checkboxWidth);
                    ImGui::Checkbox(IsEnglish == 0 ? "Distance" : "Khoảng Cách", &IsDistance);
                    ImGui::SameLine(checkboxWidth * 2);
                    ImGui::Checkbox(IsEnglish == 0 ? "Weapon" : "Vũ Khí", &IsWeapon);
                    ImGui::Checkbox(IsEnglish == 0 ? "Nation" : "Quốc Gia", &IsNation);
                    ImGui::SameLine(checkboxWidth);
                    ImGui::Checkbox(IsEnglish == 0 ? "UID" : "UID", &IsUID);
                    ImGui::SameLine(checkboxWidth * 2);
                    ImGui::Checkbox(IsEnglish == 0 ? "Ignore Bot" : "Bỏ Qua Bot", &屏蔽人机);
                    if (IsAlert360) {
                        ImGui::Checkbox("##456", &IsAlert360);
                        ImGui::SameLine();
                        ImGui::SliderFloat(IsEnglish == 0 ? "Warning 360" : "Cảnh Báo 360", &radiusalert, 0.0f, screenSize.height / 2, "%.0f");
                    } else {
                        ImGui::Checkbox(IsEnglish == 0 ? "Warning 360" : "Cảnh Báo 360", &IsAlert360);
                    }
                    ImGui::Separator();
                    ImGui::Combo(IsEnglish == 0 ? "Style ESP" : "Phong Cách ESP", &IsStyle, IsEnglish == 0 ? "iOS\0VN Hax\0" : "iOS\0VN Hax\0");
                    ImGui::Separator();
                    ImGui::SliderFloat(IsEnglish == 0 ? "Distance " : "Khoảng Cách ", &IsDistancePlayer, 0.0f, 750.0f, "%.0fM");
                    ImGui::Separator();
                    ImGui::SliderFloat(IsEnglish == 0 ? "Thickness Bone" : "Độ Dày Xương", &IsThicknessBone, 1.0f, 5.0f, "%.1f");
                    ImGui::SliderFloat(IsEnglish == 0 ? "Thickness Line" : "Độ Dày Đường Kẻ", &IsThicknessLine, 1.0f, 5.0f, "%.1f");
                    ImGui::Separator();
                    ImGui::Text(IsEnglish == 0 ? "Color Bone:" : "Màu Xương:");
                    ImGui::SameLine(checkboxWidth);
                    ImGui::ColorEdit3(IsEnglish == 0 ? "Visible" : "Nhìn Thấy", (float*)&ColorBoneVisible, ImGuiColorEditFlags_NoInputs);
                    ImGui::SameLine(checkboxWidth * 2);
                    ImGui::ColorEdit3(IsEnglish == 0 ? "Invisible" : "Bị Khuất", (float*)&ColorBoneInvisible, ImGuiColorEditFlags_NoInputs);
                    ImGui::Text(IsEnglish == 0 ? "Color Line:" : "Màu Đường Kẻ:");
                    ImGui::SameLine(checkboxWidth);
                    ImGui::ColorEdit3(IsEnglish == 0 ? "Visible " : "Nhìn Thấy ", (float*)&ColorLineVisible, ImGuiColorEditFlags_NoInputs);
                    ImGui::SameLine(checkboxWidth * 2);
                    ImGui::ColorEdit3(IsEnglish == 0 ? "Invisible " : "Bị Khuất ", (float*)&ColorLineInvisible, ImGuiColorEditFlags_NoInputs);
                    ImGui::Text(IsEnglish == 0 ? "Color Box:" : "Màu Hộp:");
                    ImGui::SameLine(checkboxWidth);
                    ImGui::ColorEdit3(IsEnglish == 0 ? "Visible  " : "Nhìn Thấy  ", (float*)&ColorBoxVisible, ImGuiColorEditFlags_NoInputs);
                    ImGui::SameLine(checkboxWidth * 2);
                    ImGui::ColorEdit3(IsEnglish == 0 ? "Invisible  " : "Bị Khuất  ", (float*)&ColorBoxInvisible, ImGuiColorEditFlags_NoInputs);
                }
                if (Tab == 2) {
                    ImGui::Checkbox(IsEnglish == 0 ? "Warning Bom" : "Cảnh Báo Bom", &IsWarningBom);
                    ImGui::SameLine(checkboxWidth);
                    ImGui::Checkbox("AR", &IsAR);
                    ImGui::SameLine(checkboxWidth * 2);
                    ImGui::Checkbox("SMG", &IsSMG);
                    ImGui::Checkbox("SR", &IsSR);
                    ImGui::SameLine(checkboxWidth);
                    ImGui::Checkbox("ShotGun", &IsShotGun);
                    ImGui::SameLine(checkboxWidth * 2);
                    ImGui::Checkbox("Bom", &IsBom);
                    ImGui::Checkbox(IsEnglish == 0 ? "Bullet" : "Đạn", &IsBullet);
                    ImGui::SameLine(checkboxWidth);
                    ImGui::Checkbox(IsEnglish == 0 ? "Recovery" : "Hồi Phục", &IsRecovery);
                    ImGui::SameLine(checkboxWidth * 2);
                    ImGui::Checkbox(IsEnglish == 0 ? "Vehicle" : "Phương Tiện", &IsVehicle);
                    ImGui::Checkbox(IsEnglish == 0 ? "Scope" : "Ống Ngắm", &IsScope);
                    ImGui::SameLine(checkboxWidth);
                    ImGui::Checkbox(IsEnglish == 0 ? "Dead Box" : "Hòm Xác", &IsDeadBox);
                    ImGui::SameLine(checkboxWidth * 2);
                    ImGui::Checkbox(IsEnglish == 0 ? "Air Drop" : "Hòm Thính", &IsAirDrop);
                    ImGui::Checkbox(IsEnglish == 0 ? "Armor & Helmet & Bag" : "Giáp & Mũ & Balo", &IsArmor);
                }
                if (Tab == 3) {
                    ImGui::RadioButton(IsEnglish == 0 ? "Off" : "Tắt", &IsCheckAimbot, 0);
                    ImGui::SameLine(checkboxWidth);
                    ImGui::RadioButton("Aimbot", &IsCheckAimbot, 1);
                    ImGui::Checkbox("Fov", &IsFov);
                    ImGui::SameLine(checkboxWidth);
                    ImGui::Checkbox(IsEnglish == 0 ? "Line" : "Đường Kẻ", &IsLineAimbot);
                    ImGui::SameLine(checkboxWidth * 2);
                    ImGui::Checkbox(IsEnglish == 0 ? "Ignore Knock" : "Bỏ Qua Gục", &IsIgnoreKnock);
                    ImGui::Checkbox(IsEnglish == 0 ? "Ignore Bot" : "Bỏ Qua Bot", &boquabots);
                    ImGui::SliderFloat(IsEnglish == 0 ? "Radius" : "Bán Kính", &IsRadius, 0.0f, screenSize.height / 2, "%.0f");
                    ImGui::SliderFloat(IsEnglish == 0 ? "Speed" : "Tốc Độ", &IsSpeed, 0.0f, 1.0f, "%.1f");
                    ImGui::SliderFloat(IsEnglish == 0 ? "Less Recoil" : "Giảm Giật", &IsRecoil, 0.0f, 5.0f, "%.1f");
                    ImGui::SliderFloat(IsEnglish == 0 ? "Distance" : "Khoảng Cách", &IsDistanceAimbot, 0.0f, 500.0f, "%.0fM");
                    ImGui::Combo(IsEnglish == 0 ? "Mode" : "Chế Độ", &IsMode, IsEnglish == 0 ? "Auto\0Fire\0Scope\0Fire & Scope\0Lock\0" : "Tự Động\0Bắn\0Ống Ngắm\0Bắn & Ống Ngắm\0Khóa\0");
                    ImGui::Combo(IsEnglish == 0 ? "Part" : "Vị Trí", &IsPart, IsEnglish == 0 ? "Random\0Head\0Body\0" : "Ngẫu Nhiên\0Đầu\0Thân\0");
                    
                }
                if (Tab == 4) {
                    ImGui::Checkbox("Skin", &ModSkinn);
                            ImGui::SameLine(checkboxWidth);
                            ImGui::Checkbox(IsEnglish == 0 ? "Kill Message" : "Thông Báo Diệt", &initkillmsgopen);
                            ImGui::SameLine(checkboxWidth * 2);
                            ImGui::Checkbox(IsEnglish == 0 ? "Dead Box" : "Hòm Xác", &DeadBox);
                            ImGui::Checkbox(IsEnglish == 0 ? "Skin Lobby" : "Skin Sảnh", &skinlobby);

                            ImGui::Separator();
                            ImVec2 childSize = ImGui::GetWindowSize();
                            float buttonWidth = (childSize.x - ImGui::GetStyle().ItemSpacing.x * 2) / 3.0f - 3.0f;
                            if(ImGui::Button(IsEnglish == 0 ? "Player" : "Nhân Vật", ImVec2(buttonWidth, 0)))
                                Settings::Tab = 0;
                            ImGui::SameLine();
                            if(ImGui::Button(IsEnglish == 0 ? "Weapon" : "Vũ Khí", ImVec2(buttonWidth, 0)))
                                Settings::Tab = 1;
                            ImGui::SameLine();
                            if(ImGui::Button(IsEnglish == 0 ? "Vehicle" : "Phương Tiện", ImVec2(buttonWidth, 0)))
                                Settings::Tab = 2;
                            ImGui::Separator();
                            if (ModSkinn||initkillmsgopen||DeadBox||skinlobby||BagGun){
                                ImGui::BeginChild("ScrollableTabContent", ImVec2(0, 0), true, ImGuiWindowFlags_AlwaysVerticalScrollbar);
                             //   ImGui::BeginChild("HiHiView", ImVec2(0, 0), true);
                                if (Settings::Tab == 0) {
                                    // Checkbox và Combo cho Trang Phục
ImGui::Checkbox("##Trang Phục", &preferences.Outfit);
ImGui::SameLine();
ImGui::Combo(IsEnglish == 0 ? "Outfit" : "Trang Phục", &preferences.Config.Skin.XSuits, IsEnglish == 0 ? "Default\0Golden Pharaoh X-Suit\0Thánh Giáp Huyết Nha\0Blood Raven X-Suit\0Avalanche X-Suit\0Silvanus X-Suit\0Iridescence X-Suit\0Arcane Jester X-Suit\0Stygian Liege X-Suit\0Marmoris X-Suit\0Fiore X-Suit\0Galadria X-Suit\0Ignis X-Suit\0Thánh Giáp Anukhra\0Mummy\0Psychophage\0Inferno Fiend\0Fireman\0Polar Spectrophage\0" : "Mặc Định\0Thánh Giáp Pharaoh Vàng\0Thánh Giáp Huyết Nha\0Thánh Giáp Poseidon\0Thánh Giáp Băng Giá\0Thánh Giáp Tinh Linh\0Thánh Giáp Cleopatra Vàng\0Thánh Giáp Chúa Hề Bí Ẩn\0Thánh Giáp Huyết Thần Tai Ương\0Thánh Giáp Thần Nữ Thủy Vực\0Thánh Giáp Hoa Linh Vĩnh Cửu\0Thánh Giáp Phong Linh Thiên Nữ\0Thánh Giáp Hỏa Linh Chí Tôn\0Thánh Giáp Anukhra\0Xác Ướp Y Tá\0Linh Hồn Xác Ướp\0Hỏa Thần Cổ Ngữ\0Cứu Hỏa\0Băng Thần\0");

// Checkbox và Combo cho Balo
ImGui::Checkbox("##Balo", &preferences.Bagg);
ImGui::SameLine();
ImGui::Combo(IsEnglish == 0 ? "Bag" : "Balo", &preferences.bag, 
    IsEnglish == 0 ? "Default\0Pharaoh\0Blood Raven\0Count\0Butterfly Wings\0" : "Mặc Định\0Pharaoh\0Huyết Nha\0Bá Tước\0Cánh Bướm\0");

// Checkbox và Combo cho Mũ
ImGui::Checkbox("##Mũ", &preferences.Helmett);
ImGui::SameLine();
ImGui::Combo(IsEnglish == 0 ? "Helmet" : "Mũ", &preferences.helmet, 
    IsEnglish == 0 ? "Default\0Inferno Rider\0Masked Psychic\0" : "Mặc Định\0Kỵ Sĩ Hỏa Ngục\0Cương Thi\0");

// Checkbox và Combo cho Dù
ImGui::Checkbox("##Dù", &preferences.Parachute);
ImGui::SameLine();
ImGui::Combo(IsEnglish == 0 ? "Parachute" : "Dù", &preferences.Config.Skin.Parachute, 
    IsEnglish == 0 ? "Default\0Pharaoh's Scarab\0Enigmatic Nomad\0" : "Mặc Định\0Bùa Hộ Mệnh Pharaoh\0Công Chúa Bộ Lạc\0");
ImGui::Checkbox("##taydammm", &preferences.Gloves);
ImGui::SameLine();
ImGui::Combo(IsEnglish == 0 ? "Gloves" : "Găng Tay", &preferences.Config.Skin.Gloves, 
    IsEnglish == 0 ? "Default\0Icy\0Ink Mist\Quicksand\0" : "Mặc Định\0Băng\0Mực\0Cát Lún\0");
                                }
                                
                                if (Settings::Tab == 1) {
                                    ImGui::Checkbox("##M416", &preferences.M416);
ImGui::SameLine();
ImGui::Combo("M416", &preferences.Config.Skin.M416, IsEnglish == 0 ? "Default\0Glacier\0The Fool\0Wanderer\0Lizard Roar\0Call Of The Wild\0TechnoCore\0Imperial Splendor\0Silver Guru\0Tidal Embrace\0Shinobi Kami\0Sealed Nether\0Roaring Immolation\0" : "Mặc Định\0Băng Giá\0Chú Hề\0Kẻ Lang Thang\0Bò Sát Gầm Gừ\0Tiếng Gọi Hoang Dã\0Lõi Công Nghệ\0Hoàng Gia Lộng Lẫy\0Bạch Lân Nhả Ngọc\0Thủy Triều Dậy Sóng\0Ma Ảnh\0Phong Ấn U Minh\0Lam Sư Đoạt Mệnh\0");

ImGui::Checkbox("##AKM", &preferences.AKM);
ImGui::SameLine();
ImGui::Combo("AKM", &preferences.Config.Skin.AKM, IsEnglish == 0 ? "Default\0Starsea Admiral\0Desert Fossil\0Jack-o'-lantern\0Ghillie Dragon\0Gold Pirate\0Codebreaker\0Wandering Tyrant\0Bunny Munchkin\0Glacier \0Decisive Day\0Lightshift Temple (Divine Moon)\0Lightshift Temple (Gold Feather)\0Hellfire\0Roaring Tiger\0Sandspring Dominion\0" : "Mặc Định\0Đô Đốc Hải Long Tinh\0Hóa Thạch\0Bí Ngô Kinh Dị\0Long Vương\0Hải Tặc Vàng\0Người Giải Mã\0Bạo Chúa Bộ Lạc\0Thỏ Tinh Nghịch\0Băng Giá \0Ngày Phán Quyết\0Thánh Quang (Trăng Thần)\0Thánh Quang (Lông Vũ Hoàng Kim)\0Hỏa Ngục\0Hổ Gầm Gừ\0Thời Quang Khả Biến\0");

ImGui::Checkbox("##SCAR-L", &preferences.SCARL);
ImGui::SameLine();
ImGui::Combo("SCAR-L", &preferences.Config.Skin.Scar, IsEnglish == 0 ? "Default\0Bloodstained Nemesis\0Enchanted Pumpkin\0Operation Tomorrow\0Hextech Crystal\0Thorn Of Malice\0Folly's Clasp\0Serene Lumina\0Drop The Bass\0Radiant Citadel\0" : "Mặc Định\0Ma Vương Huyết Hồn\0Bí Ngô Ma Quái\0Chiến Dịch Vì Ngày Mai\0Tinh Thể Hextech\0Gai Tà Ác\0Cái Ôm Của Chú Hề\0Thánh Nữ Huyền Ảo\0Drop Da Bass\0Ánh Sáng Hoàng Tộc\0");

ImGui::Checkbox("##M762", &preferences.M762);
ImGui::SameLine();
ImGui::Combo("M762", &preferences.Config.Skin.M762, IsEnglish == 0 ? "Default\0Stray Rebellion\0Concerto Of Love\0Deadly Precision\08-Bit Unicorn\0Starcore\0Messi Football Icon\0Noctum Sunder\0Luminous Muse\0GACKT MOONSAGA\0Skeletal Carver\0Platinum Skeleton\0Soulspecter Shredder\0" : "Mặc Định\0Vị Khách Nổi Loạn\0Bản Nhạc Tình Yêu\0Phát Bắn Chí Mạng\0Pony Bé Nhỏ\0Lõi Sao Huyền Ảo\0Biểu Tượng Bóng Đá Messi\0Huyết Rồng\0Tiên Linh Lưu Ly\0GACKT MOONSAGA\0Bạch Cốt U Minh\0Khung Xương\0Cổ Vật Hắc Ám\0");
                                    ImGui::Checkbox("##Groza", &preferences.GROZA);
ImGui::SameLine();
ImGui::Combo("Groza", &preferences.Config.Skin.Groza, IsEnglish == 0 ? "Default\0River Styx\0Eventide Aria\0Forest Raider\0Splendid Battle\0Ryomen Sukuna\0Pumpkin Carol\0Burning Godzilla\0" : "Mặc Định\0Lửa U Minh\0Đêm Huyền Ảo\0Kỵ Binh Rừng Sâu\0Trận Chiến Sắc Màu\0Ryomen Sukuna\0Lồng Đèn Bí Ngô\0Godzilla Bốc Lửa\0");

ImGui::Checkbox("##FAMAS", &preferences.FAMAS);
ImGui::SameLine();
ImGui::Combo("FAMAS", &preferences.Config.Skin.Famas, IsEnglish == 0 ? "Default\0Origin Lumen\0" : "Mặc Định\0Đế Vương Thần Vực\0");

ImGui::Checkbox("##AUG", &preferences.AUG);
ImGui::SameLine();
ImGui::Combo("AUG", &preferences.Config.Skin.AUG, IsEnglish == 0 ? "Default\0Forsaken Glace\0Evangelion 4th Angel\0Wandering Circus\0Abyssal Howl\0Deep Sea Terror\0Nyxen Rose\0" : "Mặc Định\0Tinh Linh Băng Giá\0Evangelion Angel Thứ 4\0Gánh Xiếc Rong\0Hỏa Ca\0Ác Mộng Biển Sâu\0Hoa Hồng Ma Mị\0");

ImGui::Checkbox("##QBZ", &preferences.QBZ);
ImGui::SameLine();
ImGui::Combo("QBZ", &preferences.Config.Skin.QBZ, IsEnglish == 0 ? "Default\0Fatal Foil\0Nether Phantom\0Fatal Strike\0Dazzling Sun\0" : "Mặc Định\0Hoa Kiếm Chí Mạng\0Công Chúa Hắc Ám\0Càn Quét\0Ánh Dương\0");

ImGui::Checkbox("##Honey", &preferences.Honey);
ImGui::SameLine();
ImGui::Combo("Honey", &preferences.Config.Skin.Honey, IsEnglish == 0 ? "Default\0Vivid Glare\0" : "Mặc Định\0Sắc Màu Huyền Ảo\0");

ImGui::Checkbox("##M16A4", &preferences.M16);
ImGui::SameLine();
ImGui::Combo("M16A4", &preferences.Config.Skin.M16A4, IsEnglish == 0 ? "Default\0Blood & Bones\0Aurora Pulse\0Radiant Edge\0Skeletal Core\0Dracoguard\0" : "Mặc Định\0Cơn Bão Xương Máu\0Xung Mạch Cực Quang\0Lưỡi Đao Sắc Màu\0Lõi Skeletal\0Hộ Vệ Rồng\0");

ImGui::Checkbox("##ACE32", &preferences.ACE32);
ImGui::SameLine();
ImGui::Combo("ACE32", &preferences.Config.Skin.ACE32, IsEnglish == 0 ? "Default\0Beam Blast\0Icicle Spike\0Mystic Kraken\0" : "Mặc Định\0Kamehameha\0Ngọc Bích\0Thủy Quái\0");

ImGui::Checkbox("##Kar98K", &preferences.KAR98);
ImGui::SameLine();
ImGui::Combo("Kar98K", &preferences.Config.Skin.K98, IsEnglish == 0 ? "Default\0Violet Volt\0Kukulkan Fury\0Moonlit Grace\0Titanium Shark\0Nebula Hunter\0Terror Fang\0Thornmaker\0Kitty Kadence\0" : "Mặc Định\0Điện Cực Tím\0Kukulkan Cuồng Nộ\0Ánh Trăng\0Cá Mập Titan\0Thợ Săn Tinh Vân\0Dấu Nanh Phẫn Nộ\0Hồng Hỏa Diệm\0Nhịp Điệu Mèo Con\0");

ImGui::Checkbox("##M24", &preferences.M24);
ImGui::SameLine();
ImGui::Combo("M24", &preferences.Config.Skin.M24, IsEnglish == 0 ? "Default\0Cadence Maestro\0Pharaoh's Might\0Lady Butterfly\0Circle Of Life\0Voidwave Trigger\0" : "Mặc Định\0Nhịp Điệu Hoàn Mỹ\0Quyền Trượng Pharaoh\0Hồ Điệp Phu Nhân\0Tuần Hoàn Sự Sống\0Minh Nguyệt Cấm Vực\0");

ImGui::Checkbox("##AWM", &preferences.AWM);
ImGui::SameLine();
ImGui::Combo("AWM", &preferences.Config.Skin.AWM, IsEnglish == 0 ? "Default\0Serpengleam\0Mauve Avenger\0Godzilla\0Rainbow Drake\0Flamewave\0Valor's Requiem\0" : "Mặc Định\0Thanh Hoa Xà\0Neon\0Godzilla\0Đại Long Cầu Vồng\0Hỏa Phượng Hoàng\0Huyết Hải Thiên Long\0");

ImGui::Checkbox("##AMR", &preferences.AMR);
ImGui::SameLine();
ImGui::Combo("AMR", &preferences.Config.Skin.AMR, IsEnglish == 0 ? "Default\0Scorching Blessing\0Crimson Ephialtes\0Silent Departed\0" : "Mặc Định\0Hỏa Thần\0Khủng Long Ephialtes\0Vô Âm Ly Biệt\0");

ImGui::Checkbox("##MK14", &preferences.MK14);
ImGui::SameLine();
ImGui::Combo("MK14", &preferences.Config.Skin.MK14, IsEnglish == 0 ? "Default\0Drakreign\0Gilded Galaxy\0" : "Mặc Định\0Vương Quốc Rồng\0Sức Mạnh Ngân Hà\0");

ImGui::Checkbox("##Mini14", &preferences.MINI14);
ImGui::SameLine();
ImGui::Combo("Mini14", &preferences.Config.Skin.MINI14, IsEnglish == 0 ? "Default\0Icicle\0Fortune Cat\0" : "Mặc Định\0Sông Băng\0Mèo Chiêu Tài\0");

ImGui::Checkbox("##DP-28", &preferences.DP28);
ImGui::SameLine();
ImGui::Combo("DP-28", &preferences.Config.Skin.DP28, IsEnglish == 0 ? "Default\0Gilded Jade Dragon\0Enigmatic Hunter\0Nautical Warrior\0Shenron\0Bloodbane Parasite\0" : "Mặc Định\0Ngọc Long\0Sát Thủ Bí Ẩn\0Chiến Binh Hàng Hải\0Rồng Thần Shenron\0Huyết Họa\0");

ImGui::Checkbox("##MG3", &preferences.MG3);
ImGui::SameLine();
ImGui::Combo("MG3", &preferences.Config.Skin.MG3, IsEnglish == 0 ? "Default\0Sky Huntress\0Soaring Dragon\0" : "Mặc Định\0Chiến Thần Bầu Trời\0Thiên Khung\0");

ImGui::Checkbox("##M249", &preferences.M249);
ImGui::SameLine();
ImGui::Combo("M249", &preferences.Config.Skin.M249, IsEnglish == 0 ? "Default\0Moondrop Eterna\0Stargaze Fury\0Party Parcel\0Winter Queen\0Malus Majesty\0" : "Mặc Định\0Nữ Đế Ánh Sáng\0Stargaze Fury\0Pháo Giáng Sinh\0Nữ Hoàng Băng Giá\0Vương Quyền Hắc Ám\0");

ImGui::Checkbox("##UZI", &preferences.UZI);
ImGui::SameLine();
ImGui::Combo("UZI", &preferences.Config.Skin.UZI, IsEnglish == 0 ? "Default\0Juicer\0Ethereal Emblem\0Romantic Moments\0Shimmer Power\0Mystech\0Savagery\0Chained Inferno\0" : "Mặc Định\0Máy Ép Trái Cây\0Vật Tổ Thần Bí\0Khoảnh Khắc Bất Ngờ\0Quang Hóa\0Ma Pháp\0Savagery\0Xiềng Xích Hỏa Ngục\0");

ImGui::Checkbox("##UMP45", &preferences.UMP);
ImGui::SameLine();
ImGui::Combo("UMP45", &preferences.Config.Skin.UMP, IsEnglish == 0 ? "Default\0Cryofrost Shard  \0Outlawed Fantasy\08-Bit Blast\0Rainbow Stinger\0Marine Evolution\0Carnival Waves\0Dragonfire\0Anniversary\0Void Souleater\0" : "Mặc Định\0Băng Giá  \0Ảo Mộng Chết Chóc\0Cuộc Chiến 8-Bit\0Ong Bắp Cày\0Biển Tiến Hóa\0Con Sóng Lễ Hội\0Hỏa Long\0Sinh Nhật\0Thần Khí Anukhra\0");

ImGui::Checkbox("##Thompson", &preferences.TOMMY);
ImGui::SameLine();
ImGui::Combo("Thompson", &preferences.Config.Skin.Thompson, IsEnglish == 0 ? "Default\0Candy Cane\0Steampunk\0" : "Mặc Định\0Kẹo Ngọt\0Máy Chạy Hơi Nước\0");

ImGui::Checkbox("##P90", &preferences.P90);
ImGui::SameLine();
ImGui::Combo("P90", &preferences.Config.Skin.P90, IsEnglish == 0 ? "Default\0Devious Cybercat\0" : "Mặc Định\0Miêu Nữ Công Nghệ\0");

ImGui::Checkbox("##Vector", &preferences.VECTOR);
ImGui::SameLine();
ImGui::Combo("Vector", &preferences.Config.Skin.Vector, IsEnglish == 0 ? "Default\0Mecha Drake\0Midnight Rose\0Gilded Reaper\0Blood Tooth\0" : "Mặc Định\0Cánh Rồng\0Hoa Hồng Đêm\0Lưỡi Liềm Vàng\0Nanh Dơi Huyết Tộc\0");

ImGui::Checkbox("##Bizon", &preferences.BIZON);
ImGui::SameLine();
ImGui::Combo("Bizon", &preferences.Config.Skin.Bizon, IsEnglish == 0 ? "Default\0Blazing Chameleon\0Skullcrusher\0Soldier Soul\0Spectral Byte\0" : "Mặc Định\0Tắc Kè\0Skullcrusher\0Thần Binh Võ Thuật\0Quang Ảo Điện Tử\0");

ImGui::Checkbox("##S1897", &preferences.S1897);
ImGui::SameLine();
ImGui::Combo("S1897", &preferences.Config.Skin.S1897, IsEnglish == 0 ? "Default\0Twilight Hunt\0" : "Mặc Định\0Chạng Vạng\0");

ImGui::Checkbox("##DBS", &preferences.DBS);
ImGui::SameLine();
ImGui::Combo("DBS", &preferences.Config.Skin.DBS, IsEnglish == 0 ? "Default\0Cosmic Beast\0Panthera Prime\0Sandsinger\0" : "Mặc Định\0Chiến Giáp Quái Thú\0Báo Sắc Màu\0Thuyền Sa Mạc\0");

ImGui::Checkbox("##S12K", &preferences.S12K);
ImGui::SameLine();
ImGui::Combo("S12K", &preferences.Config.Skin.S12K, IsEnglish == 0 ? "Default\0Atomic Trigger\0GACKT\0" : "Mặc Định\0Kích Hoạt Nguyên Tử\0GACKT\0");

ImGui::Checkbox("##Dao", &preferences.Machete);
ImGui::SameLine();
ImGui::Combo(IsEnglish == 0 ? "Machete" : "Rựa", &preferences.Config.Skin.Machete, IsEnglish == 0 ? "Default\0Ki Sword\0SPY×FAMILY Yor Stilettos\0" : "Mặc Định\0Ki Sword\0Đoản Kiếm Yor SPY×FAMILY\0");

ImGui::Checkbox("##Chảo", &preferences.PAN);
ImGui::SameLine();
ImGui::Combo(IsEnglish == 0 ? "Pan" : "Chảo", &preferences.Config.Skin.Pan, IsEnglish == 0 ? "Default\0Honeypot\0Night Of Rock\0Crocodile\0Accolade\0Break Pad\0Chicken Hot\0Faerie Luster\0Wintertime     \0" : "Mặc Định\0Hũ Mật Ong\0Đêm Nhạc Rock\0Cá Sấu\0Vinh Quang\0Chảo Điện Nguyên Tử\0Gà Rán\0Yokai Huyền Bí\0Băng Giá     \0");

                                }
                                
                                if (Settings::Tab == 2) {
                                        ImGui::Checkbox("##Dacia", &preferences.Dacia);
ImGui::SameLine();
ImGui::Combo("Dacia", &preferences.Config.Skin.Dacia,
    "Mặc Định\0Bentley Flying Spur Mulliner (Dòng Chảy Vịnh Hẹp)\0Bentley Flying Spur Mulliner (Tinh Vân Xanh)\0Ghost Galaxy\0Ghost Tím\0Ghost Hồng\0Lamborghini Estoque Metal Grey\0Lamborghini Estoque Oro\0Koenigsegg Gemera (Bình Minh)\0Koenigsegg Gemera (Cầu Vồng)\0Koenigsegg Gemera (Xám Bạc)\0Tesla Roadster (Kim Cương)\0Tesla Roadster (Xanh Biển Cả)\0Tesla Roadster (Pha Lê Tím)\0Dodge Charger SRT Hellcat Jailbreak - Violet Venom\0Dodge Charger SRT Hellcat - Tuscan Torque\0Dodge Charger SRT Hellcat - Fuchsia\0VW Käfer 1200L (Sinh Vật)\0VW Käfer 1200L (Vàng)\0Thánh Nữ Huyền Ảo\0Lâu Đài\0Bí Đỏ\0Cá Mập\0Bạch Kim\0R.P.D\0");

ImGui::Checkbox("##Coupe", &preferences.CoupeRB);
ImGui::SameLine();
ImGui::Combo("Coupe", &preferences.Config.Skin.CoupeRP,
    "Mặc Định\0Lamborghini Aventador SVJ Blue\0Bugatti La Voiture Noire (Tinh Vân)\0Warp Dawn\0Koenigsegg Jesko (Bình Minh)\0McLaren 570S (Đen)\0McLaren 570S (Trắng)\0Aston Martin Valkyrie (Racing Green)\0Aston Martin Valkyrie (Luminous Diamond)\0McLaren 570S (Hồng)\0McLaren 570S (Vàng Trắng)\0McLaren 570S (Vàng Đen)\0McLaren 570S (Ánh Kim)\0Koenigsegg Jesko (Xám Bạc)\0Koenigsegg Jesko (Cầu Vồng)\0Lamborghini Aventador SVJ Verde Alceo\0Lamborghini Centenario Galassia\0Lamborghini Centenario Carbon Fiber\0Koenigsegg One:1 Gilt\0Koenigsegg One:1 Cyber Nebula\0Koenigsegg One:1 Jade\0Koenigsegg One:1 Phoenix\0Warp Green\0Warp Universe\0Dodge Challenger SRT Hellcat - Blaze\0Dodge Challenger SRT Hellcat - Lime\0Maserati MC20 Bianco Audace\0Maserati MC20 Rosso Vincente\0Maserati MC20 Sogni\0Bugatti Veyron 16.4 (Sắc Màu)\0Bugatti Veyron 16.4 (Vàng)\0Bugatti Veyron 16.4\0Bugatti La Voiture Noire\0Bugatti La Voiture Noire (Hợp Kim)\0Bugatti La Voiture Noire (Chiến Binh)\0Dodge Challenger SRT Hellcat Jailbreak - Hellfire\0Pagani Zonda R (Tricolore Carbon)\0Pagani Zonda R (Bianco Benny)\0Pagani Zonda R (Melodic Midnight)\0Pagani Imola (Grigio Montecarlo)\0Pagani Imola (Crystal Clear Carbon)\0Pagani Imola (Nebula Dream)\0Pagani Imola (Arctic Aegis)\0Bentley Batur (Tận Cùng Thời Gian)\0Bentley Betayga Azure (Vương Quốc Huyền Ảo)\0");

ImGui::Checkbox("##UAZ", &preferences.UAZ);
ImGui::SameLine();
ImGui::Combo("UAZ", &preferences.Config.Skin.UAZ,
    "Mặc Định\0Bentley Betayga Azure (Đêm Yên Tĩnh)\0Bentley Betayga Azure (Mưa Hoa)\0Aston Martin DBX707 (Quasar Blue)\0Aston Martin DBX707 (Neon Purple)\0Maserati Levante Firmamento\0Maserati Levante Neon Urbano\0Maserati Luce Arancione\0Maserati Levante Blu Emozione\0Robust Universe\0Robust Night City\0Maserati Levante Firmamento\0Lamborghini Urus Giallo Inti\0Lamborghini Urus Pink\0BAPE X PUBGM CAMO\0Smooth Hitman\0Bí Ngô Ma Quái\0Siêu Thú Godzilla\0Băng Giá   \0");

ImGui::Checkbox("##Xe Máy", &preferences.Moto);
ImGui::SameLine();
ImGui::Combo(IsEnglish == 0 ? "Moto" : "Xe Máy", &preferences.Config.Skin.Moto,
    "Mặc Định\0DUCATI Panigale V4S\0Ducati Panigale V4S Black Phantom\0Ducati Panigale V4S Crimson Storm\0Bóng Ma\0LINE FRIENDS Lovey Dovey\0Ducati Panigale V4S Swift Mirage\0Hổ Gầm Gừ\0Khung Xương\0");

ImGui::Checkbox("##Xe Quái Vật", &preferences.BigFoot);
ImGui::SameLine();
ImGui::Combo(IsEnglish == 0 ? "Monter Truck" : "Xe Quái Vật", &preferences.Config.Skin.Bigfoot,
    "Mặc Định\0Ma Quái\0Hải Quái Phẫn Nộ\0");

ImGui::Checkbox("##Mirado", &preferences.Mirado);
ImGui::SameLine();
ImGui::Combo("Mirado", &preferences.Config.Skin.Mirado,
    "Mặc Định\0Sinh Nhật Sắc Màu\0Bentley Continental GTC Mulliner (Quý Tộc Áo Tím)\0Bentley Continental GTC Mulliner (Mộng Cảnh Lung Linh)\0Aston Martin DBS Volante (Black-Bronze Satin)\0Aston Martin DBS Volante (Celestial Pink)\0Aston Martin DBS Volante (Deep Cosmos)\0VW Beetle Convertible Mới (Quái Vật)\0VW Beetle Convertible Mới (Hồng)\0");

ImGui::Checkbox("##Buggy", &preferences.Buggy);
ImGui::SameLine();
ImGui::Combo("Buggy", &preferences.Config.Skin.Buggy,
    "Mặc Định\0Ceratops Siêu Tốc\0Giấc Mơ Vàng\0Thắt Nơ\0Người Cứu Hộ\0Lava\0Noel Ấm Áp\0Địa Hình\0Rạp Xiếc\0Nghệ Thuật Đường Phố\0Quỷ Đỏ\0Đội Trưởng Ryan\0Siêu Thú Godzilla\0Cô Phù Thủy Nhỏ\0Vinh Quang Quá Khứ\0Kẻ Săn Mồi\0Chúc Mừng Sinh Nhật\0Nhện Đen\0Cá Sấu\0Giai Điệu Du Dương\0Alan Walker 2021\0Cung Điện Ngọc\0Hoàng Adarna Ảo Diệu\0Butterfinger\0Vệ Binh Cổ Đại\0Xanh Sapphire\0Cá Mập Hung Bạo\0Đại Sứ Bóng Đá\0Polaris - Bão Táp Sa Mạc\0Polaris - Lấp Lánh Xanh Thẳm\0");

ImGui::Checkbox("##RZR", &preferences.RZR);
ImGui::SameLine();
ImGui::Combo("RZR", &preferences.Config.Skin.RZR,
    "Mặc Định\0Polaris Pro R 4\0Polaris Turbo R 4\0");

ImGui::Checkbox("##Xe Buýt", &preferences.MiniBus);
ImGui::SameLine();
ImGui::Combo(IsEnglish == 0 ? "Bus" : "Xe Buýt", &preferences.Config.Skin.MiniBus,
    "Mặc Định\0Gà Chiến Thắng\0Sóng Thần\0Hình Đấu Vật\0Gà Cute\0Gấu Xám\0Kem Ngọt Ngào\0Fan Cuồng Bóng Đá\0Hoa Hồng Đêm\0Chó\0Du Hành Cảnh Đêm\0Thỏ Trắng\0");

ImGui::Checkbox("##Thuyền To", &preferences.Boat);
ImGui::SameLine();
ImGui::Combo(IsEnglish == 0 ? "Big Boat" : "Thuyền To", &preferences.Config.Skin.Boat,
    "Mặc Định\0Hoa Văn Hoàng Gia\0Người Cứu Hộ\0Gà Con\0Cá Mập\0Huyền thoại Seven Seas\0Neko Sakura\0Quả Dứa\0Chim Cánh Cụt\0Tàu Sân Bay Bọc Thép\0Đội Kong\0");

                                }
                                ImGui::EndChild();
                }}
                if (Tab == 5) {

ImGui::Checkbox(IsEnglish == 0 ? "Hide Name" : "Ẩn Tên", &hidename);
                    ImGui::Checkbox(IsEnglish == 0 ? "Unlock 120FPS & Ultra HD" : "Mở Khóa 120FPS & Ultra HD", &Unlock120FPS);
                    ImGui::Checkbox(IsEnglish == 0 ? "Custom View" : "Tùy Chỉnh Góc Nhìn", &IsView);
                    if (IsView) {
                        ImGui::SliderFloat("TPP", &IsTPPValue, 50.0f, 150.0f, "%.0f");
                        ImGui::SliderFloat("FPP", &IsFPPValue, 50.0f, 150.0f, "%.0f");
                    } 
                    ImGui::Checkbox(IsEnglish == 0 ? "Spin Player" : "Xoay Nhân Vật", &IsSpinCharacter);
                    if (IsSpinCharacter) {
                        ImGui::SliderFloat(IsEnglish == 0 ? "Speed" : "Tốc Độ", &spinspeed, 0.0f, 25.0f, "%.0f");
                    }
                    ImGui::Checkbox(IsEnglish == 0 ? "Zoom Weapon" : "Thu Phóng Vũ Khí", &IsScaleWeapon);
                    if (IsScaleWeapon) {
                        ImGui::SliderFloat(IsEnglish == 0 ? "Rate" : "Tỷ Lệ", &WeaponScaleChanger, 0.5f, 5.0f, "%.1f");
                    }
                    ImGui::Checkbox(IsEnglish == 0 ? "Zoom Player" : "Thu Phóng Nhân Vật", &IsScaleCharacter);
                    if (IsScaleCharacter) {
                        ImGui::SliderFloat(IsEnglish == 0 ? "Rate " : "Tỷ Lệ ", &X1, 0.5f, 5.0f, "%.1f");
                    }
                    ImGui::Checkbox(IsEnglish == 0 ? "Small Cross" : "Tâm Nhỏ", &tamnho);
                    ImGui::Checkbox(IsEnglish == 0 ? "Rainbow Cross" : "Tâm Cầu Vồng", &tam7mau);
                    ImGui::Checkbox(IsEnglish == 0 ? "Spin Cross" : "Xoay Tâm", &xoaytam);
                    ImGui::Checkbox(IsEnglish == 0 ? "Hit Effect X" : "Hiệu Ứng Bắn Trúng X", &IsHitXPL);
                    ImGui::Checkbox(IsEnglish == 0 ? "Auto Tap" : "Tự Động Tap", &autotap);
                    ImGui::Checkbox(IsEnglish == 0 ? "Zoom Scope" : "Thu Phóng Ống Ngắm", &ongngamzoom);
                    if(ongngamzoom){
                       ImGui::SliderFloat(IsEnglish == 0 ? "Rate  " : "Tỷ Lệ   ", &SetZoom, 5.0f, 50.0f, "%.0f");
                   }
                    ImGui::Checkbox(IsEnglish == 0 ? "Fast Scope" : "Ống Ngắm Nhanh", &FastScope);
                    ImGui::Checkbox(IsEnglish == 0 ? "Fast Weapon Change" : "Đổi Vũ Khí Nhanh", &IsFastSwitch);
                    //ImGui::Checkbox("Không Giật", &IsNorecoil);
                    ImGui::Checkbox(IsEnglish == 0 ? "No Recoil Scope" : "Không Giật Ống Ngắm", &IsNorecoil2);
                    ImGui::Checkbox(IsEnglish == 0 ? "No Shake" : "Không Rung", &IsNocamerashake);
                    ImGui::Checkbox(IsEnglish == 0 ? "Give Up" : "Đầu Hàng", &GiveUp);
                    ImGui::Checkbox(IsEnglish == 0 ? "Snow Fall" : "Tuyết Rơi", &Snow);
                    ImGui::Checkbox(IsEnglish == 0 ? "Rain Fall" : "Mưa Rơi", &Rain);
                   /* if (ImGui::Checkbox(IsEnglish == 0 ? "Crazy Vehicle" : "Phương Tiện Điên", &AllCarHacks)) {
        CrazyCar     = AllCarHacks;
        WallHackCar  = AllCarHacks;
        infinitycar  = AllCarHacks;
        carspring    = AllCarHacks;
    }
    if(AllCarHacks){
                        ImGui::Checkbox(IsEnglish == 0 ? "Spin Vehicle" : "Quay Phương Tiện", &CarSpin);
                        if(CarSpin){
                        ImGui::SliderFloat(IsEnglish == 0 ? "Speed  " : "Tốc Độ   ", &SpinCar360, 0.0f, 200.0f, "%.0f");
                        }
    }*/
                    ImGui::Checkbox("Aimlock", &IsAimlock);
                }
                if (Tab == 6) {

                    /*ImVec2 childSize = ImGui::GetWindowSize();
                    float buttonWidthss = (childSize.x - ImGui::GetStyle().ItemSpacing.x * 2) / 2.0f - 2.35f;
                    if (ImGui::Button("Sao Chép Key", ImVec2(buttonWidthss, 0))) {
                        //[APIKey copyKey];
                        ShowBannerNotification("Đã Sao Chép Key");
                    }
                    ImGui::SameLine();
                    if (ImGui::Button("Đăng Xuất Key", ImVec2(buttonWidthss, 0))) {
                        //[APIKey exitKey];
                    }*/
                    // Lấy chiều rộng khả dụng còn lại trong BeginChild
float childWidth = ImGui::GetContentRegionAvail().x;
float buttonWidth = (childWidth - ImGui::GetStyle().ItemSpacing.x) * 0.5f;

// Hai nút chia đôi
if (ImGui::Button(IsEnglish == 0 ? "Save Config" : "Lưu Cấu Hình", ImVec2(buttonWidth, 0))) {
    [self SaveSetting];
    ShowBannerNotification(IsEnglish == 0 ? "Save Config Done" : "Đã Lưu Cấu Hình");
}
ImGui::SameLine();
if (ImGui::Button(IsEnglish == 0 ? "Use Config" : "Sử Dụng Cấu Hình", ImVec2(buttonWidth, 0))) {
    [self UseSetting];
    ShowBannerNotification(IsEnglish == 0 ? "Use Config Done" : "Đã Sử Dụng Cấu Hình");
}

// Nút reset chiếm toàn bộ chiều ngang
if (ImGui::Button(IsEnglish == 0 ? "Reset Config" : "Đặt Lại Cấu Hình", ImVec2(childWidth, 0))) {
    [self ResetSetting];
    ShowBannerNotification(IsEnglish == 0 ? "Reset Config Done" : "Đã Đặt Lại Cấu Hình");
}
                    ImGui::Combo(IsEnglish == 0 ? "Language" : "Ngôn Ngữ", &IsEnglish, "English\0Tiếng Việt\0");
                    ImGui::SliderFloat(IsEnglish == 0 ? "Frame Rate" : "Tốc Độ Khung Hình", &IsFPSDraw, 30.0f, 120.0f, "%.0fFPS");
                    ImGui::Checkbox(IsEnglish == 0 ? "Border Text || Border Color" : "Viền Chữ || Màu Viền", &drawOutline);
                    ImGui::SameLine();
                    ImGui::ColorEdit3("##4343", (float*)&outlineColor, ImGuiColorEditFlags_NoInputs);
                    ImGui::Checkbox(IsEnglish == 0 ? "Hide Hack" : "Ẩn Hack", &HideHack);


                
                }
                ImGui::EndChild();
                ImGui::End();  
            
            }
        ImDrawList* draw_list = ImGui::GetForegroundDrawList();
        
        
        ImGui::Render();
        ImDrawData* draw_data = ImGui::GetDrawData();
        ImGui_ImplMetal_RenderDrawData(draw_data, commandBuffer, renderEncoder);
        
        [renderEncoder popDebugGroup];
        [renderEncoder endEncoding];
        
        [commandBuffer presentDrawable:view.currentDrawable];
        }
    [commandBuffer commit];
}



-(void)SaveSetting{
    //Player
    configManager::putBoolean(config,"Player", "NumberPlayer", IsNumberPlayer);
    configManager::putBoolean(config,"Player", "Bone", IsBone);
    configManager::putBoolean(config,"Player", "Box", IsBox);
    configManager::putBoolean(config,"Player", "Line", IsLine);
    configManager::putBoolean(config,"Player", "Health", IsHealth);
    configManager::putBoolean(config,"Player", "Name", IsName);
    configManager::putBoolean(config,"Player", "Team", IsTeam);
    configManager::putBoolean(config,"Player", "Distance", IsDistance);
    configManager::putBoolean(config,"Player", "Weapon", IsWeapon);
    configManager::putBoolean(config,"Player", "Nation", IsNation);
    configManager::putBoolean(config,"Player", "UID", IsUID);
    configManager::putBoolean(config,"Player", "IgnoreBot", 屏蔽人机);
    configManager::putBoolean(config,"Player", "Alert360", IsAlert360);
    configManager::putInteger(config,"Player", "Style", IsStyle);
    configManager::putFloat(config,"Player", "Radius", radiusalert);
    configManager::putFloat(config,"Player", "DistanceESP", IsDistancePlayer);
    configManager::putFloat(config,"Player", "ThicknessBone", IsThicknessBone);
    configManager::putFloat(config,"Player", "ThicknessLine", IsThicknessLine);
    configManager::putFloat(config, "Player", "ColorBoneVisible_R", ColorBoneVisible.x);
    configManager::putFloat(config, "Player", "ColorBoneVisible_G", ColorBoneVisible.y);
    configManager::putFloat(config, "Player", "ColorBoneVisible_B", ColorBoneVisible.z);
    configManager::putFloat(config, "Player", "ColorBoneInvisible_R", ColorBoneInvisible.x);
    configManager::putFloat(config, "Player", "ColorBoneInvisible_G", ColorBoneInvisible.y);
    configManager::putFloat(config, "Player", "ColorBoneInvisible_B", ColorBoneInvisible.z);
    configManager::putFloat(config, "Player", "ColorLineVisible_R", ColorLineVisible.x);
    configManager::putFloat(config, "Player", "ColorLineVisible_G", ColorLineVisible.y);
    configManager::putFloat(config, "Player", "ColorLineVisible_B", ColorLineVisible.z);
    configManager::putFloat(config, "Player", "ColorLineInvisible_R", ColorLineInvisible.x);
    configManager::putFloat(config, "Player", "ColorLineInvisible_G", ColorLineInvisible.y);
    configManager::putFloat(config, "Player", "ColorLineInvisible_B", ColorLineInvisible.z);
    configManager::putFloat(config, "Player", "ColorBoxVisible_R", ColorBoxVisible.x);
    configManager::putFloat(config, "Player", "ColorBoxVisible_G", ColorBoxVisible.y);
    configManager::putFloat(config, "Player", "ColorBoxVisible_B", ColorBoxVisible.z);
    configManager::putFloat(config, "Player", "ColorBoxInvisible_R", ColorBoxInvisible.x);
    configManager::putFloat(config, "Player", "ColorBoxInvisible_G", ColorBoxInvisible.y);
    configManager::putFloat(config, "Player", "ColorBoxInvisible_B", ColorBoxInvisible.z);
    //Item
    configManager::putBoolean(config,"Item", "WarningBom", IsWarningBom);
    configManager::putBoolean(config,"Item", "AR", IsAR);
    configManager::putBoolean(config,"Item", "SMG", IsSMG);
    configManager::putBoolean(config,"Item", "SR", IsSR);
    configManager::putBoolean(config,"Item", "ShotGun", IsShotGun);
    configManager::putBoolean(config,"Item", "Bom", IsBom);
    configManager::putBoolean(config,"Item", "Bullet", IsBullet);
    configManager::putBoolean(config,"Item", "Vehicle", IsVehicle);
    configManager::putBoolean(config,"Item", "Scope", IsScope);
    configManager::putBoolean(config,"Item", "DeadBox", IsDeadBox);
    configManager::putBoolean(config,"Item", "AirDrop", IsAirDrop);
    configManager::putBoolean(config,"Item", "Armor", IsArmor);
    configManager::putBoolean(config,"Item", "Recovery", IsRecovery);
    //Aimbot
    configManager::putInteger(config,"Aimbot", "Switch", IsCheckAimbot);
    configManager::putBoolean(config,"Aimbot", "Fov", IsFov);
    configManager::putBoolean(config,"Aimbot", "Line", IsLineAimbot);
    configManager::putBoolean(config,"Aimbot", "IgnoreKnock", IsIgnoreKnock);
    configManager::putBoolean(config,"Aimbot", "IgnoreBot", boquabots);
    configManager::putFloat(config,"Aimbot", "Radius", IsRadius);
    configManager::putFloat(config,"Aimbot", "Speed", IsSpeed);
    configManager::putFloat(config,"Aimbot", "Recoil", IsRecoil);
    configManager::putFloat(config,"Aimbot", "Distance", IsDistanceAimbot);
    configManager::putInteger(config,"Aimbot", "Mode", IsMode);
    configManager::putInteger(config,"Aimbot", "Part", IsPart);
    //More
    configManager::putBoolean(config,"More", "Border", drawOutline);
    configManager::putBoolean(config,"More", "DeveloperMode", IsDeveloperMode);
    configManager::putBoolean(config,"More", "MatchInfomation", IsMatchInfomation);
    configManager::putBoolean(config,"More", "HideHack", HideHack);
    configManager::putFloat(config,"More", "FPSDraw", IsFPSDraw);
    configManager::putBoolean(config,"More", "CustomView", IsView);
    configManager::putFloat(config,"More", "TPP", IsTPPValue);
    configManager::putFloat(config,"More", "FPP", IsFPPValue);
    configManager::putInteger(config,"More", "Language", IsEnglish);
    //Memory
    configManager::putBoolean(config,"Memory", "HideName", hidename);
    configManager::putBoolean(config,"Memory", "Unlock120FPS&UltraHD", Unlock120FPS);
    configManager::putBoolean(config,"Memory", "SpinPlayer", IsSpinCharacter);
    configManager::putFloat(config,"Memory", "SpeedSpinPlayer", spinspeed);
    configManager::putBoolean(config,"Memory", "ZoomWeapon", IsScaleWeapon);
    configManager::putFloat(config,"Memory", "RateZoomWeapon", WeaponScaleChanger);
    configManager::putBoolean(config,"Memory", "ZoomPlayer", IsScaleCharacter);
    configManager::putFloat(config,"Memory", "RateZoomPlayer", X1);
    configManager::putBoolean(config,"Memory", "SmallCross", tamnho);
    configManager::putBoolean(config,"Memory", "RainbowCross", tam7mau);
    configManager::putBoolean(config,"Memory", "SpinCross", xoaytam);
    configManager::putBoolean(config,"Memory", "HitEffectX", IsHitXPL);
    configManager::putBoolean(config,"Memory", "AutoTap", autotap);
    configManager::putBoolean(config,"Memory", "ZoomScope", ongngamzoom);
    configManager::putFloat(config,"Memory", "RateZoomScope", SetZoom);
    configManager::putBoolean(config,"Memory", "FastScope", FastScope);
    configManager::putBoolean(config,"Memory", "FastWeaponChange", IsFastSwitch);
    configManager::putBoolean(config,"Memory", "NoRecoilScope", IsNorecoil2);
    configManager::putBoolean(config,"Memory", "NoShake", IsNocamerashake);
    configManager::putBoolean(config,"Memory", "GiveUp", GiveUp);
    configManager::putBoolean(config,"Memory", "SnowFall", Snow);
    configManager::putBoolean(config,"Memory", "RainFall", Rain);
    configManager::putBoolean(config,"Memory", "Aimlock", IsAimlock);
    //Mod
    configManager::putBoolean(config,"Mod", "Skin", ModSkinn);
configManager::putBoolean(config,"Mod", "KillMessage", initkillmsgopen);
configManager::putBoolean(config,"Mod", "DeadBox", DeadBox);
configManager::putBoolean(config,"Mod", "SkinLobby", skinlobby);
configManager::putBoolean(config,"Mod", "SkinInBag", BagGun);
configManager::putBoolean(config,"Mod", "BoolOutfit", preferences.Outfit);
configManager::putBoolean(config,"Mod", "BoolBag", preferences.Bagg);
configManager::putBoolean(config,"Mod", "BoolHelmet", preferences.Helmett);
configManager::putBoolean(config,"Mod", "BoolParachute", preferences.Parachute);
configManager::putBoolean(config,"Mod", "BoolGloves", preferences.Gloves);
configManager::putBoolean(config, "Mod", "BoolM416", preferences.M416);
configManager::putBoolean(config, "Mod", "BoolAKM", preferences.AKM);
configManager::putBoolean(config, "Mod", "BoolSCARL", preferences.SCARL);
configManager::putBoolean(config, "Mod", "BoolM762", preferences.M762);
configManager::putBoolean(config, "Mod", "BoolGroza", preferences.GROZA);
configManager::putBoolean(config, "Mod", "BoolFAMAS", preferences.FAMAS);
configManager::putBoolean(config, "Mod", "BoolAUG", preferences.AUG);
configManager::putBoolean(config, "Mod", "BoolQBZ", preferences.QBZ);
configManager::putBoolean(config, "Mod", "BoolHoney", preferences.Honey);
configManager::putBoolean(config, "Mod", "BoolM16", preferences.M16);
configManager::putBoolean(config, "Mod", "BoolACE32", preferences.ACE32);
configManager::putBoolean(config, "Mod", "BoolKar98K", preferences.KAR98);
configManager::putBoolean(config, "Mod", "BoolM24", preferences.M24);
configManager::putBoolean(config, "Mod", "BoolAWM", preferences.AWM);
configManager::putBoolean(config, "Mod", "BoolAMR", preferences.AMR);
configManager::putBoolean(config, "Mod", "BoolMK14", preferences.MK14);
configManager::putBoolean(config, "Mod", "BoolMini14", preferences.MINI14);
configManager::putBoolean(config, "Mod", "BoolDP28", preferences.DP28);
configManager::putBoolean(config, "Mod", "BoolMG3", preferences.MG3);
configManager::putBoolean(config, "Mod", "BoolM249", preferences.M249);
configManager::putBoolean(config, "Mod", "BoolUZI", preferences.UZI);
configManager::putBoolean(config, "Mod", "BoolUMP", preferences.UMP);
configManager::putBoolean(config, "Mod", "BoolTommy", preferences.TOMMY);
configManager::putBoolean(config, "Mod", "BoolP90", preferences.P90);
configManager::putBoolean(config, "Mod", "BoolVector", preferences.VECTOR);
configManager::putBoolean(config, "Mod", "BoolBizon", preferences.BIZON);
configManager::putBoolean(config, "Mod", "BoolS1897", preferences.S1897);
configManager::putBoolean(config, "Mod", "BoolDBS", preferences.DBS);
configManager::putBoolean(config, "Mod", "BoolS12K", preferences.S12K);
configManager::putBoolean(config, "Mod", "BoolMachete", preferences.Machete);
configManager::putBoolean(config, "Mod", "BoolPAN", preferences.PAN);
configManager::putBoolean(config, "Mod", "BoolDacia", preferences.Dacia);
configManager::putBoolean(config, "Mod", "BoolCoupe", preferences.CoupeRB);
configManager::putBoolean(config, "Mod", "BoolUAZ", preferences.UAZ);
configManager::putBoolean(config, "Mod", "BoolMoto", preferences.Moto);
configManager::putBoolean(config, "Mod", "BoolBigFoot", preferences.BigFoot);
configManager::putBoolean(config, "Mod", "BoolMirado", preferences.Mirado);
configManager::putBoolean(config, "Mod", "BoolBuggy", preferences.Buggy);
configManager::putBoolean(config, "Mod", "BoolRZR", preferences.RZR);
configManager::putBoolean(config, "Mod", "BoolMiniBus", preferences.MiniBus);
configManager::putBoolean(config, "Mod", "BoolBoat", preferences.Boat);
configManager::putFloat(config, "Mod", "Outfit", preferences.Config.Skin.XSuits);
configManager::putFloat(config, "Mod", "Bag", preferences.bag);
configManager::putFloat(config, "Mod", "Helmet", preferences.helmet);
configManager::putFloat(config, "Mod", "Parachute", preferences.Config.Skin.Parachute);
configManager::putFloat(config, "Mod", "Gloves", preferences.Config.Skin.Gloves);
configManager::putFloat(config, "Mod", "M416", preferences.Config.Skin.M416);
configManager::putFloat(config, "Mod", "AKM", preferences.Config.Skin.AKM);
configManager::putFloat(config, "Mod", "SCAR-L", preferences.Config.Skin.Scar);
configManager::putFloat(config, "Mod", "M762", preferences.Config.Skin.M762);
configManager::putFloat(config, "Mod", "Groza", preferences.Config.Skin.Groza);
configManager::putFloat(config, "Mod", "FAMAS", preferences.Config.Skin.Famas);
configManager::putFloat(config, "Mod", "AUG", preferences.Config.Skin.AUG);
configManager::putFloat(config, "Mod", "QBZ", preferences.Config.Skin.QBZ);
configManager::putFloat(config, "Mod", "Honey", preferences.Config.Skin.Honey);
configManager::putFloat(config, "Mod", "M16A4", preferences.Config.Skin.M16A4);
configManager::putFloat(config, "Mod", "ACE32", preferences.Config.Skin.ACE32);
configManager::putFloat(config, "Mod", "Kar98K", preferences.Config.Skin.K98);
configManager::putFloat(config, "Mod", "M24", preferences.Config.Skin.M24);
configManager::putFloat(config, "Mod", "AWM", preferences.Config.Skin.AWM);
configManager::putFloat(config, "Mod", "AMR", preferences.Config.Skin.AMR);
configManager::putFloat(config, "Mod", "MK14", preferences.Config.Skin.MK14);
configManager::putFloat(config, "Mod", "Mini14", preferences.Config.Skin.MINI14);
configManager::putFloat(config, "Mod", "DP-28", preferences.Config.Skin.DP28);
configManager::putFloat(config, "Mod", "MG3", preferences.Config.Skin.MG3);
configManager::putFloat(config, "Mod", "M249", preferences.Config.Skin.M249);
configManager::putFloat(config, "Mod", "UZI", preferences.Config.Skin.UZI);
configManager::putFloat(config, "Mod", "UMP45", preferences.Config.Skin.UMP);
configManager::putFloat(config, "Mod", "Thompson", preferences.Config.Skin.Thompson);
configManager::putFloat(config, "Mod", "P90", preferences.Config.Skin.P90);
configManager::putFloat(config, "Mod", "Vector", preferences.Config.Skin.Vector);
configManager::putFloat(config, "Mod", "Bizon", preferences.Config.Skin.Bizon);
configManager::putFloat(config, "Mod", "S1897", preferences.Config.Skin.S1897);
configManager::putFloat(config, "Mod", "DBS", preferences.Config.Skin.DBS);
configManager::putFloat(config, "Mod", "S12K", preferences.Config.Skin.S12K);
configManager::putFloat(config, "Mod", "Machete", preferences.Config.Skin.Machete);
configManager::putFloat(config, "Mod", "Pan", preferences.Config.Skin.Pan);

configManager::putFloat(config, "Mod", "Dacia", preferences.Config.Skin.Dacia);
configManager::putFloat(config, "Mod", "Coupe", preferences.Config.Skin.CoupeRP);
configManager::putFloat(config, "Mod", "UAZ", preferences.Config.Skin.UAZ);
configManager::putFloat(config, "Mod", "Moto", preferences.Config.Skin.Moto);
configManager::putFloat(config, "Mod", "Bigfoot", preferences.Config.Skin.Bigfoot);
configManager::putFloat(config, "Mod", "Mirado", preferences.Config.Skin.Mirado);
configManager::putFloat(config, "Mod", "Buggy", preferences.Config.Skin.Buggy);
configManager::putFloat(config, "Mod", "RZR", preferences.Config.Skin.RZR);
configManager::putFloat(config, "Mod", "MiniBus", preferences.Config.Skin.MiniBus);
configManager::putFloat(config, "Mod", "PG117", preferences.Config.Skin.Boat);
}

-(void)UseSetting{
    //Player
    IsNumberPlayer = configManager::readBoolean(config,"Player", "NumberPlayer", false);
    IsBone = configManager::readBoolean(config,"Player", "Bone", false);
    IsBox = configManager::readBoolean(config,"Player", "Box", false);
    IsLine = configManager::readBoolean(config,"Player", "Line", false);
    IsHealth = configManager::readBoolean(config,"Player", "Health", false);
    IsName = configManager::readBoolean(config,"Player", "Name", false);
    IsTeam = configManager::readBoolean(config,"Player", "Team", false);
    IsDistance = configManager::readBoolean(config,"Player", "Distance", false);
    IsWeapon = configManager::readBoolean(config,"Player", "Weapon", false);
    IsNation = configManager::readBoolean(config,"Player", "Nation", false);
    IsUID = configManager::readBoolean(config,"Player", "UID", false);
    屏蔽人机 = configManager::readBoolean(config,"Player", "IgnoreBot", false);
    IsAlert360 = configManager::readBoolean(config,"Player", "Alert360", false);
    IsStyle = configManager::readInteger(config,"Player", "Style", 0);
    radiusalert = configManager::readFloat(config,"Player", "Radius", 125.0);
    IsDistancePlayer = configManager::readFloat(config,"Player", "DistanceESP", 750.0);
    IsThicknessBone = configManager::readFloat(config,"Player", "ThicknessBone", 1.0);
    IsThicknessLine = configManager::readFloat(config,"Player", "ThicknessLine", 1.0);
    ColorBoneVisible.x = configManager::readFloat(config, "Player", "ColorBoneVisible_R", 0.0f); // mặc định trắng
    ColorBoneVisible.y = configManager::readFloat(config, "Player", "ColorBoneVisible_G", 1.0f);
    ColorBoneVisible.z = configManager::readFloat(config, "Player", "ColorBoneVisible_B", 0.0f);
    ColorBoneInvisible.x = configManager::readFloat(config, "Player", "ColorBoneInvisible_R", 1.0f); // mặc định trắng
    ColorBoneInvisible.y = configManager::readFloat(config, "Player", "ColorBoneInvisible_G", 0.0f);
    ColorBoneInvisible.z = configManager::readFloat(config, "Player", "ColorBoneInvisible_B", 0.0f);
    ColorLineVisible.x = configManager::readFloat(config, "Player", "ColorLineVisible_R", 0.0f); // mặc định trắng
    ColorLineVisible.y = configManager::readFloat(config, "Player", "ColorLineVisible_G", 1.0f);
    ColorLineVisible.z = configManager::readFloat(config, "Player", "ColorLineVisible_B", 0.0f);
    ColorLineInvisible.x = configManager::readFloat(config, "Player", "ColorLineInvisible_R", 1.0f); // mặc định trắng
    ColorLineInvisible.y = configManager::readFloat(config, "Player", "ColorLineInvisible_G", 1.0f);
    ColorLineInvisible.z = configManager::readFloat(config, "Player", "ColorLineInvisible_B", 1.0f);
    ColorBoxVisible.x = configManager::readFloat(config, "Player", "ColorBoxVisible_R", 0.0f); // mặc định trắng
    ColorBoxVisible.y = configManager::readFloat(config, "Player", "ColorBoxVisible_G", 1.0f);
    ColorBoxVisible.z = configManager::readFloat(config, "Player", "ColorBoxVisible_B", 0.0f);
    ColorBoxInvisible.x = configManager::readFloat(config, "Player", "ColorBoxInvisible_R", 0.0f); // mặc định trắng
    ColorBoxInvisible.y = configManager::readFloat(config, "Player", "ColorBoxInvisible_G", 0.0f);
    ColorBoxInvisible.z = configManager::readFloat(config, "Player", "ColorBoxInvisible_B", 1.0f);
    //Item
    IsWarningBom = configManager::readBoolean(config,"Item", "WarningBom", false);
    IsAR = configManager::readBoolean(config,"Item", "AR", false);
    IsSMG = configManager::readBoolean(config,"Item", "SMG", false);
    IsSR = configManager::readBoolean(config,"Item", "SR", false);
    IsShotGun = configManager::readBoolean(config,"Item", "ShotGun", false);
    IsBom = configManager::readBoolean(config,"Item", "Bom", false);
    IsBullet = configManager::readBoolean(config,"Item", "Bullet", false);
    IsVehicle = configManager::readBoolean(config,"Item", "Vehicle", false);
    IsScope = configManager::readBoolean(config,"Item", "Scope", false);
    IsDeadBox = configManager::readBoolean(config,"Item", "DeadBox", false);
    IsAirDrop = configManager::readBoolean(config,"Item", "AirDrop", false);
    IsArmor = configManager::readBoolean(config,"Item", "Armor", false);
    IsRecovery = configManager::readBoolean(config,"Item", "Recovery", false);
    //Aimbot
    IsCheckAimbot = configManager::readInteger(config,"Aimbot", "Switch", 0);
    IsFov = configManager::readBoolean(config,"Aimbot", "Fov", false);
    IsLineAimbot = configManager::readBoolean(config,"Aimbot", "Line", false);
    IsIgnoreKnock = configManager::readBoolean(config,"Aimbot", "IgnoreKnock", false);
    boquabots = configManager::readBoolean(config,"Aimbot", "IgnoreBot", false);
    IsRadius = configManager::readFloat(config,"Aimbot", "Radius", 0.0);
    IsSpeed = configManager::readFloat(config,"Aimbot", "Speed", 0.0);
    IsRecoil = configManager::readFloat(config,"Aimbot", "Recoil", 0.0);
    IsSpeed = configManager::readFloat(config,"Aimbot", "Speed", 0.0);
    IsDistanceAimbot = configManager::readFloat(config,"Aimbot", "Distance", 0.0);
    IsMode = configManager::readInteger(config,"Aimbot", "Mode", 0);
    IsPart = configManager::readInteger(config,"Aimbot", "Part", 0);
    //More
    drawOutline = configManager::readBoolean(config,"More", "Border", true);
    IsDeveloperMode = configManager::readBoolean(config,"More", "DeveloperMode", false);
    IsMatchInfomation = configManager::readBoolean(config,"More", "MatchInfomation", false);
    HideHack = configManager::readBoolean(config,"More", "HideHack", true);
    IsFPSDraw = configManager::readFloat(config,"More", "FPSDraw", 30.0);
    IsView = configManager::readBoolean(config,"More", "CustomView", false);
    IsTPPValue = configManager::readFloat(config,"More", "TPP", 90.0);
    IsFPPValue = configManager::readFloat(config,"More", "FPP", 90.0);
    IsEnglish = configManager::readInteger(config,"More", "Language", 0);
    //Memory
    hidename = configManager::readBoolean(config,"Memory", "HideName", false);
    Unlock120FPS = configManager::readBoolean(config,"Memory", "Unlock120FPS&UltraHD", false);
    IsSpinCharacter = configManager::readBoolean(config,"Memory", "SpinPlayer", false);
    spinspeed = configManager::readFloat(config,"Memory", "SpeedSpinPlayer", 0);
    IsScaleWeapon = configManager::readBoolean(config,"Memory", "ZoomWeapon", false);
    WeaponScaleChanger = configManager::readFloat(config,"Memory", "RateZoomWeapon", 1.0);
    IsScaleCharacter = configManager::readBoolean(config,"Memory", "ZoomPlayer", false);
    X1 = configManager::readFloat(config,"Memory", "RateZoomPlayer", 1.0);
    tamnho = configManager::readBoolean(config,"Memory", "SmallCross", false);
    tam7mau = configManager::readBoolean(config,"Memory", "RainbowCross", false);
    xoaytam = configManager::readBoolean(config,"Memory", "SpinCross", false);
    IsHitXPL = configManager::readBoolean(config,"Memory", "HitEffectX", false);
    autotap = configManager::readBoolean(config,"Memory", "AutoTap", false);
    ongngamzoom = configManager::readBoolean(config,"Memory", "ZoomScope", false);
    SetZoom = configManager::readFloat(config,"Memory", "RateZoomScope", 20);
    FastScope = configManager::readBoolean(config,"Memory", "FastScope", false);
    IsFastSwitch = configManager::readBoolean(config,"Memory", "FastWeaponChange", false);
    IsNorecoil2 = configManager::readBoolean(config,"Memory", "NoRecoilScope", false);
    IsNocamerashake = configManager::readBoolean(config,"Memory", "NoShake", false);
    GiveUp = configManager::readBoolean(config,"Memory", "GiveUp", false);
    Snow = configManager::readBoolean(config,"Memory", "SnowFall", false);
    Rain = configManager::readBoolean(config,"Memory", "RainFall", false);
    IsAimlock = configManager::readBoolean(config,"Memory", "Aimlock", false);
    //Mod
    ModSkinn = configManager::readBoolean(config,"Mod", "Skin", false);
    initkillmsgopen = configManager::readBoolean(config,"Mod", "KillMessage", false);
    DeadBox = configManager::readBoolean(config,"Mod", "DeadBox", false);
    skinlobby = configManager::readBoolean(config,"Mod", "SkinLobby", false);
    BagGun = configManager::readBoolean(config,"Mod", "SkinInBag", false);
    preferences.Outfit = configManager::readBoolean(config,"Mod", "BoolOutfit", false);
    preferences.Bagg = configManager::readBoolean(config,"Mod", "BoolBag", false);
    preferences.Helmett = configManager::readBoolean(config,"Mod", "BoolHelmet", false);
    preferences.Parachute = configManager::readBoolean(config,"Mod", "BoolParachute", false);
    preferences.Gloves = configManager::readBoolean(config,"Mod", "BoolGloves", false);
    // Đọc các giá trị cho vũ khí và phương tiện
preferences.M416 = configManager::readBoolean(config, "Mod", "BoolM416", false);
preferences.AKM = configManager::readBoolean(config, "Mod", "BoolAKM", false);
preferences.SCARL = configManager::readBoolean(config, "Mod", "BoolSCARL", false);
preferences.M762 = configManager::readBoolean(config, "Mod", "BoolM762", false);
preferences.GROZA = configManager::readBoolean(config, "Mod", "BoolGroza", false);
preferences.FAMAS = configManager::readBoolean(config, "Mod", "BoolFAMAS", false);
preferences.AUG = configManager::readBoolean(config, "Mod", "BoolAUG", false);
preferences.QBZ = configManager::readBoolean(config, "Mod", "BoolQBZ", false);
preferences.Honey = configManager::readBoolean(config, "Mod", "BoolHoney", false);
preferences.M16 = configManager::readBoolean(config, "Mod", "BoolM16", false);
preferences.ACE32 = configManager::readBoolean(config, "Mod", "BoolACE32", false);
preferences.KAR98 = configManager::readBoolean(config, "Mod", "BoolKar98K", false);
preferences.M24 = configManager::readBoolean(config, "Mod", "BoolM24", false);
preferences.AWM = configManager::readBoolean(config, "Mod", "BoolAWM", false);
preferences.AMR = configManager::readBoolean(config, "Mod", "BoolAMR", false);
preferences.MK14 = configManager::readBoolean(config, "Mod", "BoolMK14", false);
preferences.MINI14 = configManager::readBoolean(config, "Mod", "BoolMini14", false);
preferences.DP28 = configManager::readBoolean(config, "Mod", "BoolDP28", false);
preferences.MG3 = configManager::readBoolean(config, "Mod", "BoolMG3", false);
preferences.M249 = configManager::readBoolean(config, "Mod", "BoolM249", false);
preferences.UZI = configManager::readBoolean(config, "Mod", "BoolUZI", false);
preferences.UMP = configManager::readBoolean(config, "Mod", "BoolUMP", false);
preferences.TOMMY = configManager::readBoolean(config, "Mod", "BoolTommy", false);
preferences.P90 = configManager::readBoolean(config, "Mod", "BoolP90", false);
preferences.VECTOR = configManager::readBoolean(config, "Mod", "BoolVector", false);
preferences.BIZON = configManager::readBoolean(config, "Mod", "BoolBizon", false);
preferences.S1897 = configManager::readBoolean(config, "Mod", "BoolS1897", false);
preferences.DBS = configManager::readBoolean(config, "Mod", "BoolDBS", false);
preferences.S12K = configManager::readBoolean(config, "Mod", "BoolS12K", false);
preferences.Machete = configManager::readBoolean(config, "Mod", "BoolMachete", false);
preferences.PAN = configManager::readBoolean(config, "Mod", "BoolPAN", false);
preferences.Dacia = configManager::readBoolean(config, "Mod", "BoolDacia", false);
preferences.CoupeRB = configManager::readBoolean(config, "Mod", "BoolCoupe", false);
preferences.UAZ = configManager::readBoolean(config, "Mod", "BoolUAZ", false);
preferences.Moto = configManager::readBoolean(config, "Mod", "BoolMoto", false);
preferences.BigFoot = configManager::readBoolean(config, "Mod", "BoolBigFoot", false);
preferences.Mirado = configManager::readBoolean(config, "Mod", "BoolMirado", false);
preferences.Buggy = configManager::readBoolean(config, "Mod", "BoolBuggy", false);
preferences.RZR = configManager::readBoolean(config, "Mod", "BoolRZR", false);
preferences.MiniBus = configManager::readBoolean(config, "Mod", "BoolMiniBus", false);
preferences.Boat = configManager::readBoolean(config, "Mod", "BoolBoat", false);

    preferences.Config.Skin.XSuits = configManager::readFloat(config, "Mod", "Outfit", 0.0f);
preferences.bag = configManager::readFloat(config, "Mod", "Bag", 0.0f);
preferences.helmet = configManager::readFloat(config, "Mod", "Helmet", 0.0f);
preferences.Config.Skin.Parachute = configManager::readFloat(config, "Mod", "Parachute", 0.0f);
preferences.Config.Skin.Gloves = configManager::readFloat(config, "Mod", "Gloves", 0.0f);
    preferences.Config.Skin.M416 = configManager::readFloat(config, "Mod", "M416", 0.0f);
preferences.Config.Skin.AKM = configManager::readFloat(config, "Mod", "AKM", 0.0f);
preferences.Config.Skin.Scar = configManager::readFloat(config, "Mod", "SCAR-L", 0.0f);
preferences.Config.Skin.M762 = configManager::readFloat(config, "Mod", "M762", 0.0f);
preferences.Config.Skin.Groza = configManager::readFloat(config, "Mod", "Groza", 0.0f);
preferences.Config.Skin.Famas = configManager::readFloat(config, "Mod", "FAMAS", 0.0f);
preferences.Config.Skin.AUG = configManager::readFloat(config, "Mod", "AUG", 0.0f);
preferences.Config.Skin.QBZ = configManager::readFloat(config, "Mod", "QBZ", 0.0f);
preferences.Config.Skin.Honey = configManager::readFloat(config, "Mod", "Honey", 0.0f);
preferences.Config.Skin.M16A4 = configManager::readFloat(config, "Mod", "M16A4", 0.0f);
preferences.Config.Skin.ACE32 = configManager::readFloat(config, "Mod", "ACE32", 0.0f);
preferences.Config.Skin.K98 = configManager::readFloat(config, "Mod", "Kar98K", 0.0f);
preferences.Config.Skin.M24 = configManager::readFloat(config, "Mod", "M24", 0.0f);
preferences.Config.Skin.AWM = configManager::readFloat(config, "Mod", "AWM", 0.0f);
preferences.Config.Skin.AMR = configManager::readFloat(config, "Mod", "AMR", 0.0f);
preferences.Config.Skin.MK14 = configManager::readFloat(config, "Mod", "MK14", 0.0f);
preferences.Config.Skin.MINI14 = configManager::readFloat(config, "Mod", "Mini14", 0.0f);
preferences.Config.Skin.DP28 = configManager::readFloat(config, "Mod", "DP-28", 0.0f);
preferences.Config.Skin.MG3 = configManager::readFloat(config, "Mod", "MG3", 0.0f);
preferences.Config.Skin.M249 = configManager::readFloat(config, "Mod", "M249", 0.0f);
preferences.Config.Skin.UZI = configManager::readFloat(config, "Mod", "UZI", 0.0f);
preferences.Config.Skin.UMP = configManager::readFloat(config, "Mod", "UMP45", 0.0f);
preferences.Config.Skin.Thompson = configManager::readFloat(config, "Mod", "Thompson", 0.0f);
preferences.Config.Skin.P90 = configManager::readFloat(config, "Mod", "P90", 0.0f);
preferences.Config.Skin.Vector = configManager::readFloat(config, "Mod", "Vector", 0.0f);
preferences.Config.Skin.Bizon = configManager::readFloat(config, "Mod", "Bizon", 0.0f);
preferences.Config.Skin.S1897 = configManager::readFloat(config, "Mod", "S1897", 0.0f);
preferences.Config.Skin.DBS = configManager::readFloat(config, "Mod", "DBS", 0.0f);
preferences.Config.Skin.S12K = configManager::readFloat(config, "Mod", "S12K", 0.0f);
preferences.Config.Skin.Machete = configManager::readFloat(config, "Mod", "Machete", 0.0f);
preferences.Config.Skin.Pan = configManager::readFloat(config, "Mod", "Pan", 0.0f);

preferences.Config.Skin.Dacia = configManager::readFloat(config, "Mod", "Dacia", 0.0f);
preferences.Config.Skin.CoupeRP = configManager::readFloat(config, "Mod", "Coupe", 0.0f);
preferences.Config.Skin.UAZ = configManager::readFloat(config, "Mod", "UAZ", 0.0f);
preferences.Config.Skin.Moto = configManager::readFloat(config, "Mod", "Moto", 0.0f);
preferences.Config.Skin.Bigfoot = configManager::readFloat(config, "Mod", "Bigfoot", 0.0f);
preferences.Config.Skin.Mirado = configManager::readFloat(config, "Mod", "Mirado", 0.0f);
preferences.Config.Skin.Buggy = configManager::readFloat(config, "Mod", "Buggy", 0.0f);
preferences.Config.Skin.RZR = configManager::readFloat(config, "Mod", "RZR", 0.0f);
preferences.Config.Skin.MiniBus = configManager::readFloat(config, "Mod", "MiniBus", 0.0f);
preferences.Config.Skin.Boat = configManager::readFloat(config, "Mod", "PG117", 0.0f);
}

-(void)ResetSetting{
    //Player
    IsNumberPlayer = false;
    IsBone = false;
    IsBox = false;
    IsLine = false;
    IsHealth = false;
    IsName = false;
    IsTeam = false;
    IsDistance = false;
    IsWeapon = false;
    IsNation = false;
    IsUID = false;
    屏蔽人机 = false;
    IsAlert360 = false;
    IsStyle = 0;
    radiusalert = 125;
    IsDistancePlayer = 750.0;
    IsThicknessBone = 1.0;
    IsThicknessLine = 1.0;
    ColorBoneVisible = ImVec4(0.0f, 1.0f, 0.0f, 1.0f);
    ColorBoneInvisible = ImVec4(1.0f, 0.0f, 0.0f, 1.0f);
    ColorLineVisible = ImVec4(0.0f, 1.0f, 0.0f, 1.0f);
    ColorLineInvisible = ImVec4(1.0f, 1.0f, 1.0f, 1.0f);
    ColorBoxVisible = ImVec4(0.0f, 1.0f, 0.0f, 1.0f);
    ColorBoxInvisible = ImVec4(0.0f, 0.0f, 1.0f, 1.0f);
    //Item
    IsWarningBom = false;
    IsAR = false;
    IsSMG = false;
    IsSR = false;
    IsShotGun = false;
    IsBom = false;
    IsBullet = false;
    IsVehicle = false;
    IsScope = false;
    IsDeadBox = false;
    IsAirDrop = false;
    IsArmor = false;
    //Aimbot
    IsCheckAimbot = 0;
    IsFov = false;
    IsLineAimbot = false;
    IsIgnoreKnock = false;
    boquabots = false;
    IsRadius = 0.0;
    IsSpeed = 0.0;
    IsRecoil = 0.0;
    IsSpeed = 0.0;
    IsDistanceAimbot = 0.0;
    IsMode = 0;
    IsPart = 0;
    //More
    drawOutline = true;
    IsDeveloperMode = false;
    IsMatchInfomation = false;
    HideHack = true;
    IsFPSDraw = 30.0;
    IsView = false;
    IsTPPValue = 90.0;
    IsFPPValue = 90.0;
    IsEnglish = 0;
    //Memory
    hidename = false;
    Unlock120FPS = false;
    IsSpinCharacter = false;
    spinspeed = 0;
    IsScaleWeapon = false;
    WeaponScaleChanger = 1.0;
    IsScaleCharacter = false;
    X1 = 1.0;
    tamnho = false;
    tam7mau = false;
    xoaytam = false;
    IsHitXPL = false;
    autotap = false;
    ongngamzoom = false;
    SetZoom = 20;
    FastScope = false;
    IsFastSwitch = false;
    IsNorecoil2 = false;
    IsNocamerashake = false;
    GiveUp = false;
    Snow = false;
    Rain = false;
    IsAimlock = false;
    //Mod
    ModSkinn = false;
    initkillmsgopen = false;
    DeadBox = false;
    skinlobby = false;
    BagGun = false;
    preferences.Outfit = false;
preferences.Bagg = false;
preferences.Helmett = false;
preferences.Parachute = false;
preferences.Gloves = false;
// Đọc các giá trị cho vũ khí và phương tiện, gán tất cả là false
preferences.M416 = false;
preferences.AKM = false;
preferences.SCARL = false;
preferences.M762 = false;
preferences.GROZA = false;
preferences.FAMAS = false;
preferences.AUG = false;
preferences.QBZ = false;
preferences.Honey = false;
preferences.M16 = false;
preferences.ACE32 = false;
preferences.KAR98 = false;
preferences.M24 = false;
preferences.AWM = false;
preferences.AMR = false;
preferences.MK14 = false;
preferences.MINI14 = false;
preferences.DP28 = false;
preferences.MG3 = false;
preferences.M249 = false;
preferences.UZI = false;
preferences.UMP = false;
preferences.TOMMY = false;
preferences.P90 = false;
preferences.VECTOR = false;
preferences.BIZON = false;
preferences.S1897 = false;
preferences.DBS = false;
preferences.S12K = false;
preferences.Machete = false;
preferences.PAN = false;
preferences.Dacia = false;
preferences.CoupeRB = false;
preferences.UAZ = false;
preferences.Moto = false;
preferences.BigFoot = false;
preferences.Mirado = false;
preferences.Buggy = false;
preferences.RZR = false;
preferences.MiniBus = false;
preferences.Boat = false;

        preferences.Config.Skin.XSuits = 0.0f;
preferences.bag = 0.0f;
preferences.helmet = 0.0f;
preferences.Config.Skin.Parachute = 0.0f;
preferences.Config.Skin.Gloves = 0.0f;
preferences.Config.Skin.M416 = 0.0f;
preferences.Config.Skin.AKM = 0.0f;
preferences.Config.Skin.Scar = 0.0f;
preferences.Config.Skin.M762 = 0.0f;
preferences.Config.Skin.Groza = 0.0f;
preferences.Config.Skin.Famas = 0.0f;
preferences.Config.Skin.AUG = 0.0f;
preferences.Config.Skin.QBZ = 0.0f;
preferences.Config.Skin.Honey = 0.0f;
preferences.Config.Skin.M16A4 = 0.0f;
preferences.Config.Skin.ACE32 = 0.0f;
preferences.Config.Skin.K98 = 0.0f;
preferences.Config.Skin.M24 = 0.0f;
preferences.Config.Skin.AWM = 0.0f;
preferences.Config.Skin.AMR = 0.0f;
preferences.Config.Skin.MK14 = 0.0f;
preferences.Config.Skin.MINI14 = 0.0f;
preferences.Config.Skin.DP28 = 0.0f;
preferences.Config.Skin.MG3 = 0.0f;
preferences.Config.Skin.M249 = 0.0f;
preferences.Config.Skin.UZI = 0.0f;
preferences.Config.Skin.UMP = 0.0f;
preferences.Config.Skin.Thompson = 0.0f;
preferences.Config.Skin.P90 = 0.0f;
preferences.Config.Skin.Vector = 0.0f;
preferences.Config.Skin.Bizon = 0.0f;
preferences.Config.Skin.S1897 = 0.0f;
preferences.Config.Skin.DBS = 0.0f;
preferences.Config.Skin.S12K = 0.0f;
preferences.Config.Skin.Machete = 0.0f;
preferences.Config.Skin.Pan = 0.0f;

preferences.Config.Skin.Dacia = 0.0f;
preferences.Config.Skin.CoupeRP = 0.0f;
preferences.Config.Skin.UAZ = 0.0f;
preferences.Config.Skin.Moto = 0.0f;
preferences.Config.Skin.Bigfoot = 0.0f;
preferences.Config.Skin.Mirado = 0.0f;
preferences.Config.Skin.Buggy = 0.0f;
preferences.Config.Skin.RZR = 0.0f;
preferences.Config.Skin.MiniBus = 0.0f;
preferences.Config.Skin.Boat = 0.0f;
}

- (void)mtkView:(MTKView*)view drawableSizeWillChange:(CGSize)size
{
    
}

@end

