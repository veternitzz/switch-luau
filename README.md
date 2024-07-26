# Switch.luau
Switch.luau is a switch implementation in pure luau.

## Why use a switch statement over an if-statement?
Switch statements are present in many other languages including C++ and Javascript. Switch statements overall make your code more readable rather than if statements.

### With switch statements:
```luau
local a = 10 -- this here is the variable we will be checking

local conditional = switch.new(a) -- create our switch statement

conditional.Case(468, "==", function() -- this is like an if statement
    print("Hello world")
end)

conditional:Case(11, "==" ,function() -- another if statement
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
You can install the switch module via github releases by downloading the .lua file under the latest release.
### Via Wally
You can also use wally to install the switch module by inserting: ``switch = "veternitzz/switch@2.0.0"`` into your wally config file.
> **Note:** No wally releases before 1.0.4 are stable, as I had a little bit of an issue publishing this module.
## Api Reference
### Constructors
**__switch.new()__**: metatable

**Parameters**
| Parameter Name  | Type  | Description           |
| --------------- | ----- | --------------------- |
| variable        | any   | The variable to check |

#### Methods (switch.new)
**__Switch:Debug()__**: nil

**Description**
Enables or disabled debug logging. This function was only designed for debugging and will print when a case or default is registered.

**Parameters**
| Parameter Name | Type    | Description                                |
| -------------- | ------- | ------------------------------------------ |
| enabled        | boolean | Whether to enable or disable debug logging |

**__Switch:Case()__**: nil

**Description**
Registers a case if the ``value`` is met and calls the parameter ``func``. There is no limit to how many cases you can have.

**Parameters**
| Parameter Name | Type                      | Description                              |
| -------------- | ------------------------- | ---------------------------------------  |
| value          | any                       | The value to compare the variable to     |
| operation      | "~=" | "==" | ">" | "<"   | The operation to perform                 |
| func           | any (must be a function)  | The function to call if the value is met |

**Usage Example**
```luau
local a = 47

local conditional = switch.new(a)

-- Because the operation is ~= (not equal to), the output will be "Hello world"
conditional:Case(46, "~=", function()
    print("Hello world")
end)
```
**__Switch:Default()__**: nil

**Description**
The default case. This acts as an else statement and will call the ``func`` parameter if no cases are met. There may be only one registered default case per constructor.

**Parameters**
| Parameter Name | Type                     | Description                               |
| -------------- | ------------------------ | ----------------------------------------- |
| func           | any (must be a function) | The function to call if the value is met  |

**Usage Example**
```luau
local a = 57

local conditional = switch.new(a)

conditional:Case(56, "==", function()
    print("56")
end)

-- The output will be: "Default"
conditional:Default(function()
    print("Default")
end)
```
