require "ui"

local i = input.get()
-- maybe zero out prev_i

while true do
    -- get input
    local prev_i = i
    i = input.get()

    -- do ui stuff
    Update_ui(i, prev_i)
    Draw_ui()

    -- advance if not paused
    -- if not prev_i["P"] and Toggles.pause.on then
    --     emu.pause()
    -- end
    
    emu.frameadvance()
end