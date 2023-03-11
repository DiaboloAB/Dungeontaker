
function entities_load()
    ghost = Entity(10, 10, newImage("sprites/ghost.png"))
    print(ghost.x)
end

function read_map()
    for y = 1, #map_list[map_nb] do
        for x = 1, #map_list[map_nb][y] do
            if map_list[map_nb][y][x] == "fire" then
                table.insert(sprites_pose, {x - 1, y - 1})
                table.insert(sprites, newAnimation(love.graphics.newImage("sprites/fire.png"), 8, 8, 6))
            end
        end
    end
end

function reset()
    map_nb = 1
    life = 3
    erase_sprite()
    read_map()
end

function erase_sprite()
    local sprites_len = #sprites
    local pose_len = #sprites
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

end

function update_map()
    print(map_list[map_nb][player_pose[map_nb][2] + 1][player_pose[map_nb][1] + 1])
    if map_list[map_nb][player_pose[map_nb][2] + 1][player_pose[map_nb][1] + 1] == "fire" or  map_list[map_nb][player_pose[map_nb][2] + 1][player_pose[map_nb][1] + 1] == "spk3" then
        life = life - 1
    end
    if map_list[map_nb][player_pose[map_nb][2] + 1][player_pose[map_nb][1] + 1] == "door" then
        erase_sprite()
        map_nb = map_nb + 1
        read_map()
    end
end
