# Rayfield Stable Fixed

## What's different from Gen2

<div class="features">
<div class="feature"><h3>Fits on a phone</h3><p>A phone held sideways gets a smaller window with smaller text, so more fits and nothing covers the game.</p></div>
<div class="feature"><h3>Drag it anywhere</h3><p>The window can hang off the sides and bottom, but never past the top, so the header is always there to grab.</p></div>
<div class="feature"><h3>Home tab built in</h3><p>Opens first, with live FPS, ping and player count, and a card to join the Astris Hub Discord.</p></div>
<div class="feature"><h3>Theme tab built in</h3><p>Players pick from six themes. Their pick is saved and wins over the script's own.</p></div>
<div class="feature"><h3>Same API as Gen2</h3><p>Any Gen2 script runs unchanged, and the original Rayfield option names still work.</p></div>
<div class="feature"><h3>Your logo by default</h3><p>The Astris logo sits in the header and on the hide pill until you set your own.</p></div>
</div>

## Quick start

```lua
local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/OSSDiablo/rayfield-stable-fixed/main/dist/rayfield.luau"))()

local Window = Rayfield:CreateWindow({
    name = "My Hub",
    subtitle = "by me",
    sidebarLayout = true,
})

local Main = Window:CreateTab({ name = "Main", icon = 10723424646 })

Main:CreateToggle({
    name = "Auto Farm",
    flag = "AutoFarm",
    callback = function(on)
        print("Auto Farm:", on)
    end,
})
```

To see every element at once, run the demo:

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/OSSDiablo/rayfield-stable-fixed/main/dist/test.luau"))()
```

## Where to next

<div class="cards">
<a class="card" href="getting-started.md"><h3>Getting started</h3><p>Loading, your first window, callbacks and saving.</p></a>
<a class="card" href="window.md"><h3>Window</h3><p>Window options, tabs, notifications, popups and configs.</p></a>
<a class="card" href="elements.md"><h3>Elements</h3><p>Every element with its options and methods.</p></a>
<a class="card" href="layout.md"><h3>Layout</h3><p>Sections, text, dividers and side-by-side groups.</p></a>
<a class="card" href="themes-and-mobile.md"><h3>Themes and mobile</h3><p>Built-in and custom themes, and how phones are handled.</p></a>
<a class="card" href="example.md"><h3>Full example</h3><p>A complete hub script to copy and change.</p></a>
</div>
