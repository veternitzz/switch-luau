local Switch = require(script.ModuleScript)

local tests = {}

tests["1st case should execute"] = function()
	local jobsVariable = "Engineer"
	local case1Executed = false
	local case2Executed = false
	local defaultExecuted = false

	Switch.New(jobsVariable)
		:case("Engineer", "==", function()
			case1Executed = true
		end)
		:case("Artist", "==", function()
			case2Executed = true
		end)
		:default(function()
			defaultExecuted = true
		end)

	assert(case1Executed, "Case 1 did not execute correctly")
	assert(not case2Executed, "Case 2 should not execute")
	assert(not defaultExecuted, "Default should not execute")
end

tests["default should execute"] = function()
	local jobsVariable = "Construction"
	local case1Executed = false
	local case2Executed = false
	local defaultExecuted = false

	Switch.New(jobsVariable)
		:case("Engineer", "==", function()
			case1Executed = true
		end)
		:case("Artist", "==", function()
			case2Executed = true
		end)
		:default(function()
			defaultExecuted = true
		end)

	assert(defaultExecuted, "Default did not execute correctly")
	assert(not case1Executed, "Case 1 should not execute")
	assert(not case2Executed, "Case 2 should not execute")
end

tests["not equal case should execute"] = function()
	local jobsVariable = "Doctor"
	local caseExecuted = false

	Switch.New(jobsVariable)
		:case("Engineer", "~=", function()
			caseExecuted = true
		end)
		:default(function()
			caseExecuted = false
		end)

	assert(caseExecuted, "Case with ~= did not execute correctly")
end

tests["greater than case should execute"] = function()
	local ageVariable = 25
	local caseExecuted = false

	Switch.New(ageVariable)
		:case(20, ">", function()
			caseExecuted = true
		end)
		:default(function()
			caseExecuted = false
		end)

	assert(caseExecuted, "Case with > did not execute correctly")
end

tests["less than case should execute"] = function()
	local ageVariable = 15
	local caseExecuted = false

	Switch.New(ageVariable)
		:case(20, "<", function()
			caseExecuted = true
		end)
		:default(function()
			caseExecuted = false
		end)

	assert(caseExecuted, "Case with < did not execute correctly")
end

tests["greater than or equal case should execute"] = function()
	local ageVariable = 20
	local caseExecuted = false

	Switch.New(ageVariable)
		:case(20, ">=", function()
			caseExecuted = true
		end)
		:default(function()
			caseExecuted = false
		end)

	assert(caseExecuted, "Case with >= did not execute correctly")
end

tests["less than or equal case should execute"] = function()
	local ageVariable = 20
	local caseExecuted = false

	Switch.New(ageVariable)
		:case(20, "<=", function()
			caseExecuted = true
		end)
		:default(function()
			caseExecuted = false
		end)

	assert(caseExecuted, "Case with <= did not execute correctly")
end

tests["only one case should execute"] = function()
	local jobsVariable = "Engineer"
	local case1Executed = false
	local case2Executed = false
	local defaultExecuted = false

	Switch.New(jobsVariable)
		:case("Engineer", "==", function()
			case1Executed = true
		end)
		:case("Engineer", "==", function()
			case2Executed = true
		end)
		:default(function()
			defaultExecuted = true
		end)

	assert(case1Executed, "Case 1 did not execute correctly")
	assert(not case2Executed, "Case 2 should not execute")
	assert(not defaultExecuted, "Default should not execute")
end

tests["default registered twice should error"] = function()
	local jobsVariable = "Construction"
	local errorOccurred = false

	local switch = Switch.New(jobsVariable)
		:default(function() end)

	local success, errorMessage = pcall(function()
		switch:default(function() end)
	end)

	if not success and string.find(errorMessage, "Default was already registered") then
		errorOccurred = true
	end

	assert(errorOccurred, "Expected error did not occur when registering default twice")
end

local testCount, passedTests, failedTests = 0,0,0

for testName, testFunction in tests do 
	testCount += 1
	print(`Running test: {testName}`)
	local success, failure = pcall(testFunction)
	if success then 
		passedTests += 1
		print(`Test {testName} succeeded`)
	else 
		failedTests += 1
		warn(`Test {testName} failed: {failure}`)
	end
end 

print(`{passedTests} / {testCount} tests passed`)
