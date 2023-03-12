require "src.my_math"
require "src.map"

function fantom_attack(slime)
    if (player_pose[map_nb][1] == slime.pos[1] + 1 and player_pose[map_nb][2] == slime.pos[2]) then
        reverse = -1
        love.audio.setVolume(1)
        love.audio.play(effect[1])
    end
    if (player_pose[map_nb][1] == slime.pos[1] - 1 and player_pose[map_nb][2] == slime.pos[2]) then
        reverse = -1
        love.audio.setVolume(1)
        love.audio.play(effect[1])
    end
    if (player_pose[map_nb][1] == slime.pos[1] and player_pose[map_nb][2] == slime.pos[2] + 1) then
        reverse = -1
        love.audio.setVolume(1)
        love.audio.play(effect[1])
    end
    if (player_pose[map_nb][1] == slime.pos[1] and player_pose[map_nb][2] == slime.pos[2] - 1) then
        reverse = -1
        love.audio.setVolume(1)
        love.audio.play(effect[1])
    end
    if (player_pose[map_nb][1] == slime.pos[1] and player_pose[map_nb][2] == slime.pos[2]) then
        reverse = -1
        love.audio.setVolume(1)
        love.audio.play(effect[1])
    end
end

function slime_attack(slime)
    if (player_pose[map_nb][1] == slime.pos[1] + 1 and player_pose[map_nb][2] == slime.pos[2]) then
        life = life - 1
        love.audio.setVolume(1)
        love.audio.play(effect[1])
    end
    if (player_pose[map_nb][1] == slime.pos[1] - 1 and player_pose[map_nb][2] == slime.pos[2]) then
        life = life - 1
        love.audio.setVolume(1)
        love.audio.play(effect[1])
    end
    if (player_pose[map_nb][1] == slime.pos[1] and player_pose[map_nb][2] == slime.pos[2] + 1) then
        life = life - 1
        love.audio.setVolume(1)
        love.audio.play(effect[1])
    end
    if (player_pose[map_nb][1] == slime.pos[1] and player_pose[map_nb][2] == slime.pos[2] - 1) then
        life = life - 1
        love.audio.setVolume(1)
        love.audio.play(effect[1])
    end
end

function move_zombie(slime, the_map)
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
    for i = 1, nb_monsters[map_nb] do
        if (monster[i].count ~= slime.count and monster[i].killed == false and
            monster[i].pos[1] == slime.pos[1] + dir.x and monster[i].pos[2] == slime.pos[2] + dir.y) then
            goto this_next_next
        end
    end
    for i = 1, nb_pot[map_nb] do
        if (pot_list[i].count ~= slime.count and pot_list[i].killed == false and
            pot_list[i].pos[1] == slime.pos[1] + dir.x and pot_list[i].pos[2] == slime.pos[2] + dir.y) then
            goto this_next_next
        end
    end
    if (player_pose[map_nb][1] == slime.pos[1] + dir.x and player_pose[map_nb][2] == slime.pos[2] + dir.y) then
        goto this_next_next
    end
    if the_map[slime.pos[2] + 1 + dir.y][slime.pos[1] + 1 + dir.x] == "wall" then
        ::this_next_next::
    end
    slime.pos[1] = slime.pos[1] + dir.x
    slime.pos[2] = slime.pos[2] + dir.y
    slime_attack(slime)
    ::this_next_next::
end

function move_fantom(slime, the_map)
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
    fantom_attack(slime)
    ::this_next_next::
end

function move_slime(slime, the_map)
    local s_pos = {}
    local dir = {}
    dir.x = 0
    dir.y = 0
    local rand = math.random(1, 4)
    s_pos.x = slime.pos[1]
    s_pos.y = slime.pos[2]
    if (rand == 4) then
        dir.y = 1
    end
    if (rand == 3) then
        dir.y = -1
    end
    if (rand == 2) then
        dir.x = -1
    end
    if (rand == 1) then
        dir.x = 1
    end
    for i = 1, nb_monsters[map_nb] do
        if (monster[i].count ~= slime.count and monster[i].killed == false and
            monster[i].pos[1] == slime.pos[1] + dir.x and monster[i].pos[2] == slime.pos[2] + dir.y) then
            goto this_next_next
        end
    end
    if (player_pose[map_nb][1] == slime.pos[1] + dir.x and player_pose[map_nb][2] == slime.pos[2] + dir.y) then
        goto this_next_next
    end
    if the_map[slime.pos[2] + 1 + dir.y][slime.pos[1] + 1 + dir.x] == "wall" then
        goto this_next_next
    end
    ::this_next::
    slime.pos[1] = slime.pos[1] + dir.x
    slime.pos[2] = slime.pos[2] + dir.y
    fantom_attack(slime)
    ::this_next_next::
end

function move_pion(slime, the_map)
    local p_pos = {}
    local s_pos = {}
    p_pos.x = player_pose[map_nb][1]
    p_pos.y = player_pose[map_nb][2]
    s_pos.x = slime.pos[1]
    s_pos.y = slime.pos[2]
    if (the_map[slime.pos[2] + 1 + 1][slime.pos[1] + 1] == "wall") then
        goto this_next_next
    end
    if (player_pose[map_nb][1] == slime.pos[1] + 1 and player_pose[map_nb][2] == slime.pos[2] - 1) then
        slime.pos[2] = slime.pos[2] - 1
        slime.pos[1] = slime.pos[1] + 1
        life = 0
        love.audio.setVolume(1)
        love.audio.play(effect[1])
        goto this_next_next
    end
    if (player_pose[map_nb][1] == slime.pos[1] + 1 and player_pose[map_nb][2] == slime.pos[2] + 1) then
        slime.pos[2] = slime.pos[2] + 1
        slime.pos[1] = slime.pos[1] + 1
        life = 0
        love.audio.setVolume(1)
        love.audio.play(effect[1])
        goto this_next_next
    end
    ::this_next::
    slime.pos[2] = slime.pos[2] + 1
    fantom_attack(slime)
    ::this_next_next::
end

function move_knight(slime, the_map)
    if (player_pose[map_nb][1] == slime.pos[1] + 2 and player_pose[map_nb][2] == slime.pos[2] - 1) then
        slime.pos[2] = slime.pos[2] - 1
        slime.pos[1] = slime.pos[1] + 2
        life = 0
        love.audio.setVolume(1)
        love.audio.play(effect[1])
    elseif (player_pose[map_nb][1] == slime.pos[1] + 2 and player_pose[map_nb][2] == slime.pos[2] + 1) then
        slime.pos[2] = slime.pos[2] + 1
        slime.pos[1] = slime.pos[1] + 2
        life = 0
        love.audio.setVolume(1)
        love.audio.play(effect[1])
        goto this_next_next
    elseif (player_pose[map_nb][1] == slime.pos[1] - 2 and player_pose[map_nb][2] == slime.pos[2] - 1) then
        slime.pos[2] = slime.pos[2] - 1
        slime.pos[1] = slime.pos[1] - 2
        life = 0
        love.audio.setVolume(1)
        love.audio.play(effect[1])
    elseif (player_pose[map_nb][1] == slime.pos[1] - 2 and player_pose[map_nb][2] == slime.pos[2] + 1) then
        slime.pos[2] = slime.pos[2] + 1
        slime.pos[1] = slime.pos[1] - 2
        life = 0
        love.audio.setVolume(1)
        love.audio.play(effect[1])
        goto this_next_next
    elseif (player_pose[map_nb][1] == slime.pos[1] + 1 and player_pose[map_nb][2] == slime.pos[2] - 2) then
        slime.pos[2] = slime.pos[2] - 2
        slime.pos[1] = slime.pos[1] + 1
        life = 0
        love.audio.setVolume(1)
        love.audio.play(effect[1])
    elseif (player_pose[map_nb][1] == slime.pos[1] + 1 and player_pose[map_nb][2] == slime.pos[2] + 2) then
        slime.pos[2] = slime.pos[2] + 2
        slime.pos[1] = slime.pos[1] + 1
        life = 0
        love.audio.setVolume(1)
        love.audio.play(effect[1])
        goto this_next_next
    elseif (player_pose[map_nb][1] == slime.pos[1] - 1 and player_pose[map_nb][2] == slime.pos[2] - 2) then
        slime.pos[2] = slime.pos[2] - 2
        slime.pos[1] = slime.pos[1] - 1
        life = 0
        love.audio.setVolume(1)
        love.audio.play(effect[1])
    elseif (player_pose[map_nb][1] == slime.pos[1] - 1 and player_pose[map_nb][2] == slime.pos[2] + 2) then
        slime.pos[2] = slime.pos[2] + 2
        slime.pos[1] = slime.pos[1] - 1
        life = 0
        love.audio.setVolume(1)
        love.audio.play(effect[1])
        goto this_next_next
    end
    ::this_next_next::
end
