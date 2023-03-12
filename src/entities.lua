
function entities_load()
    ghost = Entity(10, 10, newImage("sprites/ghost.png"))
end

function read_map()
    for y = 1, #map_list[map_nb] do
        for x = 1, #map_list[map_nb][y] do
            if map_list[map_nb][y][x] == "fire" then
                table.insert(sprites_pose, {x - 1, y - 1})
                table.insert(sprites, newAnimation(love.graphics.newImage("sprites/fire.png"), 8, 8, 6))
            end
            if map_list[map_nb][y][x] == "spk0" then
                table.insert(spike_pose, {x - 1, y - 1})
            end
        end
    end
end

function reset()

    pose_save = {
        {13, 9},
        {10, 7},
        {7, 10},
        {7, 7},
        {5, 11},
        {0, 8},
        {14, 14},
        {7, 7},
        {1, 8},
        {15, 14}
    }

    spike_state = 1

    timer_speedrun = 0.0000
    timer = 10
    map_nb = 1
    life = 3
    erase_sprite()
    read_map()

    for i = 1, #player_pose do
        player_pose[i][1] = pose_save[i][1]
        player_pose[i][2] = pose_save[i][2]
    end
end

function erase_sprite()
    local sprites_len = #sprites
    local pose_len = #sprites
    local cactus_len = #spike_pose
    local i = 2

    while i < sprites_len + 1 do
        table.remove(sprites)
        i = i + 1
    end
    i = 1
    while i < pose_len + 1 do
        table.remove(sprites_pose)
        i = i + 1
    end
    i = 1
    while i < cactus_len + 1 do
        table.remove(spike_pose)
        i = i + 1
    end

end

function update_map()

    if spike_state == 3 then
        spike_state = 1
    else
        spike_state = spike_state + 1
    end
    if map_list[map_nb][player_pose[map_nb][2] + 1][player_pose[map_nb][1] + 1] == "fire" then
        life = life - 1
    end
    if spike_state == 3 then
        for i = 1, #spike_pose do
            if player_pose[map_nb][1] == spike_pose[i][1] then
                if player_pose[map_nb][2] == spike_pose[i][2] then
                    life = life - 1
                end
            end
        end
    end
    if player_pose[map_nb][2] == 1 and player_pose[map_nb][1] == 1 then 
        life = 3
    end

end
