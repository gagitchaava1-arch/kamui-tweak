#include <stdint.h>

#define ALWAYS_INLINE __attribute__((always_inline))

constexpr int seedToInt(char c) { return c - '0'; }
const int seed = seedToInt(__TIME__[7]) +
                 seedToInt(__TIME__[6]) * 10 +
                 seedToInt(__TIME__[4]) * 60 +
                 seedToInt(__TIME__[3]) * 600 +
                 seedToInt(__TIME__[1]) * 3600 +
                 seedToInt(__TIME__[0]) * 36000;

template <uintptr_t Const> struct 
vxCplConstantify { enum { Value = Const }; };

constexpr uintptr_t vxCplRandom(uintptr_t Id)
{ return (1013904223 + 1664525 * ((Id > 0) ? (vxCplRandom(Id - 1)) : (seed))) & 0xFFFFFFFF; }

#define vxRANDOM(Min, Max) (Min + (vxRAND() % (Max - Min + 1)))
#define vxRAND()           (vxCplConstantify<vxCplRandom(__COUNTER__ + 1)>::Value)

template <uintptr_t...> struct vxCplIndexList {};
template <typename  IndexList, uintptr_t Right> struct vxCplAppend;
template <uintptr_t... Left,      uintptr_t Right> struct vxCplAppend<vxCplIndexList<Left...>, Right> { typedef vxCplIndexList<Left..., Right> Result; };
template <uintptr_t N> struct vxCplIndexes { typedef typename vxCplAppend<typename vxCplIndexes<N - 1>::Result, N - 1>::Result Result; };
template <> struct vxCplIndexes<0> { typedef vxCplIndexList<> Result; };

const char vxCplEncryptCharKey = (const char)vxRANDOM(0, 0xFF);
constexpr char ALWAYS_INLINE vxCplEncryptChar(const char Ch, uintptr_t Idx) { return Ch ^ (vxCplEncryptCharKey + Idx); }

template <typename IndexList> struct vxCplEncryptedString;
template <uintptr_t... Idx> struct vxCplEncryptedString<vxCplIndexList<Idx...> >
{
    char Value[sizeof...(Idx) + 1];

    constexpr ALWAYS_INLINE vxCplEncryptedString(const char* const Str)  
    : Value{ vxCplEncryptChar(Str[Idx], Idx)... } {}

    inline const char* decrypt()
    {
        for(uintptr_t t = 0; t < sizeof...(Idx); t++)
        { this->Value[t] = this->Value[t] ^ (vxCplEncryptCharKey + t); }
        this->Value[sizeof...(Idx)] = '\0'; return this->Value;
    }
};

#define ENCRYPT(Str) (vxCplEncryptedString<vxCplIndexes<sizeof(Str) - 1>::Result>(Str).decrypt())

#define NSSENCRYPT(Str) [NSString stringWithUTF8String:ENCRYPT(Str)]