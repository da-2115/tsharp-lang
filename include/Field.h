#pragma once

#include <string>

template<class T>
class Field
{
private:
    std::string name;
    T value;
    bool isPrivate;
    
public:
    Field(const std::string& name, T value, bool isPrivate) : name(name), value(value), isPrivate(isPrivate) 
    {}
    
    std::string Name() 
    { 
        return name;
    }
    
    T Value() 
    { 
        return value; 
    }
    
    void SetValue(const T& val)
    {
        value = val;
    }
    
    bool IsPrivate() 
    { 
        return isPrivate; 
    }
};
