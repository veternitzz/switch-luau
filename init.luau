-- v2.0.0

--[[
    Made by: veternitzz (@alex_black20101)
    
    A switch implementation in pure luau. Documentation and a usage example can be found on the github
    linked below:

    https://github.com/veternitzz/switch-luau/
    Licensed under the MIT License
]]

-- Switch class
local Switch = {}
Switch.__index = Switch

function Switch.New(variable: any)
    local self = setmetatable({}, Switch)
    self.variable = variable
    self.defaultRegistered = false
    self.checked = false
    self.printOutput = false
    self.casesRegistered = 0
    return self
end

function Switch:debug(enabled: boolean)
    self.printOutput = enabled
end

function Switch:case(value: any, operation: "~=" | "==" | ">" | "<" | ">=" | "<=", func: any)
    if not self.checked then
        self.casesRegistered += 1

        if self.printOutput then
            print("[switch-output] Registered case #" .. self.casesRegistered)
        end

        if operation == "~=" then
            if self.variable ~= value then
                self.checked = true
                return func()
            end
        elseif operation == "==" then
            if self.variable == value then
                self.checked = true
                return func()
            end
        elseif operation == ">" then
            if self.variable > value then
                self.checked = true
                return func()
            end
        elseif operation == "<" then
            if self.variable < value then
                self.checked = true
                return func()
            end
        elseif operation == "<=" then
            if self.variable <= value then
                self.checked = true
                return func()
            end
        elseif operation == ">=" then
            if self.variable >= value then
                self.checked = true
                return func()
            end
        end
    end
end

function Switch:default(func: any)
    if self.defaultRegistered then
        error("Default was already registered")
        return
    end

    if not self.checked then
        if self.printOutput then
            print("[switch-output] Registered default case")
        end

        self.defaultRegistered = true
        self.checked = true
        return func()
    end
end

return Switch
