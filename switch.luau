--[[
	Made by: veternitzz (@alex_black20101)
	
	A switch implementation in pure luau. Documentation and a usage example can be found on the github
	linked below:
	
	https://github.com/veternitzz/switch-luau/
]]

function Switch(variable: any)
	local conditionValid = false
	
	return {
		Case = function(condition: any, func: any)
			
			
			if variable == condition and not conditionValid then
				func()
				conditionValid = true
				
				return
			end
		end,
		
		Default = function(func: any)
			if not conditionValid then
				func()
				return
			end
		end,
	}
end

return {Switch = Switch}
