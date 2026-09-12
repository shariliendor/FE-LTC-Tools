-- each toggle has
-- on: activation boolean, 
-- key: key that flips toggle, 
-- text: text for ui
Toggles = {
    pause = {
        on = false,
        key = "P",
        text = "Pause",
    },

    debug = {
        on = false,
        key = "D",
        text = "Debug"
    },

    autoplay = {
        on = false,
        key = "A",
        text = "Autoplay"
    },

    step_mode = {
        on = false,
        key = "W",
        text = "Step Mode"
    },

    perfect_luck = {
        on = false,
        key = "L",
        text = "Perfect Luck"
    },

    hide_ui = {
        on = false,
        key = "H",
        text = "Hide UI"
    },

    disable_game_input = {
        on = false,
        key = "I",
        text = "Disable Game Input"
    }
}

Buttons = {
    set_rng = {
        pushed = false,
        key = "R",
        text = "Set RNG"
    },

    prev_action = {
        pushed = false,
        key = "Q",
        text = "Prev. Action"
    },

    next_action = {
        pushed = false,
        key = "E",
        text = "Next Action"
    }
}

-- the order in which toggles show up on the ui
-- put pause back in if i ever get it to work
local toggle_order = {"debug", "autoplay", "step_mode", "perfect_luck", "hide_ui", "disable_game_input"}
local button_order = {"set_rng", "prev_action", "next_action"}

-- updates the ui based in input on this frame and the previous one
function Update_ui(i, prev_i)
    -- flip toggles if necessary
    for _, t in ipairs(toggle_order) do
        local toggle = Toggles[t]
        
        -- if a key is down on this frame but not the previous one,
        -- flip the toggle bound to that key
        if not prev_i[toggle.key] and i[toggle.key] then
            toggle.on = not toggle.on
        end
    end
end

-- draws the ui
function Draw_ui()
    -- don't draw the ui if its hidden
    if Toggles.hide_ui.on then return end

    local text_cursor = 0
    local text_height = 10

    for _, t in ipairs(toggle_order) do
        local toggle = Toggles[t]

        -- draw toggle text
        local toggle_status = "Off"
        if toggle.on then
            toggle_status = "On"
        end

        local toggle_text = "[" .. toggle.key .. "] " .. toggle.text .. ": " .. toggle_status
        gui.text(0, text_cursor, toggle_text)

        -- move text_cursor down
        text_cursor = text_cursor + text_height
    end

    for _, b in ipairs(button_order) do
        local button  = Buttons[b]

        -- draw button text
        local button_text = "[" .. button.key .. "] " .. button.text
        gui.text(0, text_cursor, button_text)

        -- move text_cursor down
        text_cursor = text_cursor + text_height
    end
end