# FAQ

## I pushed a change but the old version still loads

GitHub caches `main` links for a few minutes after a push, and adding `?t=...` to the URL does not
always get around it. Load from a commit instead. A commit link never changes, so it cannot be
stale:

```lua
local sha = "put-the-commit-hash-here"
local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/OSSDiablo/rayfield-preview-fixed/" .. sha .. "/dist/rayfield.luau"))()
```

The first line of the library says which build you have:
`-- Rayfield Preview Fixed v1.2.0 by Astris Hub (...)`.

## My icon does not show up

Icons must be image asset ids: a number like `10723424646`, or a string like
`"rbxassetid://10723424646"`. A name such as `"home"` shows nothing, and no error is printed.

## The logo in the header is missing

The built-in logo is loaded with `getcustomasset`, which only executors have. It does not show in
Roblox Studio, and it does not show on an executor without custom asset support. Pass your own
`icon` if you need one everywhere.

## "Copy Discord invite" does nothing

Copying needs `setclipboard`. On executors without it the button shows the invite in a toast
instead, so the player can type it in.

## How do I remove the Home tab, the Theme tab or the Discord reminder?

```lua
Rayfield:CreateWindow({
    name = "My Hub",
    homeTab = false,
    themeTab = false,
    discordReminder = false,
})
```

`discordInvite = "https://discord.gg/..."` keeps them but points them at your own server.

## Where are settings saved?

In the executor's workspace folder:

| File | What is in it |
|---|---|
| `Rayfield/Configurations/<fileName>.rfld` | Every element with a `flag`, per script |
| `Rayfield/Settings/rayfield.rfld` | The menu's own settings: theme pick, toggle key, keep on screen |

## The menu is too big or too small on my phone

Sizing is automatic. A phone held sideways gets a smaller window with smaller text, and a tablet or
computer gets the full size. There is nothing to set. If it looks wrong on a device, open an issue
with a screenshot and the phone model.

## The window went off screen

Drag it back by its header: the header can never leave the top of the screen, and it always keeps
a strip on screen at the sides and bottom. Players who want the whole window kept on screen can
turn on "Keep window on screen" in the settings page (the cog in the header). "Reset Window
Position" on the same page puts it back in the middle.

## Does my old Rayfield script work?

For the common elements, yes. The original Rayfield option names work alongside the new camelCase
ones: `Name`, `Callback`, `Flag`, `CurrentValue`, `Range`, `Increment`, `Options`, `CurrentOption`,
`CurrentKeybind`, `HoldToInteract` and `PlaceholderText`. Check anything more unusual against the
[Elements](elements.md) page.
