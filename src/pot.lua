function init_pot(x, y)
    local img = love.graphics.newImage(string.format("sprites/pot.png", id))
    local monster = {}
    monster.img = img
    monster.killed = false
    monster.pos = {x, y}
    return monster
end

function get_pot(map_id)
    local monster_temp = {}
    if map_id == 1 then
        monster_temp = {init_pot(17, 6)}
    end
    if map_id == 2 then
        monster_temp = {init_pot(16, 7)}
    end
    if map_id == 3 then
        monster_temp = {init_pot(16, 7)}
    end
    if map_id == 4 then
        monster_temp = {init_pot(16, 7)}
    end
    if map_id == 5 then
        monster_temp = {init_pot(16, 7)}
    end
    if map_id == 6 then
        monster_temp = {init_pot(16, 7)}
    end
    if map_id == 7 then
        monster_temp = {init_pot(16, 7)}
    end

    return monster_temp
end

function pot_load()
    nb_pot = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}
    pot_list = get_pot(map_nb)
end

function pot_draw()
    for i = 1, nb_pot[map_nb] do
        if pot_list[i].killed == false then
            love.graphics.draw(pot_list[i].img, pot_list[i].pos[1] * 64, pot_list[i].pos[2] * 64, 0, 8, 8);
        end
    end
end
