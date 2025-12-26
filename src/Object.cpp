#include "Object.h"

Object::Object(const std::string& name) noexcept : name(name), integers{}, strings{}
{}

std::string Object::Name() const noexcept
{
    return name;
}

Object::IntegerMap Object::Integers() const noexcept
{
    return integers;
}

Object::StringMap Object::Strings() const noexcept
{
    return strings;
}

void Object::updateString(const std::string& name, const std::string& value) noexcept
{
     strings.at(name).SetValue(value);
}

void Object::addInteger(const std::string& name, int value, bool isPrivate) noexcept
{
    integers.emplace(name, Field<int>(name, value, isPrivate));
}

void Object::updateInteger(const std::string& name, int value) noexcept
{
     integers.at(name).SetValue(value);
}

void Object::addString(const std::string& name, const std::string& value, bool isPrivate) noexcept
{
    strings.emplace(name, Field<std::string>(name, value, isPrivate));
}