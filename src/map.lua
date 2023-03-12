function double(one_tab)
    grid = {}
    x = 0;
    for i = 1, 17 do
        grid[i] = {}

        for j = 1, 30 do
            if (one_tab[x] == 12) then
                grid[i][j - 1] = "wall"
            end
            if (one_tab[x] == 11) then
                grid[i][j - 1] = "fire"
            end
            if (one_tab[x] == 4) then
                grid[i][j - 1] = "door"
            end
            if (one_tab[x] == 0) then
                grid[i][j - 1] = "...."
            end
            if (one_tab[x] == 20) then
                grid[i][j - 1] = "spk0"
            end
            if (one_tab[x] == 42) then
                grid[i][j - 1] = "shor"
            end
            x = x + 1
        end
    end
    return grid
end

function map_load()

    map_nb = 1;
    map_png = {}

    map_1_png = love.graphics.newImage("maps/map_1.png")
    map_2_png = love.graphics.newImage("maps/map_2.png")
    map_3_png = love.graphics.newImage("maps/map_3.png")
    map_4_png = love.graphics.newImage("maps/map_4.png")
    map_5_png = love.graphics.newImage("maps/map_5.png")
    map_6_png = love.graphics.newImage("maps/map_6.png")
    map_7_png = love.graphics.newImage("maps/map_7.png")
    map_8_png = love.graphics.newImage("maps/map_8.png")
    map_9_png = love.graphics.newImage("maps/map_9.png")
    map_10_png = love.graphics.newImage("maps/map_10.png")

    table.insert( map_png, map_1_png )
    table.insert( map_png, map_2_png )
    table.insert( map_png, map_3_png )
    table.insert( map_png, map_4_png )
    table.insert( map_png, map_5_png )
    table.insert( map_png, map_6_png )
    table.insert( map_png, map_7_png )
    table.insert( map_png, map_8_png )
    table.insert( map_png, map_9_png )
    table.insert( map_png, map_10_png )

    map_list = {}

    table.insert( map_list, double(require('luamap.map_1') .layers[2].data))
    table.insert( map_list, double(require('luamap.map_2') .layers[2].data))
    table.insert( map_list, double(require('luamap.map_3') .layers[2].data))
    table.insert( map_list, double(require('luamap.map_4') .layers[2].data))
    table.insert( map_list, double(require('luamap.map_5') .layers[2].data))
    table.insert( map_list, double(require('luamap.map_6') .layers[2].data))
    table.insert( map_list, double(require('luamap.map_7') .layers[2].data))
    table.insert( map_list, double(require('luamap.map_8') .layers[2].data))
    table.insert( map_list, double(require('luamap.map_9') .layers[2].data))
    table.insert( map_list, double(require('luamap.map_10') .layers[2].data))

end

function map_draw()

    love.graphics.draw(map_png[map_nb], 0, 0, 0, 8)

end
