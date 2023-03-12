local love = require 'love'
function player_load()

    timer_speedrun = 0.0000
    timer = 10
    life = 3
    pot = love.graphics.newImage("sprites/heart.png")

    player_pose = {
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

    sprites_pose = {
    }

    sprites = {}
    player = newAnimation(love.graphics.newImage("sprites/player.png"), 8, 8, 6)
    table.insert(sprites, player)
    read_map()

end

function player_update()
    timer_speedrun = timer_speedrun + love.timer.getDelta( )
    if timer > 0 then
        timer = timer - dt * 0.15
    end
    if (timer < 0) then
        life = life - 1
        timer = 10
    end
    for i = 1, #sprites do
        sprites[i].currentTime = sprites[i].currentTime + dt
        if sprites[i].currentTime >= sprites[i].duration then
            sprites[i].currentTime = sprites[i].currentTime - sprites[i].duration
        end
    end
end

function player_draw()
    for i = 2, #sprites do
        local spriteNum = math.floor(sprites[i].currentTime / sprites[i].duration * #sprites[i].quads) + 1
        love.graphics.draw(sprites[i].spriteSheet, sprites[i].quads[spriteNum], sprites_pose[i - 1][1] * 64, sprites_pose[i - 1][2] * 64, 0, 8)
    end

    local spriteNum = math.floor(sprites[1].currentTime / sprites[1].duration * #sprites[1].quads) + 1
    love.graphics.draw(sprites[1].spriteSheet, sprites[1].quads[spriteNum], player_pose[map_nb][1] * 64, player_pose[map_nb][2] * 64, 0, 8)
    love.graphics.setColor(0,255,0)
    if timer < 5 then
        love.graphics.setColor(255,140,0)
    end
    if timer < 2.5 then
        love.graphics.setColor(255,0,0)
    end
    love.graphics.rectangle("fill", 14.5 * 64 + 30 -  timer * 64 / 2, 1 * 64, timer * 64, 24)
    love.graphics.setColor(255,255,255)
    love.graphics.draw(pot, 1 * 64, 1 * 64, 0, 8)
    love.graphics.print(life, 2 * 64 + 30, 1 * 64, 0, 4, 4)
    love.graphics.print(string.sub(tostring(timer_speedrun), 1, 4), 1 * 64 + 30, 2 * 64, 0, 3, 4)
end

function move_player( key )
    local ret = 0
    local dir = {}
    dir.x = 0
    dir.y = 0
    if key == "up" then
        dir.x = -1
        ret = 1
    end
    if key == "right" then
        dir.y = 1
        ret = 1
    end
    if key == "down" then
        ret = 1
        dir.x = 1
    end
    if key == "left" then
        ret = 1
        dir.y = -1
    end

    for i = 1, nb_monsters[map_nb] do
        if (monster[i].killed == false and player_pose[map_nb][1] + dir.y == monster[i].pos[1] and player_pose[map_nb][2] + dir.x == monster[i].pos[2]) then
            monster[i].killed = true
            dir = {}
            goto this_one
        end
    end
    if map_list[map_nb][player_pose[map_nb][2] + 1 + dir.x][player_pose[map_nb][1] + 1 + dir.y] == "door" then
        if check_monster_killed() == false then
            erase_sprite()
            map_nb = map_nb + 1
            monster = get_monster(map_nb)
            read_map()
            goto this_one
        end
        dir = {} 
    end
    if map_list[map_nb][player_pose[map_nb][2] + 1 + dir.x][player_pose[map_nb][1] + 1 + dir.y] ~= "wall" then
        player_pose[map_nb][1] = player_pose[map_nb][1] + dir.y
        player_pose[map_nb][2] = player_pose[map_nb][2] + dir.x
        update_map()
    end
    ::this_one::
    return ret
end

function newAnimation(image, width, height, duration)
    local sprites = {}
    sprites.spriteSheet = image;
    sprites.quads = {};

    for y = 0, image:getHeight() - height, height do
        for x = 0, image:getWidth() - width, width do
            table.insert(sprites.quads, love.graphics.newQuad(x, y, width, height, image:getDimensions()))
        end
    end

    sprites.duration = duration or 1
    sprites.currentTime = 0

    return sprites
end

-- function spikes_gestion()
--     for y = 1, #map_list[map_nb] do
--         for x = 1, #map_list[map_nb][y] do
--             if map_list[map_nb][y][x] == "spk2" then
--                 map_list[map_nb][y][x] = "spk0"
--                 goto continue
--             end
--             if map_list[map_nb][y][x] == "spk1" then
--                 map_list[map_nb][y][x] = "spk2"
--             end
--             if map_list[map_nb][y][x] == "spk0" then
--                 map_list[map_nb][y][x] = "spk1"
--             end
--             ::continue::
--         end
--     end
-- end
