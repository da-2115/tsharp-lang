#pragma once

#include <string>
#include <cstddef>
#include <map>

#include "Field.h"

class Object
{
public:
    using IntegerMap = std::map<std::string, Field<int>>;
    using StringMap = std::map<std::string, Field<std::string>>;
    
private:
    std::string name;
    IntegerMap integers;
    StringMap strings;

public:
    Object(const std::string& name) noexcept;

    std::string Name() const noexcept;

    IntegerMap Integers() const noexcept;    
    StringMap Strings() const noexcept;
    
    void addString(const std::string& name, const std::string& value, bool isPrivate) noexcept;
    void updateString(const std::string& name, const std::string& value) noexcept;
    
    void addInteger(const std::string& name, int value, bool isPrivate) noexcept;
    void updateInteger(const std::string& name, int value) noexcept;
};
