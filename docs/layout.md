# Layout

## Section

A heading inside a tab:

```lua
Tab:CreateSection({ name = "Movement" })
```

## Text

A title with a paragraph under it. Either half can be left out.

```lua
local Info = Tab:CreateText({
    name = "How to use",
    text = "Turn on Auto Farm and stand near the enemies.",
})

Info:Set("New body text")
Info:SetTitle("New title")
```

## Divider

A line between elements, optionally with a word in the middle:

```lua
Tab:CreateDivider()
Tab:CreateDivider({ text = "or" })
Tab:CreateDivider({ line = false, spacing = 12 }) -- empty space only
```

## Groups: elements side by side

A group lays elements out in a row or a column. Groups nest, so a row of columns makes a grid.

```lua
local Row = Tab:CreateGroup() -- a row by default

Row:CreateButton({ name = "Save", callback = function() end })
Row:CreateButton({ name = "Load", callback = function() end })
```

Two columns:

```lua
local Columns = Tab:CreateGroup({ direction = "row" })

local Left = Columns:CreateGroup({ direction = "column" })
Left:CreateToggle({ name = "Auto Farm", callback = function() end })
Left:CreateToggle({ name = "Auto Sell", callback = function() end })

local Right = Columns:CreateGroup({ direction = "column" })
Right:CreateStat({ name = "Coins", value = 0, compact = true })
Right:CreateSlider({ name = "Range", range = { 5, 50 }, value = 20, callback = function() end })
```

What fits where:

| Element | In a row | In a column |
|---|---|---|
| Button, Toggle, Stat, Slider | yes | yes |
| Dropdown, Section, Text, Divider | no | yes |
| Input, Keybind, Color picker, Progress, Console | no | no, put them straight on the tab |

Next: [Themes and mobile](themes-and-mobile.md).
