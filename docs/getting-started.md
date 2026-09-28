# Getting started

## Loading the library

```lua
local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/OSSDiablo/rayfield-preview-fixed/main/dist/rayfield.luau"))()
```

The first line of the file says which build you have, for example
`-- Rayfield Preview Fixed v1.2.0 by Astris Hub (...)`. Include it when you report a problem.

## Your first window

```lua
local Window = Rayfield:CreateWindow({
    name = "My Hub",
    subtitle = "v1.0",
    sidebarLayout = true, -- tabs down the left. Leave it out for tabs across the top
})
```

A window holds tabs, and tabs hold elements:

```lua
local Main = Window:CreateTab({ name = "Main", icon = 10723424646 }) -- lucide "home"

Main:CreateButton({
    name = "Say hello",
    callback = function()
        print("hello")
    end,
})
```

Icons are Roblox image asset ids (a number, or an `rbxassetid://` string). A plain name like
`"home"` does not work and shows nothing.

## Option names

Every option is written in camelCase (`name`, `callback`, `multiSelect`). The PascalCase spellings
from the original Rayfield (`Name`, `Callback`, `CurrentValue`...) also work, so older scripts keep
running.

## Callbacks

Each element calls its `callback` when the player changes it. What the callback receives depends on
the element: a toggle gets `true` or `false`, a slider gets the number, and so on. The
[Elements](elements.md) page lists each one.

Every element with a value also has a `Set` method so your script can change it:

```lua
local Farm = Main:CreateToggle({ name = "Auto Farm", callback = function(on) end })

Farm:Set(true)        -- turns it on and runs the callback
Farm:Set(false, true) -- turns it off without running the callback
```

## Saving settings

Elements with a `flag` are saved and loaded for the player:

```lua
local Window = Rayfield:CreateWindow({
    name = "My Hub",
    configuration = {
        autoSave = true,       -- save whenever something changes
        autoLoad = true,       -- load the last save when the window opens
        fileName = "MyHub",    -- defaults to the window name
        customFolder = "MyHub" -- optional folder to keep the file in
    },
})

Main:CreateToggle({ name = "Auto Farm", flag = "AutoFarm", callback = function(on) end })
```

Elements you create without a `flag` get one from their name. Pass `forgetState = true` on an
element to keep it out of the save.

You can also read and write saved values directly:

```lua
print(Window.Flags.AutoFarm)   -- current value
Window.Flags.AutoFarm = true   -- same as calling Set on the toggle
```

Next: [Window](window.md).
