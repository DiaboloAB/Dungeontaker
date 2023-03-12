require "src.my_math"

function move_slime(slime)
    local p_pos = {}
    local s_pos = {}
    local dir = {}
    p_pos.x = player_pose[map_nb][1]
    p_pos.y = player_pose[map_nb][2]
    s_pos.x = slime.pos[1]
    s_pos.y = slime.pos[2]
    dir.x = 0
    dir.y = 0
    if my_abs(p_pos.x - s_pos.x) > my_abs(p_pos.y - s_pos.y) then
        dir.x = my_sign(p_pos.x - s_pos.x)
        goto this_next  
    end
    dir.y = my_sign(p_pos.y - s_pos.y)  
    ::this_next::
    slime.pos[1] = slime.pos[1] + dir.x
    slime.pos[2] = slime.pos[2] + dir.y
end