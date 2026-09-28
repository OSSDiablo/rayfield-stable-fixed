# Elements

Every element is created on a tab (or inside a [group](layout.md#groups-elements-side-by-side)).

## Shared options

Most elements take these:

| Option | Type | What it does |
|---|---|---|
| `name` | string | The label |
| `description` | string | A smaller line under the label |
| `icon` | number or string | An image asset id shown before the label |
| `callback` | function | Runs when the player changes the element |

Elements that hold a value also take:

| Option | Type | What it does |
|---|---|---|
| `value` | depends | The starting value |
| `flag` | string | The name it is saved under. See [saving](getting-started.md#saving-settings) |
| `forgetState` | boolean | `true` keeps this element out of the save |

and have these methods:

| Method | What it does |
|---|---|
| `Element:Set(value)` | Change the value and run the callback |
| `Element:Set(value, true)` | Change the value without running the callback |
| `Element.value` | Read the current value |

Everything a player can press or change can also be locked. A locked element is dimmed, ignores
input and does not run its callback:

```lua
Toggle:Lock("Buy the gamepass to use this")
Toggle:Unlock()
print(Toggle:IsLocked())
```

---

## Button

```lua
Tab:CreateButton({
    name = "Teleport to spawn",
    description = "Takes you back to the start",
    callback = function()
        print("pressed")
    end,
})
```

| Option | Type | What it does |
|---|---|---|
| `name` | string | Button text |
| `description` | string | Smaller line under it |
| `callback` | function | Runs on every press |

## Toggle

```lua
local Toggle = Tab:CreateToggle({
    name = "Auto Farm",
    value = false,
    flag = "AutoFarm",
    callback = function(on)
        print(on) -- true or false
    end,
})

Toggle:Set(true)
print(Toggle.value)
```

| Option | Type | What it does |
|---|---|---|
| `value` | boolean | Starts on or off. Default off |
| `callback` | function | Gets `true` or `false` |

`Tab:CreateSwitch` is the same thing under another name.

## Slider

```lua
local Slider = Tab:CreateSlider({
    name = "Walk Speed",
    range = { 16, 100 },
    increment = 1,
    value = 16,
    suffix = " studs",
    flag = "WalkSpeed",
    callback = function(value, dragging)
        print(value)
    end,
})

Slider:Set(50)
```

| Option | Type | What it does |
|---|---|---|
| `range` | table | `{ min, max }`. Default `{ 0, 100 }` |
| `increment` | number | Step size. Default `1` |
| `value` | number | Starting value |
| `suffix` | string | Text after the number, like `" studs"` or `"%"` |
| `minimal` | boolean | Only the track, no name or value. Handy inside a row |
| `callback` | function | Gets the value, and `dragging`: `true` while the player still holds the handle |

Use `dragging` when the callback is expensive: preview while it is `true`, apply once it turns
`false`.

## Dropdown

```lua
local Dropdown = Tab:CreateDropdown({
    name = "Weapon",
    options = { "Sword", "Bow", "Staff" },
    value = "Sword",
    flag = "Weapon",
    callback = function(option)
        print(option) -- "Bow"
    end,
})
```

| Option | Type | What it does |
|---|---|---|
| `options` | table | The list of choices |
| `value` | string or table | Starting pick. A table when `multiSelect` is on |
| `multiSelect` | boolean | Let the player pick several |
| `placeholder` | string | Shown when nothing is picked. Default "None" |
| `callback` | function | Gets the pick as a string, or a table with `multiSelect` |

Picking several:

```lua
Tab:CreateDropdown({
    name = "Targets",
    options = { "Zombie", "Skeleton", "Boss" },
    multiSelect = true,
    value = { "Zombie" },
    callback = function(selected)
        print(table.concat(selected, ", "))
    end,
})
```

| Method | What it does |
|---|---|
| `Dropdown:Set("Bow")` | Pick an option (a table for multi-select) |
| `Dropdown:Refresh({ "A", "B" })` | Replace the whole option list |
| `Dropdown:Add("C")` | Add one option |
| `Dropdown:Remove("A")` | Remove one option |

`Dropdown.value` is always a table, even for single-select.

## Input

```lua
local Input = Tab:CreateInput({
    name = "Player name",
    placeholder = "Type a name",
    flag = "TargetName",
    callback = function(text)
        print(text)
    end,
})
```

| Option | Type | What it does |
|---|---|---|
| `value` | string | Starting text |
| `placeholder` | string | Grey text shown while empty |
| `numeric` | boolean | Only allow numbers |
| `clearOnFocus` | boolean | Empty the box when the player taps into it |
| `callback` | function | Gets the text |

## Keybind

```lua
Tab:CreateKeybind({
    name = "Toggle Fly",
    value = Enum.KeyCode.F,
    flag = "FlyKey",
    callback = function(key)
        print("pressed", key)
    end,
})
```

| Option | Type | What it does |
|---|---|---|
| `value` | KeyCode or string | The starting key, as `Enum.KeyCode.F` or `"F"` |
| `hold` | boolean | Fire `true` once the key is held and `false` on release |
| `holdThreshold` | number | Seconds before a hold counts. Default `0.2` |
| `callback` | function | Gets the key on press, or `true`/`false` with `hold` |
| `onChanged` | function | Runs when the player binds a different key |

## Color picker

```lua
local Picker = Tab:CreateColorPicker({
    name = "ESP Color",
    color = Color3.fromRGB(255, 0, 0),
    flag = "EspColor",
    callback = function(color, alpha)
        print(color, alpha)
    end,
})

Picker:Set(Color3.fromRGB(0, 255, 0))
Picker:SetAlpha(0.5)
```

| Option | Type | What it does |
|---|---|---|
| `color` | Color3 or string | Starting colour. A hex string like `"#ff0000"` works too |
| `alpha` | number | Starting opacity, 0 to 1. Default `1` |
| `callback` | function | Gets the colour and the alpha |

## Stat

A card that shows a number. The number rolls to its new value when it changes.

```lua
local Coins = Tab:CreateStat({
    name = "Coins",
    value = 0,
    prefix = "$",
})

Coins:Set(1500)
```

| Option | Type | What it does |
|---|---|---|
| `value` | number | Starting number |
| `prefix`, `suffix` | string | Text before and after the number |
| `display` | string | `"value"` (default) or `"change"` to show how much it moved |
| `changeMode` | string | `"percentage"` (default) or `"absolute"` |
| `changeBaseline` | string | Compare with the `"previous"` value (default) or the `"initial"` one |
| `compact` | boolean | Smaller card. Always on inside a row |

`Set` takes a number only.

## Progress

```lua
local Quest = Tab:CreateProgress({
    name = "Quest",
    range = { 0, 10 },
    value = 3,
})

Quest:Set(4)
print(Quest:GetPercentage()) -- 0.4
```

| Option | Type | What it does |
|---|---|---|
| `range` | table | `{ min, max }`. Default `{ 0, 1 }` |
| `value` | number | Starting value |
| `steps` | number | Draw the bar as this many segments |
| `text` | string | A fixed label instead of the value |
| `format` | function | `function(value, min, max) return "..." end` to build the label |
| `showValue` | boolean | `false` hides the label |
| `indeterminate` | boolean | A moving sweep, for work with no known length |

## Console

A scrolling block of text, like a log.

```lua
local Log = Tab:CreateConsole({
    name = "Log",
    height = 120,
    follow = true,
    maxLines = 200,
})

Log:Append("Started farming")
Log:Clear()
Log:Copy()
```

| Option | Type | What it does |
|---|---|---|
| `height` | number | Height in pixels. Default `120` |
| `follow` | boolean | Jump to the newest line on every `Append` |
| `maxLines` | number | Oldest lines drop off past this. Default `200` |
| `text` | string | Starting text |

`Copy` returns `false` on executors that cannot copy to the clipboard.

## Moving elements

Every element can be moved within its tab after it is made:

```lua
Button:MoveToTop()
Button:MoveToBottom()
Button:MoveUp()
Button:MoveDown()
Button:MoveTo(3)
```

Next: [Layout](layout.md).
