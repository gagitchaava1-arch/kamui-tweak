//
//  Bonepos.hpp
//  PUBGEngine
//
//  Created by liumac on 2023/1/5.
//

#pragma once
#include <iostream>
#include <string>
#include <unordered_set>
#include <codecvt>

class FNameEntry
{
public:
    static const auto NAME_WIDE_MASK = 0x1;
    static const auto NAME_INDEX_SHIFT = 1;

    int32_t Index;
#if defined(__LP64__)
    char pad[0x8];
#else
    char pad[0x4];
#endif

    union
    {
        char AnsiName[1024];
        wchar_t WideName[1024];
    };

    inline const int32_t GetIndex() const
    {
        return Index >> NAME_INDEX_SHIFT;
    }

    inline bool IsWide() const
    {
        return Index & NAME_WIDE_MASK;
    }

    inline const char* GetAnsiName() const
    {
        return AnsiName;
    }

    inline const wchar_t* GetWideName() const
    {
        return WideName;
    }
};

template<typename ElementType, int32_t MaxTotalElements, int32_t ElementsPerChunk>
class TStaticIndirectArrayThreadSafeRead
{
public:
    inline size_t Num() const
    {
        return NumElements;
    }

    inline bool IsValidIndex(int32_t index) const
    {
        return index < Num() && index > 0;
    }

    inline ElementType const* const& operator[](int32_t index) const
    {
        return *GetItemPtr(index);
    }

private:
    inline ElementType const* const* GetItemPtr(int32_t Index) const
    {
        int32_t ChunkIndex = Index / ElementsPerChunk;
        int32_t WithinChunkIndex = Index % ElementsPerChunk;
        ElementType** Chunk = Chunks[ChunkIndex];
        return Chunk + WithinChunkIndex;
    }

    enum
    {
        ChunkTableSize = (MaxTotalElements + ElementsPerChunk - 1) / ElementsPerChunk
    };

    ElementType** Chunks[ChunkTableSize];
    int32_t NumElements;
    int32_t NumChunks;
};


using TNameEntryArray = TStaticIndirectArrayThreadSafeRead<FNameEntry, 2 * 1024 * 1024, 16384>;
struct FName
{
    union
    {
        struct
        {
            int32_t ComparisonIndex;
            int32_t Number;
        };
    };

    inline FName()
        : ComparisonIndex(0),
          Number(0)
    {
    };

    inline FName(int32_t i)
        : ComparisonIndex(i),
          Number(0)
    {
    };

    FName(const char* nameToFind)
        : ComparisonIndex(0),
          Number(0)
    {
        static std::unordered_set<int> cache;

        for (auto i : cache)
        {
            if (!std::strcmp(GetNames()[i]->GetAnsiName(), nameToFind))
            {
                ComparisonIndex = i;

                return;
            }
        }

        for (auto i = 0; i < GetNames().Num(); ++i)
        {
            if (GetNames()[i] != nullptr)
            {
                if (!std::strcmp(GetNames()[i]->GetAnsiName(), nameToFind))
                {
                    cache.insert(i);

                    ComparisonIndex = i;

                    return;
                }
            }
        }
    };

    static TNameEntryArray *GNames;
    static inline TNameEntryArray& GetNames()
    {
        return *GNames;
    };

    inline const char* GetName() const
    {
        return GetNames()[ComparisonIndex]->GetAnsiName();
    };

    inline bool operator==(const FName &other) const
    {
        return ComparisonIndex == other.ComparisonIndex;
    };
};

TNameEntryArray* FName::GNames = nullptr;
