# Switch.luau
Switch.luau is a switch implementation in pure luau.

## Why use a switch statement over an if-statement?
Switch statements, popular in many programming languages, offer a cleaner and more readable solution to deeply nested if-else statements. Switch statements also handle fall-through cases and defaults, reducing the chances of logic errors. 

### With switch statements:
```luau
local Switch = require(...) -- Change ... to the path of the ModuleScript

local numberVariable = 10 -- this here is the variable we will be checking

Switch.new(numberVariable)
    :Case(468, "==", function()
        print("numberVariable is equal to 468")
    end)
    :Case(20, ">", function()
        print("numberVariable is greater than 20")
    end)
    :Default(function()
        print("numberVariable doesn't match the cases")
    end)
```
Output: ``numberVariable doesn't match the cases``

### Without switch statements
```luau
local numberVariable = 10 -- this is the variable we will be checking

if numberVariable == 468 then
    print("numberVariable is equal to 468")
elseif numberVariable == 11 then
    print("numberVariable is greater than 20")
else
    print("numberVariable doesn't match the cases")
end
```
Output: ``numberVariable doesn't match the cases``

### Conclusion
Ultimately, switch statements are more readable. Especially if you have a lot of nested if-statements in your code. Switch statements allow us to space out our cases as much as we want. They also make it easier to remove a condition.

Switch statements are also more diverse. You can switch it up and define your default function before your cases; or, you can define a default in between two cases.

## Installation

### Via Github Releases
You can install the switch module via github releases by downloading the .rbxl file under the latest release.
### Via Wally
You can also use wally to install the switch module by inserting: ``switch = "veternitzz/switch@2.1.1"`` into your wally config file.
> **Note:** No wally releases before 1.0.4 are stable, as I had a little bit of an issue publishing this module.