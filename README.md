# Switch.luau
Switch.luau is a switch implementation in pure luau.

> **Note:** All issues under the "Known Issues" section in this file will be fixed once ``1.1.0`` releases.

## Why use a switch statement over an if-statement?
Switch statements are present in many other languages including C++ and Javascript. Switch statements overall make your code more readable rather than if statements.

### With switch statements:
```luau
local a = 10 -- this here is the variable we will be checking

local conditional = switch.Switch(a) -- create our switch statement

conditional.Case(468, function() -- this is like an if statement
    print("Hello world")
end)

conditional.Case(11, function() -- another if statement
    print("11")
end)

conditional.Default(function() -- and this is like an else statement
    print("Default")
end)
```
Output: ``Default``

### Without switch statements
```luau
local a = 10 -- this is the variable we will be checking

if a == 468 then
    print("Hello world")
elseif a == 11 then
    print("11")
else
    print("Default")
end
```
Output: ``Default``

### Conclusion
Ultimately, switch statements are more readable. Especially if you have a lot of nested if-statements in your code. Switch statements allow us to space out our cases as much as we want. They also make it easier to remove a condition.

Switch statements are also more diverse. You can switch it up and define your default function before your cases; or, you can define a default in between two cases.

## Installation

### Via Github Releases
You can install the switch module via github releases by downloading the .rbxm file under the latest release.
### Via Wally
You can also use wally to install the switch module by inserting: ``switch = "veternitzz/switch@1.0.4"`` into your wally config file.
> **Note:** No wally releases before 1.0.4 are stable, as I had a little bit of an issue publishing this module.

## Known Issues (will be fixed in v1.1.0)
- Lack of a "switch" class
- No easy way to check if the variable is greater than, less than or not equal to using case
- Able to define default more than once
