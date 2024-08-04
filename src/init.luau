-- v2.1.1

--[[
    Made by: veternitzz (@alex_black20101)
    
    A switch implementation in pure luau. Documentation and a usage example can be found on the github
    linked below:

    https://github.com/veternitzz/switch-luau/
    Licensed under the MIT License
]]

--[=[
    @type StatementOperator "~=" | "==" | ">" | "<" | ">=" | "<="
    @within Switch
    Statement Operators like equals to, not equals to, greater than, etc.
]=]
export type StatementOperator = "~=" | "==" | ">" | "<" | ">=" | "<="

--[=[
    @class Internal
    @private
    Internal functions and variables for use by maintainers and contributors. Is not accessible outside of the module. See switch for public methods.
]=]
local Internal = {}
Internal.__index = Internal

--[=[
    @function StatementCheck
    @within Internal
    @param operation StatementOperator -- The operation to perform on value and variable
    @param variable any -- The variable to check
    @param value any  -- The value to check
    @return bool -- Returns whether the value meets the variable based on the operation
    Checks the provided value and see if it meets the variable provided.
]=]
function Internal.StatementCheck(operation: StatementOperator, variable: any, value: any)
    local match = false

    if operation == "~=" then
        match = variable ~= value
    elseif operation == "==" then
        match = variable == value
    elseif operation == ">" then
        match = variable > value
    elseif operation == "<" then
        match = variable < value
    elseif operation == "<=" then
        match = variable <= value
    elseif operation == ">=" then
        match = variable >= value
    end

    return match
end

--[=[
    @class Switch
    The main switch class.
]=]
local Switch = {}
Switch.__index = Switch

--[=[
    @function new
    @within Switch
    @tag Constructor
    @param variable any -- The variable for the switch to check
    @return nil
    Returns a switch class.
]=]
function Switch.new(variable: any)
    local self = setmetatable({}, Switch)
    self.__variable = variable
    self.__defaultRegistered = false
    self.__checked = false
    self.__printOutput = false
    self.__casesRegistered = 0
    return self
end

--[=[
    @method Debug
    @within Switch
    @param enabled bool -- Whether to enaable or disable debug mode
    @return nil
    If enabled, will print when switches and defaults are registered.
]=]
function Switch:Debug(enabled: boolean)
    self.__printOutput = enabled
end

--[=[
    @method Case
    @within Switch
    @param value any -- The value to check with the variable
    @param operation StatementOperator -- The operator to use on value and variable
    @param func any -- The function to call if it's a match
    Define a new case, this acts like an if statement
]=]
function Switch:Case(value: any, operation: StatementOperator, func: any)
    if self.__checked then
        return self
    end

    self.__casesRegistered += 1

    if self.__printOutput then
        print(`[switch-output] Registered case # {self.__casesRegistered}`)
    end

    local match = Internal.StatementCheck(operation, self.__variable, value)

    if match then
        self.__checked = true
        func()
    end

    return self
end

--[=[
    @method Default
    @tag Only one can be reigstered per constructor
    @within Switch
    @param func any -- The function to call
    Define a default which acts as an else statement
]=]
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
