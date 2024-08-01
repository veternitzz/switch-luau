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

-- constructor function
function Switch.new(variable: any)
	local metatable = setmetatable({}, Switch)
	metatable.__var = variable
	metatable.__defaultRegistered = false
	metatable.__checked = false
	metatable.__printOutput = false
	metatable.__casesRegistered = 0
	return metatable
end

-- debug output function
function Switch:Debug(enabled: boolean)
	self.__printOutput = enabled
end

-- case function
function Switch:Case(value: any, operation: "~=" | "==" | ">" | "<", func: any)
	if not self.__checked then
		self.__casesRegistered += 1
		
		if self.__printOutput then
			print("[switch-output] Registered case #" .. self.__casesRegistered)
		end
		
		if operation == "~=" then
			if self.__var ~= value then
				self.__checked = true
				func()
				return
			end
		elseif operation == "==" then
			if self.__var == value then
				self.__checked = true
				func()
				return
			end
		elseif operation == ">" then
			if self.__var > value then
				self.__checked = true
				func()
				return
			end
		elseif operation == "<" then
			if self.__var < value then
				self.__checked = true
				func()
				return
			end
		end
	end
end

function Switch:Default(func: any)
	if self.__defaultRegistered then
		error("Default was already registered")
		return
	end
	
	if not self.__checked then
		if self.__printOutput then
			print("[switch-output] Registered default case")
		end
		
		self.__defaultRegistered = true
		self.__checked = true
		func()
		return
	end
end

return Switch
