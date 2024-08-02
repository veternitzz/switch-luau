-- v2.1.0

--[[
    Made by: veternitzz (@alex_black20101)
    
    A switch implementation in pure luau. Documentation and a usage example can be found on the github
    linked below:

    https://github.com/veternitzz/switch-luau/
    Licensed under the MIT License
]]

-- Statement Operator Type
export type StatementOperator = "~=" | "==" | ">" | "<" | ">=" | "<="

-- Switch class
local Switch = {}
Switch.__index = Switch

function Switch.new(variable: any)
    local self = setmetatable({}, Switch)
    self.__variable = variable
    self.__defaultRegistered = false
    self.__checked = false
    self.__printOutput = false
    self.__casesRegistered = 0
    return self
end

function Switch:Debug(enabled: boolean)
    self.__printOutput = enabled
end

function Switch:Case(value: any, operation: StatementOperator, func: any)
    if self.__checked then
        return self
    end

    self.__casesRegistered += 1

    if self.__printOutput then
        print(`[switch-output] Registered case # {self.__casesRegistered}`)
    end

    local match = false
    if operation == "~=" then
        match = self.__variable ~= value
    elseif operation == "==" then
        match = self.__variable == value
    elseif operation == ">" then
        match = self.__variable > value
    elseif operation == "<" then
        match = self.__variable < value
    elseif operation == "<=" then
        match = self.__variable <= value
    elseif operation == ">=" then
        match = self.__variable >= value
    end

    if match then
        self.__checked = true
        func()
    end

    return self
end

function Switch:Default(func: any)
    if self.__defaultRegistered then
        error("Default was already registered")
        return self
    end

    if not self.__checked then
        if self.__printOutput then
            print("[switch-output] Registered default case")
        end

        self.__defaultRegistered = true
        self.__checked = true
        func()
    end

    return self
end

return Switch
