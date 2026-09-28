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
| `name` | string | Title in the header |
| `subtitle` | string | Smaller line under the title |
| `sidebarLayout` | boolean | `true` puts tabs down the left side. Default is tabs across the top |
| `icon` | number, string or `false` | Header logo. Leave it out for the built-in logo, pass an asset id for your own, or `false` for none |
| `themeTab` | boolean | `false` leaves out the built-in Theme tab |
| `theme` | string or table | Starting theme. See [Themes and mobile](themes-and-mobile.md) |
| `configuration` | table | Saving. See [Getting started](getting-started.md#saving-settings) |
| `showName` | string | Text on the small pill shown when the window is hidden |
| `showIcon` | number or string | Icon on that pill |
| `showIconOnly` | boolean | Show the pill as a round icon only, with no text |
| `profile` | string | Line under the player's name at the bottom of the sidebar |
| `locale` | string | Force a UI language. Defaults to the player's Roblox language |
| `translations` | table | Your own translations, keyed by language id |

## Tabs

```lua
local Main = Window:CreateTab({ name = "Main", icon = 10723424646 })
```

The first tab you create opens first. The built-in Theme tab always stays last.

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
