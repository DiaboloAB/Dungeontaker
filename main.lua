local love = require 'love'
require "src/menu"
require "src/player"
require "src/map"
require "src/entities"
require "src/entity"
require "src/ghost"
require "src/pause"

function love.load()
    love.graphics.setDefaultFilter( "nearest" )
    in_start_menu = true;
    menu_load()
    map_load()
    player_load()
    ghost_load()
    pause_load()
end


function love.update()
    if in_start_menu == true then
        menu_update()
    else
        player_update()
        ghost_update()
    end
    if life < 0 then
        reset()
    end
end

function love.draw()
    if in_start_menu == true then
        menu_draw()
    else
        map_draw()
        player_draw()
        ghost_draw()
    end
    if (pause_button == false) then
        pause_draw()
    end
end

function love.mousepressed(x, y, button, istouch, key)
    if in_start_menu == true then
        button_menu(x, y, button, key)
    end

end

function love.keypressed( key )
    if in_start_menu == false then
        move_player( key )
        move_ghost( key )
    if pause_button == true then
            pause_menu_true( key )
            goto ici
        end
    if pause_button == false then
            pause_menu_false( key )
        end
    end

    if in_start_menu == true then
        if key == "space" then
            in_start_menu = false
        end
    end
    ::ici::
end