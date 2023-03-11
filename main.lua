require "src/menu"
require "src/player"
require "src/map"

function love.load()
    love.graphics.setDefaultFilter( "nearest" )
    in_start_menu = true;
    menu_load()
    player_load()
    map_load()
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
        map_draw()
        player_draw()
    end
end

function love.mousepressed(x, y, button, istouch)
    if in_start_menu == true then
        button_menu(x, y, button)
    end
end

function love.keypressed( key )
    if in_start_menu == false then
        move_player( key )
    end
end
