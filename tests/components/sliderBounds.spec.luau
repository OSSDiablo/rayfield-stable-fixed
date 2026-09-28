local helpers = (_G :: any).__RAYFIELD_TEST_HELPERS

return function()
    local Window = helpers.requireComponent("window")

    describe("component slider bounds", function()
        local window

        local function makeSlider(properties)
            window = Window.new({
                name = "Slider Bounds",
                configuration = { autoSave = false, autoLoad = false },
            })
            local tab = window:CreateTab({ name = "Main" })
            return tab:CreateSlider(properties)
        end

        afterEach(function()
            if window and not window.unloaded then
                window:Unload()
            end
            window = nil

            helpers.services.UserInputService._setMouseLocation(Vector2.new(120, 80))
            helpers.services.UserInputService._setMouseButtonPressed(false)
            helpers.services.GuiService._setGuiInset(Vector2.new(0, 0))
        end)

        -- The harness lays nothing out, so the track is given a width and a place on screen by hand
        local function placeTrack(slider, left, width)
            slider.track.AbsolutePosition = Vector2.new(left, 0)
            slider.track.AbsoluteSize = Vector2.new(width, 14)
        end

        local function pointAt(x)
            helpers.services.UserInputService._setMouseLocation(Vector2.new(x, 8))
        end

        -- Where the pill lands, in pixels from the left of the track. Its right edge sits on the
        -- fill's end, so its centre is half a pill back from there.
        local function fillEnd(slider, width)
            local fill = slider.progress.Size.X
            return fill.Scale * width + fill.Offset
        end

        local function pillCentre(slider, width)
            return fillEnd(slider, width) - slider.handle.Size.X.Offset / 2
        end

        local function pillEdges(slider, width)
            local right = fillEnd(slider, width)
            return right - slider.handle.Size.X.Offset, right
        end

        local function near(a, b)
            return math.abs(a - b) <= 1
        end

        local function finite(n)
            return n == n and n ~= math.huge and n ~= -math.huge
        end

        it("keeps the pill inside the track at both ends", function()
            local slider = makeSlider({
                name = "Volume",
                range = { 0, 100 },
                increment = 1,
                value = 0,
                forgetState = true,
            })

            for _, width in { 420, 222, 160, 60 } do
                placeTrack(slider, 0, width)

                slider:Set(0)
                slider:_renderProgress()
                local left = pillEdges(slider, width)
                expect(near(left, 0)).to.equal(true) -- flush with the track's start

                slider:Set(100)
                slider:_renderProgress()
                local _, right = pillEdges(slider, width)
                expect(near(right, width)).to.equal(true) -- and flush with its end
            end
        end)

        it("puts the pill's centre on the value along its travel", function()
            local slider = makeSlider({
                name = "Volume",
                range = { 0, 100 },
                increment = 1,
                value = 0,
                forgetState = true,
            })

            local width = 200
            placeTrack(slider, 0, width)

            -- the centre travels from half a pill in to half a pill short: 17.5 to 182.5
            for _, case in { { 0, 17.5 }, { 25, 58.75 }, { 50, 100 }, { 100, 182.5 } } do
                slider:Set(case[1])
                slider:_renderProgress()
                expect(near(pillCentre(slider, width), case[2])).to.equal(true)
            end
        end)

        it("maps the pointer onto the pill's travel", function()
            local slider = makeSlider({
                name = "Volume",
                range = { 0, 100 },
                increment = 1,
                value = 0,
                forgetState = true,
            })

            placeTrack(slider, 100, 200)

            -- a press grows the pill to 41 first, so the travel starts half of that in (120.5)
            -- and runs 200 - 41 = 159
            pointAt(160.25)
            slider.interact.InputBegan:Fire({ UserInputType = Enum.UserInputType.MouseButton1 })
            expect(slider.value).to.equal(25)

            pointAt(200)
            helpers.services.RunService.RenderStepped:Fire()
            expect(slider.value).to.equal(50)

            -- past either end clamps rather than running away
            pointAt(20)
            helpers.services.RunService.RenderStepped:Fire()
            expect(slider.value).to.equal(0)

            pointAt(9999)
            helpers.services.RunService.RenderStepped:Fire()
            expect(slider.value).to.equal(100)

            helpers.services.UserInputService.InputEnded:Fire({ UserInputType = Enum.UserInputType.MouseButton1 })
            expect(slider.dragging).to.equal(false)
        end)

        it("carries the pill with the fill instead of positioning it twice", function()
            local slider = makeSlider({
                name = "Volume",
                range = { 0, 100 },
                value = 40,
                forgetState = true,
            })

            placeTrack(slider, 0, 200)
            slider:_renderProgress()

            -- the pill lives inside the fill, its right edge pinned to the fill's end, so the
            -- fill's size is the only thing that has to move
            expect(slider.handle.Position.X.Scale).to.equal(1)
            expect(slider.handle.Position.X.Offset).to.equal(0)
            expect(slider.handle.AnchorPoint.X).to.equal(1)

            local before = slider.handle.Position
            slider:Set(90)
            slider:_renderProgress()
            expect(slider.handle.Position).to.equal(before)
            expect(near(pillCentre(slider, 200), 17.5 + 0.9 * 165)).to.equal(true)
        end)

        it("stays finite on a track narrower than the pill", function()
            local slider = makeSlider({
                name = "Volume",
                range = { 0, 100 },
                value = 50,
                forgetState = true,
            })

            placeTrack(slider, 0, 10) -- pill is 35 at rest
            slider:_renderProgress()

            local left, right = pillEdges(slider, 10)
            expect(finite(left)).to.equal(true)
            expect(finite(right)).to.equal(true)
            expect(slider.progress.Size.X.Scale >= 0).to.equal(true)

            -- and a drag on it still reads a value rather than dividing by nothing
            pointAt(5)
            slider.interact.InputBegan:Fire({ UserInputType = Enum.UserInputType.MouseButton1 })
            expect(finite(slider.value)).to.equal(true)
            helpers.services.UserInputService.InputEnded:Fire({ UserInputType = Enum.UserInputType.MouseButton1 })
        end)

        it("ignores a drag before the track has been laid out", function()
            local slider = makeSlider({
                name = "Volume",
                range = { 0, 100 },
                value = 50,
                forgetState = true,
            })

            placeTrack(slider, 0, 0)

            pointAt(40)
            slider.interact.InputBegan:Fire({ UserInputType = Enum.UserInputType.MouseButton1 })
            expect(slider.value).to.equal(50) -- untouched, no divide by zero
            helpers.services.UserInputService.InputEnded:Fire({ UserInputType = Enum.UserInputType.MouseButton1 })

            -- once it is laid out the same render puts the pill where the value says
            placeTrack(slider, 0, 200)
            slider:_renderProgress()
            expect(near(pillCentre(slider, 200), 100)).to.equal(true)
        end)

        it("grows the pill for a drag without moving what the fill owns", function()
            local slider = makeSlider({
                name = "Volume",
                range = { 0, 100 },
                value = 50,
                forgetState = true,
            })

            placeTrack(slider, 0, 200)
            slider:_renderProgress()

            local restWidth = slider.handle.Size.X.Offset
            slider:_setHeld(true)
            expect(slider.handle.Size.X.Offset > restWidth).to.equal(true)

            -- the fill makes room for the wider pill, so its centre stays on the value
            expect(near(pillCentre(slider, 200), 100)).to.equal(true)

            slider:_setHeld(false)
            expect(slider.handle.Size.X.Offset).to.equal(restWidth)
        end)
    end)
end
