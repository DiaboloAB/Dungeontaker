require "src/menu"
require "src/player"

function love.load()
    in_start_menu = true;
    menu_load()
    player_load()
end


function love.update()
    if in_start_menu == true then
        menu_update()
    else
        player_update()
    end
end

function love.draw()
    if in_start_menu == true then
        menu_draw()
    else
        player_draw()
    end
end
