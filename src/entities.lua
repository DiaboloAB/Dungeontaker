





function entities_load()
    ghost = Entity(10, 10, newImage("sprites/ghost.png"))
    print(ghost.x)
end

function read_map()
    for y = 1, #map_list[map_nb] do
        for x = 1, #map_list[map_nb][y] do
            if map_list[map_nb][y][x] == "spk2" then
                map_list[map_nb][y][x] = "spk0"
                goto(28)
            end
            if map_list[map_nb][y][x] == "spk1" then
                map_list[map_nb][y][x] = "spk2"
                goto(28)
            end
            if map_list[map_nb][y][x] == "spk0" then
                map_list[map_nb][y][x] = "spk1"
                goto(28)
            end
        end
    end
end

function update_map()
    if map_list[map_nb][player_pose[map_nb][2] + 1][player_pose[map_nb][1] + 1] == "fire" or  map_list[map_nb][player_pose[map_nb][2] + 1][player_pose[map_nb][1] + 1] == "spk3" then
        life = life - 1
        print(life)
    end
end
