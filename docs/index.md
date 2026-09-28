# Rayfield Gen2 Mobile

A build of [Rayfield Gen2](https://docs.sirius.menu/rayfield-gen2) that works properly on phones.
Same API as Gen2, so any Gen2 script runs on it unchanged.

```lua
local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/OSSDiablo/rayfield-gen2-mobile/main/dist/rayfield.luau"))()
```

## What's different from stock Gen2

- **Fits on a phone.** On a short touch screen the whole window is drawn smaller, so it comes out
  narrower and taller and shows more at once instead of desktop-sized rows filling the screen.
- **Bigger header buttons on phones.** Search, settings, minimise and close stay easy to tap.
- **Drag it anywhere.** The window can hang off the sides and bottom of the screen. It can never go
  past the top, so the header is always there to grab it back.
- **Minimise near the top works.** Restoring a minimised window parked at the top edge no longer
  pushes the header off screen.
- **Theme tab built in.** Every window gets a Theme tab where players pick the menu's look. Their
  pick is saved.
- **Header logo by default.** Shown next to the title unless you set your own.

## Quick start

```lua
local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/OSSDiablo/rayfield-gen2-mobile/main/dist/rayfield.luau"))()

local Window = Rayfield:CreateWindow({
    name = "My Hub",
    subtitle = "by me",
    sidebarLayout = true,
})

local Main = Window:CreateTab({ name = "Main" })

Main:CreateToggle({
    name = "Auto Farm",
    flag = "AutoFarm",
    callback = function(on)
        print("Auto Farm:", on)
    end,
})

Main:CreateSlider({
    name = "Walk Speed",
    range = { 16, 100 },
    value = 16,
    callback = function(speed)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = speed
    end,
})
```

To see every element at once, run the demo:

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/OSSDiablo/rayfield-gen2-mobile/main/dist/test.luau"))()
```

## Where to next

- [Getting started](getting-started.md): loading, your first window, how saving works
- [Window](window.md): window options, tabs, notifications, popups, configs
- [Elements](elements.md): every element with its options and methods
- [Layout](layout.md): sections, text, dividers and side-by-side groups
- [Themes and mobile](themes-and-mobile.md): built-in themes, custom themes, phone behaviour
