# Elements

Every element is created on a tab. Most take `name`, an optional `description` shown under it, an
optional `icon`, and a `callback`.

Elements that hold a value also take:

- `flag`: the name it is saved under. See [saving](getting-started.md#saving-settings)
- `forgetState = true`: never save this one
- `value`: the starting value

and have `Set(value, skipCallback)`. Pass `true` as the second argument to change the value without
running the callback.

Every element you can press or change also has `Lock(reason)`, `Unlock()` and `IsLocked()`. A
locked element is dimmed, ignores input and does not run its callback.

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

`Tab:CreateSwitch` is the same thing under another name.

## Slider

```lua
local Slider = Tab:CreateSlider({
    name = "Walk Speed",
    range = { 16, 100 }, -- default { 0, 100 }
    increment = 1,       -- default 1
    value = 16,
    suffix = " studs",
    flag = "WalkSpeed",
    callback = function(value, dragging)
        -- dragging is true while the player is still holding the handle
        print(value)
    end,
})

Slider:Set(50)
```

`minimal = true` draws only the track, with no name or value. Useful inside a row.

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

With `multiSelect = true` the player can pick several, `value` takes a table, and the callback gets a
table:

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

| Option | What it does |
|---|---|
| `numeric = true` | Only allow numbers |
| `clearOnFocus = true` | Empty the box when the player taps into it |

## Keybind

```lua
Tab:CreateKeybind({
    name = "Toggle Fly",
    value = Enum.KeyCode.F, -- or the name, "F"
    flag = "FlyKey",
    callback = function(key)
        print("pressed", key)
    end,
})
```

With `hold = true` the callback gets `true` once the key has been held (0.2 seconds by default,
change it with `holdThreshold`) and `false` when it is let go. `onChanged` runs when the player binds
a different key.

## Color picker

```lua
local Picker = Tab:CreateColorPicker({
    name = "ESP Color",
    color = Color3.fromRGB(255, 0, 0), -- a hex string like "#ff0000" works too
    alpha = 1,
    flag = "EspColor",
    callback = function(color, alpha)
        print(color, alpha)
    end,
})

Picker:Set(Color3.fromRGB(0, 255, 0))
Picker:SetAlpha(0.5)
```

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

| Option | What it does |
|---|---|
| `prefix`, `suffix` | Text before and after the number |
| `display = "change"` | Show how much the value changed instead of the value itself |
| `changeMode` | `"percentage"` (default) or `"absolute"` |
| `changeBaseline` | Compare with the `"previous"` value (default) or the `"initial"` one |
| `compact = true` | Smaller card, good inside a row |

## Progress

```lua
local Progress = Tab:CreateProgress({
    name = "Quest",
    range = { 0, 10 },
    value = 3,
})

Progress:Set(4)
print(Progress:GetPercentage()) -- 0.4
```

| Option | What it does |
|---|---|
| `steps` | Draw the bar as this many segments |
| `text` | A fixed label instead of the value |
| `format` | `function(value, min, max) return "..." end` to build the label yourself |
| `showValue = false` | Hide the label |
| `indeterminate = true` | A moving sweep, for work with no known length |

## Console

A scrolling block of text, like a log.

```lua
local Log = Tab:CreateConsole({
    name = "Log",
    height = 120,   -- pixels, default 120
    follow = true,  -- jump to the newest line
    maxLines = 200, -- oldest lines drop off past this
})

Log:Append("Started farming")
Log:Clear()
Log:Copy() -- copies the text, where the executor supports it
```

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
