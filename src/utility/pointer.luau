--!strict

-- Copyright (c) 2026 Corridon Capital
-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at https://mozilla.org/MPL/2.0/.

-- Where a press is right now, in GetMouseLocation space. On a phone GetMouseLocation follows
-- whichever finger moved last, so a thumb on the movement stick would pull whatever the other
-- finger was dragging down to the stick. A touch reads its own InputObject instead, which keeps
-- following that one finger. InputObject.Position sits in AbsolutePosition space, one gui inset
-- above GetMouseLocation, so the inset goes back on.

local variables = require(script.Parent.variables)

local pointer = {}

function pointer.location(input: any?): Vector2
    if input and input.UserInputType == Enum.UserInputType.Touch and typeof(input.Position) == "Vector3" then
        local position = input.Position
        return Vector2.new(position.X, position.Y) + variables.guiService:GetGuiInset()
    end
    return variables.userInputService:GetMouseLocation()
end

return pointer
