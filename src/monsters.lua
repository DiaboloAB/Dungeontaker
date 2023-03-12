require "src.move_slime"

function check_monster_killed()
    local ret = false
    for i = 1, nb_monsters[map_nb] do
        if (monster[i].killed == false and monster[i].id ~= "fantom") then
            ret = true
        end
    end
    return ret
end

function get_quad(image, width, height, duration)
    local quads = {};

    for y = 0, image:getHeight() - height, height do
        for x = 0, image:getWidth() - width, width do
            table.insert(quads, love.graphics.newQuad(x, y, width, height, image:getDimensions()))
        end
    end
    return quads
end

function init_monster(count, id, x, y)
    local img = love.graphics.newImage(string.format("sprites/%s.png", id))
    local monster = {}
    monster.count = count
    monster.killed = false
    monster.id = id
    monster.pos = {x, y}
    monster.anim = newAnimation(love.graphics.newImage(string.format("sprites/%s.png", id)), 8, 8, 6)
    monster.quad1 = love.graphics.newQuad(0, 0, 8, 8, img:getDimensions())
    monster.quad2 = love.graphics.newQuad(8, 0, 8, 8, img:getDimensions())
    return monster
end

function get_monster(map_id)
    local monster_temp = {}

    if map_id == 1 and vivant == true then
        monster_temp = {init_monster(1,"wizard", 17, 7)}
    end
    if map_id == 1 and vivant == false then
        monster_temp = {init_monster(1,"ghost_wizard", 17, 7)}
    end
    if map_id == 2 then
        monster_temp = {init_monster(1,"zombie", 17, 8)}
    end
    if map_id == 3 then
        monster_temp = {init_monster(1,"fantom", math.random(10, 20), math.random(10, 20)),
        init_monster(1,"slime", 14, 10)}
    end
    if map_id == 4 then
        monster_temp = {init_monster(1,"zombie", 16, 7)}
    end
    if map_id == 5 then
        monster_temp = {init_monster(1,"fantom", math.random(10, 20), math.random(10, 20)),
        init_monster(1,"pion", 10, 10)}
    end
    if map_id == 6 then
        monster_temp = {init_monster(1,"zombie", 16, 7)}
    end
    if map_id == 7 then
        monster_temp = {init_monster(1,"fantom", math.random(10, 20), math.random(10, 20)),
        init_monster(1,"pion", 13, 6),
        init_monster(1,"knight", 13, 6)}
    end
    if map_id == 8 then
        monster_temp = {init_monster(1,"fantom", math.random(10, 20), math.random(10, 20))}
    end
    if map_id == 9 then
        monster_temp = {init_monster(1,"fantom", math.random(10, 20), math.random(10, 20))}
    end
    if map_id == 10 then
        monster_temp = {init_monster(1,"fantom", math.random(10, 20), math.random(10, 20))}
    end

    return monster_temp
end

function monsters_load()
    nb_monsters = {1, 1, 2, 1, 2, 1, 3, 1, 1, 1, 1, 1}
    monster = get_monster(map_nb)
end

function monsters_move()
    for i = 1, nb_monsters[map_nb] do
        if (monster[i].id == "zombie" and monster[i].killed == false) then
            move_zombie(monster[i], map_list[map_nb])
        end
        if (monster[i].id == "fantom" and monster[i].killed == false) then
            move_fantom(monster[i], map_list[map_nb])
        end
        if (monster[i].id == "slime" and monster[i].killed == false) then
            move_slime(monster[i], map_list[map_nb])
        end
        if (monster[i].id == "pion" and monster[i].killed == false) then
            move_pion(monster[i], map_list[map_nb])
        end
        if (monster[i].id == "knight" and monster[i].killed == false) then
            move_knight(monster[i], map_list[map_nb])
        end
    end
end

function monsters_update()
    for i = 1, nb_monsters[map_nb] do
        monster[i].anim.currentTime = monster[i].anim.currentTime + dt
        if monster[i].anim.currentTime >= monster[i].anim.duration then
            monster[i].animcurrentTime = monster[i].anim.currentTime - monster[i].anim.duration
        end
    end
end

function monsters_draw()
    for i = 1, nb_monsters[map_nb] do
        if monster[i].killed == false then
            local spriteNum = math.floor(monster[i].anim.currentTime / monster[i].anim.duration * 2) + 1
            if spriteNum % 2 == 1 then
                love.graphics.draw(monster[i].anim.spriteSheet, monster[i].quad1, monster[i].pos[1] * 64, monster[i].pos[2] * 64, 0, 8)
            end
            if spriteNum % 2 == 0 then
                love.graphics.draw(monster[i].anim.spriteSheet, monster[i].quad2, monster[i].pos[1] * 64, monster[i].pos[2] * 64, 0, 8)
            end
        end
    end
end