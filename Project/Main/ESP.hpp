#ifndef ABC_hpp
#define ABC_hpp
#include <array>
#include <iostream>
#include <stdio.h>
#include <cmath>
#include <string>
#include <map>
#include <vector>
#include <mach/mach.h>
#include <mach-o/dyld.h>
#include <mach-o/dyld_images.h>
#include <math.h>
#include <MacTypes.h>
#include <CoreFoundation/CoreFoundation.h>

#define __fastcall

using namespace std;

extern bool drawOutline;
static float IsFontDraw = 11.0;
extern int IsEnglish;

void GetActors(ImDrawList *imDrawList);

static void DrawTextWithOutlineX(ImDrawList* imDrawList, const ImVec2& pos, const std::string& text, float size, const ImColor& textColor, const ImColor& outlineColor, bool drawOutline, ImFont* FontName) {
    if (drawOutline) {
        for (int xOffset = -1; xOffset <= 1; ++xOffset) {
            for (int yOffset = -1; yOffset <= 1; ++yOffset) {
                if (xOffset != 0 || yOffset != 0) {
                    imDrawList->AddText(FontName, size, ImVec2(pos.x + xOffset, pos.y + yOffset), outlineColor, text.c_str());
                }
            }
        }
    }
    imDrawList->AddText(FontName, size, pos, textColor, text.c_str());
}

struct Rotator {
    float x;
    float y;
    float Roll;
};

struct Tracking {
    Rotator aim_angle;
    ImVec3 loc;
};

struct FRotator {
    float Pitch;
    float Yaw;
    float Roll;

    inline FRotator()
        : Pitch(0.0f), Yaw(0.0f), Roll(0.0f)
    { }

    inline FRotator(float pitch, float yaw, float roll)
        : Pitch(pitch), Yaw(yaw), Roll(roll)
    { }

    inline FRotator operator+ (const FRotator &A) {
        return FRotator(this->Pitch + A.Pitch, this->Yaw + A.Yaw, this->Roll + A.Roll);
    }

    inline FRotator operator- (const FRotator &A) {
        return FRotator(this->Pitch - A.Pitch, this->Yaw - A.Yaw, this->Roll - A.Roll);
    }

    inline FRotator operator* (const FRotator &A) {
        return FRotator(this->Pitch * A.Pitch, this->Yaw * A.Yaw, this->Roll * A.Roll);
    }

    inline FRotator operator* (const float A) {
        return FRotator(this->Pitch * A, this->Yaw * A, this->Roll * A);
    }

    inline FRotator operator/ (const FRotator &A) {
        return FRotator(this->Pitch / A.Pitch, this->Yaw / A.Yaw, this->Roll / A.Roll);
    }

    inline FRotator operator/ (const float A) {
        return FRotator(this->Pitch / A, this->Yaw / A, this->Roll / A);
    }
};

struct FMatrix {
    float Matrix[4][4];

    float *operator[](int index) {
        return Matrix[index];
    }
};

struct MinimalViewInfo {
    ImVec3 Location;
    ImVec3 LocationLocalSpace;
    FRotator Rotation;
    float FOV;
};

struct FString {
    char* PText;
    int Count;
    int Max;

    int Utf8ToUnicode(const char *utf8, unsigned short* unicode) {
        long len8 = strlen(utf8);
        int len16 = 0;
        unsigned short t, r;
        if(unicode != NULL) {
            for (int i = 0; i < len8;) {
                t = utf8[i] & 0xff;
                if(t < 0x80) {
                    r = t;
                    i++;
                }else if(t < 0xe0) {
                    r = t & 0x1f;
                    r <<= 6;
                    t = utf8[i + 1];
                    r += t & 0x3f;
                    i += 2;
                }else if(t < 0xf0){
                    r = t & 0x0f;
                    r <<= 6;
                    t = utf8[i + 1];
                    r += t & 0x3f;
                    r <<= 6;
                    t = utf8[i + 2];
                    r += t & 0x3f;
                    i += 3;
                }else {//出错，不处理
                    r = 0;
                    i++;
                }
                unicode[len16++] = r;
            }
            unicode[len16] = 0;
        }else {
            for (int i = 0; i < len8;) {
                t = utf8[i] & 0xff;
                if(t < 0x80) {
                    i++;
                }else if(t < 0xe0) {
                    i += 2;
                }else if(t < 0xf0){
                    i += 3;
                }else {
                    i++;
                }
                len16++;
            }
        }
        return len16;
    }

    static void UnicodeToUTF_8(char* pOut, wchar_t* pText, int Len) {
        char* pchar = (char *)pText;
        int coun = 0;
        for (int i = 0; i < Len; i++) {
            if (pchar[i*2+1] == 0) {
                pOut[coun] = pchar[i*2];
                coun++;
            } else {
                pOut[coun] = (0xE0 | ((pchar[i*2+1] & 0xF0) >> 4));
                pOut[coun+1] = (0x80 | ((pchar[i*2+1] & 0x0F) << 2)) + ((pchar[i*2] & 0xC0) >> 6);
                pOut[coun+2] = (0x80 | (pchar[i*2] & 0x3F));
                coun+=3;
            }
        }
    }

    inline FString(const char* strl) {
        char FText[256];
        Count = Max = Utf8ToUnicode(strl, (unsigned short *)FText) + 1;
        PText = FText;
    }
};

template<class TEnum>
class TEnumAsByte
{
public:
    inline TEnumAsByte()
    {
    }

    inline TEnumAsByte(TEnum _value)
        : value(static_cast<uint8_t>(_value))
    {
    }

    explicit inline TEnumAsByte(int32_t _value)
        : value(static_cast<uint8_t>(_value))
    {
    }

    explicit inline TEnumAsByte(uint8_t _value)
        : value(_value)
    {
    }

    inline operator TEnum() const
    {
        return (TEnum)value;
    }

    inline TEnum GetValue() const
    {
        return (TEnum)value;
    }

private:
    uint8_t value;
};

enum class ESTEPoseState : uint8_t
{
    ESTEPoseState__Stand           = 0,
    ESTEPoseState__Crouch          = 1,
    ESTEPoseState__Prone           = 2,
    ESTEPoseState__Sprint          = 3,
    ESTEPoseState__CrouchSprint    = 4,
    ESTEPoseState__Crawl           = 5,
    ESTEPoseState__Swim            = 6,
    ESTEPoseState__SwimSprint      = 7,
    ESTEPoseState__Dying           = 8,
    ESTEPoseState__DyingBeCarried  = 9,
    ESTEPoseState__DyingSwim       = 10,
    ESTEPoseState__ESTEPoseState_MAX = 11
};

static string GetWeaponIDName(int WeaponId) {
    string namea;
    switch (WeaponId) {
        case 0:
            namea = IsEnglish == 0 ? "Fist" : "Nắm Đấm";
            break;
        case 101001:
            namea = "AKM";
            break;
        case 101002:
            namea = "M16A4";
            break;
        case 101003:
            namea = "SCAR-L";
            break;
        case 101004:
            namea = "M416";
            break;
        case 101005:
            namea = "Groza";
            break;
        case 101006:
            namea = "AUG";
            break;
        case 101007:
            namea = "QBZ";
            break;
        case 101008:
            namea = "M762";
            break;
        case 101009:
            namea = "Mk47";
            break;
        case 101010:
            namea = "G36C";
            break;
        case 101011:
            namea = "AC-VAL";
            break;
        case 101012:
            namea = "Honey";
            break;
        case 101100:
            namea = "FAMAS";
            break;
        case 101101:
            namea = "ASM";
            break;
        case 101102:
            namea = "ACE32";
            break;
        case 102001:
            namea = "UZI";
            break;
        case 102002:
            namea = "UMP45";
            break;
        case 102003:
            namea = "Vector";
            break;
        case 102004:
            namea = "Thompson";
            break;
        case 102005:
            namea = "Bizon";
            break;
        case 102007:
            namea = "MP5K";
            break;
        case 102105:
            namea = "P90";
            break;
        case 103001:
            namea = "Kar98K";
            break;
        case 103002:
            namea = "M24";
            break;
        case 103003:
            namea = "AWM";
            break;
        case 103004:
            namea = "SKS";
            break;
        case 103005:
            namea = "VSS";
            break;
        case 103006:
            namea = "Mini14";
            break;
        case 103007:
            namea = "Mk14";
            break;
        case 103008:
            namea = "Win94";
            break;
        case 103009:
            namea = "SLR";
            break;
        case 103010:
            namea = "QBU";
            break;
        case 103011:
            namea = "Mosin";
            break;
        case 103012:
            namea = "AMR";
            break;
        case 103100:
            namea = "MK12";
            break;
        case 103102:
            namea = "DSR";
            break;
        case 104001:
            namea = "S686";
            break;
        case 104002:
            namea = "S1897";
            break;
        case 104003:
            namea = "S12K";
            break;
        case 104004:
            namea = "DBS";
            break;
        case 104100:
            namea = "SPAS-12";
            break;
        case 104101:
            namea = "M1014";
            break;
        case 104102:
            namea = "NS2000";
            break;
        case 105002:
            namea = "DP-28";
            break;
        case 105010:
            namea = "MG3";
            break;
        case 105001:
            namea = "M249";
            break;
        case 106001:
            namea = "P92";
            break;
        case 106002:
            namea = "P1911";
            break;
        case 106003:
            namea = "R1895";
            break;
        case 106004:
            namea = "P18C";
            break;
        case 106005:
            namea = "R45";
            break;
        case 106006:
            namea = "ShotGun";
            break;
        case 106007:
            namea = "FlareGun";
            break;
        case 106008:
            namea = "Skorpion";
            break;
        case 106009:
            namea = "FlareGun";
            break;
        case 106010:
            namea = "Desert";
            break;
        case 106011:
            namea = "MP7";
            break;
        case 106107:
            namea = "FlareGun";
            break;
        case 107001:
            namea = IsEnglish == 0 ? "Crossbow" : "Nỏ";
            break;
        case 107007:
            namea = IsEnglish == 0 ? "Crossbow" : "Nỏ";
            break;
        case 108001:
            namea = IsEnglish == 0 ? "Knife" : "Dao";
            break;
        case 108002:
            namea = IsEnglish == 0 ? "Crowbar" : "Xà Beng";
            break;
        case 108003:
            namea = IsEnglish == 0 ? "Sickle" : "Liềm";
            break;
        case 108004:
            namea = IsEnglish == 0 ? "Pan" : "Chảo";
            break;
        case 602004:
            namea = IsEnglish == 0 ? "Grenade" : "Lựu Đạn";
            break;
        case 602001:
            namea = IsEnglish == 0 ? "Stun" : "Bom Choáng";
            break;
        case 602002:
            namea = IsEnglish == 0 ? "Smoke" : "Bom Khói";
            break;
        case 602003:
            namea = IsEnglish == 0 ? "Burn" : "Bom xăng";
            break;
        default:
            namea = IsEnglish == 0 ? "Fist" : "Nắm Đấm";
            break;
    }
    return namea;
}


#endif /* ABC_hpp */

