# Themes and mobile

## Built-in themes

`Default`, `Amethyst`, `Cobalt`, `Ember`, `Frost` and `Rose`.

Pick one when you make the window:

```lua
local Window = Rayfield:CreateWindow({ name = "My Hub", theme = "Ember" })
```

or change it later:

```lua
Window:ChangeTheme("Frost")
```

## The Theme tab

Every window has a Theme tab, always last in the tab list, where players pick a theme from a
dropdown. The change shows right away and is saved, so it is still there next time they run your
script. A player's pick wins over the `theme` you set in `CreateWindow`.

To leave the tab out:

```lua
Rayfield:CreateWindow({ name = "My Hub", themeTab = false })
```

## Custom themes

Pass a table instead of a name. Anything you leave out comes from the Default theme, so you only
list what you want to change:

```lua
Window:ChangeTheme({
    AccentColor = Color3.fromRGB(255, 90, 90),  -- toggles and sliders when on
    AccentStroke = Color3.fromRGB(255, 140, 140),
    TitlingColor = Color3.fromRGB(255, 255, 255), -- title text and the header logo
    CornerRoundness = UDim.new(0, 12),          -- window corners
})
```

The full list of keys is in [`src/themes/default.luau`](../src/themes/default.luau).

## Header logo

The window shows a logo next to its title by default. To use your own, pass an image asset id, or
`false` for no logo:

```lua
Rayfield:CreateWindow({ name = "My Hub", icon = 10723424646 })
Rayfield:CreateWindow({ name = "My Hub", icon = false })
```

The built-in logo ships inside the library and is loaded with `getcustomasset`, so it shows on any
executor that supports custom assets. It does not show in Roblox Studio.

## On phones

Nothing to set up. On a touch screen shorter than 600 pixels (a phone held sideways, which is how
Roblox runs on phones) the library:

- draws the whole window smaller, so more fits on screen and the window is narrower and taller
  than it would be at full size
- keeps the header buttons (search, settings, minimise, close) easy to tap
- draws popups, notifications and toasts at the same smaller size
- keeps everything else, like sliders, dropdowns and the drag bar, lined up at the smaller size

Tablets and computers get the normal size.

## Moving the window

Drag the window by its header or by the bar under it. It can be pushed partly off the left, right
and bottom of the screen, but never past the top, so the header is always there to grab it back.

Players who want the whole window kept on screen can turn on "Keep window on screen" in the
settings page (the cog in the header).
