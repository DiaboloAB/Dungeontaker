require "src/menu"
require "src/player"
require "src/map"
require "src/pause"

function love.load()
    love.graphics.setDefaultFilter( "nearest" )
    in_start_menu = true;
    menu_load()
    player_load()
    map_load()
    pause_load()
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
    if (pause_button == false) then
        pause_draw()
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
    if pause_button == true then
            pause_menu_true( key )
            goto ici
        end
    if pause_button == false then
            pause_menu_false( key )
        end
    end
    ::ici::
end