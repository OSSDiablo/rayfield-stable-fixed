# Window

## CreateWindow

```lua
local Window = Rayfield:CreateWindow({
    name = "My Hub",
    subtitle = "v1.0",
    sidebarLayout = true,
    theme = "Default",
    configuration = {
        autoSave = true,
        autoLoad = true,
        fileName = "MyHub",
    },
})
```

| Option | Type | What it does |
|---|---|---|
| `name` | string | Title in the header. Default "Astris Hub" |
| `subtitle` | string or `false` | Smaller line under the title. Leave it out to show the game being played, or `false` for none |
| `sidebarLayout` | boolean | `true` puts tabs down the left side. Default is tabs across the top |
| `icon` | number, string or `false` | Header logo. Leave it out for the built-in logo, pass an asset id for your own, or `false` for none |
| `themeTab` | boolean | `false` leaves out the built-in Theme tab |
| `homeTab` | boolean | `false` leaves out the built-in Home tab |
| `discordReminder` | boolean | `false` stops the Discord notification every 3 minutes |
| `discordInvite` | string | The invite the Home tab and the reminder show. Defaults to the Astris Hub server |
| `theme` | string or table | Starting theme. See [Themes and mobile](themes-and-mobile.md) |
| `configuration` | table | Saving. See [Getting started](getting-started.md#saving-settings) |
| `showName` | string | Text on the small pill shown when the window is hidden. Default "Astris Hub" |
| `showIcon` | number or string | Icon on that pill. Defaults to the header logo |
| `showIconOnly` | boolean | Show the pill as a round icon only, with no text |
| `profile` | string | Line under the player's name at the bottom of the sidebar |
| `locale` | string | Force a UI language. Defaults to the player's Roblox language |
| `translations` | table | Your own translations, keyed by language id |

## Tabs

```lua
local Main = Window:CreateTab({ name = "Main", icon = 10723424646 })
```

Every window has two built-in tabs. **Home** is always first and is the tab the menu opens on. It
shows live FPS, ping and player count, and a card for the Astris Hub Discord with a button that
copies the invite. **Theme** is always last. Your own tabs sit between them.

Tab methods:

| Method | What it does |
|---|---|
| `Tab:Select()` | Switch to this tab |
| `Tab:Remove()` | Delete the tab and everything in it |
| `Window:Navigate("Main")` | Switch to a tab by name (or pass the tab itself) |

### Sidebar headings

With `sidebarLayout = true` you can group tabs under headings. Each heading groups the tabs created
after it:

```lua
Window:CreateSection({ name = "Main" })
local Farm = Window:CreateTab({ name = "Farm" })
local Combat = Window:CreateTab({ name = "Combat" })

Window:CreateSection({ name = "Other" })
local Misc = Window:CreateTab({ name = "Misc" })
```

## Notifications

Notifications stack in the top right corner, newest first, just under the Roblox top bar.

Every 3 minutes the window posts a notification asking players to join the Astris Hub Discord.
Turn it off with `discordReminder = false`.

```lua
Window:Notify({
    title = "Done",
    content = "Auto Farm started.",
    icon = 10723424646, -- optional
    duration = 5,       -- optional, seconds. Picked from the text length if left out
})
```

A toast is a smaller pill at the top or bottom of the screen:

```lua
Window:Toast({
    title = "Saved",
    subtitle = "Your settings were saved",
    duration = 3,
    position = "Top", -- or "Bottom"
})
```

## Popups

A popup is a card in the middle of the screen with buttons at the bottom:

```lua
Window:Popup({
    title = "Rejoin server?",
    content = "You will lose your current progress.",
    options = {
        { text = "Cancel" },
        {
            text = "Rejoin",
            style = "danger", -- "neutral" (default), "primary" or "danger"
            callback = function()
                game:GetService("TeleportService"):Teleport(game.PlaceId)
            end,
        },
    },
})
```

Any button closes the popup after running its callback. Set `dismissable = false` to stop
players closing it by tapping outside.

## Tags

Small labels in the header, next to the title:

```lua
local Tag = Window:CreateTag({ text = "Beta", color = Color3.fromRGB(255, 170, 0) })
Tag:SetText("Stable")
Tag:Remove()
```

## Showing and hiding

| Method | What it does |
|---|---|
| `Window:Show()` | Open the window |
| `Window:Hide()` | Hide it down to the small pill |
| `Window:ToggleHide()` | Switch between the two |
| `Window:ToggleMinimise()` | Collapse to just the header, or expand again |
| `Window:Unload()` | Remove the whole UI and stop every callback |

Players can also hide and show the window with a key, K by default. They can change the key in
the settings page (the cog in the header).

## Configs

With `configuration` set, the window saves on its own. You can also save named configs yourself:

```lua
Window:Save("Legit")          -- save everything under the name "Legit"
Window:Load("Legit")          -- load it back
print(Window:ListConfigs())   -- every saved name
Window:DeleteConfig("Legit")
```

Reading and writing single values:

```lua
Window:Get("AutoFarm")        -- same as Window.Flags.AutoFarm
Window:Set("AutoFarm", true)
```

Next: [Elements](elements.md).
