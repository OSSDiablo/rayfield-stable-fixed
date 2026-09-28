# Full example

A complete hub script you can copy and change. It builds a window with three tabs, saved settings
and a notification. The built-in Home and Theme tabs are added for you.

```lua
local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/OSSDiablo/rayfield-stable-fixed/main/dist/rayfield.luau"))()

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local Window = Rayfield:CreateWindow({
    name = "Astris Hub",
    subtitle = "Example Game",
    configuration = {
        autoSave = true,
        autoLoad = true,
        fileName = "AstrisExample",
    },
})

-- Farming ---------------------------------------------------------------

local Farm = Window:CreateTab({ name = "Farm", icon = 10723395708 })

local farming = false

Farm:CreateToggle({
    name = "Auto Farm",
    description = "Attacks the nearest enemy for you",
    flag = "AutoFarm",
    callback = function(on)
        farming = on
    end,
})

Farm:CreateDropdown({
    name = "Target",
    options = { "Nearest", "Weakest", "Boss" },
    value = "Nearest",
    flag = "FarmTarget",
    callback = function(target)
        print("Now targeting:", target)
    end,
})

local Kills = Farm:CreateStat({ name = "Kills", value = 0 })

task.spawn(function()
    local kills = 0
    while task.wait(1) do
        if farming then
            kills += 1
            Kills:Set(kills)
        end
    end
end)

-- Player ----------------------------------------------------------------

local Player = Window:CreateTab({ name = "Player", icon = 10747373426 })

local function humanoid()
    local character = player.Character
    return character and character:FindFirstChildOfClass("Humanoid")
end

local Row = Player:CreateGroup()
Row:CreateSlider({
    name = "Walk Speed",
    range = { 16, 100 },
    value = 16,
    flag = "WalkSpeed",
    callback = function(speed)
        local h = humanoid()
        if h then
            h.WalkSpeed = speed
        end
    end,
})
Row:CreateSlider({
    name = "Jump Power",
    range = { 50, 200 },
    value = 50,
    flag = "JumpPower",
    callback = function(power)
        local h = humanoid()
        if h then
            h.UseJumpPower = true
            h.JumpPower = power
        end
    end,
})

Player:CreateKeybind({
    name = "Reset speed",
    value = Enum.KeyCode.R,
    callback = function()
        Window:Set("WalkSpeed", 16)
    end,
})

-- Misc ------------------------------------------------------------------

local Misc = Window:CreateTab({ name = "Misc", icon = 10709805144 })

Misc:CreateButton({
    name = "Rejoin server",
    callback = function()
        Window:Popup({
            title = "Rejoin?",
            content = "You will leave this server and join it again.",
            options = {
                { text = "Cancel" },
                {
                    text = "Rejoin",
                    style = "primary",
                    callback = function()
                        game:GetService("TeleportService"):Teleport(game.PlaceId, player)
                    end,
                },
            },
        })
    end,
})

Window:Notify({
    title = "Astris Hub loaded",
    content = "Open the menu with the pill at the top of the screen.",
})
```

## What each part does

- **`CreateWindow`** with `configuration` saves every element that has a `flag`, and loads it again
  next time the script runs.
- **Icons** are image asset ids. The ones above are from the Lucide set: `10723395708` is a gauge,
  `10747373426` people, `10709805144` a clock.
- **`CreateGroup`** puts the two sliders side by side.
- **`Window:Set("WalkSpeed", 16)`** changes a saved element from anywhere, by its flag.
- **`Window:Popup`** asks before doing something the player cannot undo.

Next: [FAQ](faq.md).
