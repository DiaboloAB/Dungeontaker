local love = require 'love'
require "src/menu"
require "src/audio"
require "src/player"
require "src/map"
require "src/entities"
require "src/game_over"
require "src/pause"
require "src/monsters"
require "src/pot"
require "src/mage"

function love.load()
    love.graphics.setDefaultFilter( "nearest" )
    in_start_menu = true;
    in_game_over = true;
    over = false;
    audio_load()
    menu_load()
    map_load()
    player_load()
    monsters_load()
    pause_load()
    game_over_load()
    pot_load()

    timer_speedrun_load = 0
    victory = false
    victory_img = love.graphics.newImage("sprites/victory.png")

end


function love.update()
    audio_update()
    if in_start_menu == true then
        menu_update()
    elseif over == false and pause_button == true then
        player_update()
        monsters_update()
    end
end

function love.draw()
    if in_start_menu == true then
        menu_draw()
    else
        map_draw()
        player_draw()
        monsters_draw()
        pot_draw()
        mage_update()
    end
    if life < 1 then
        game_over_draw()
        if love.keyboard.isDown("space") then
            over = false
            victory = false
            reset()
        end
    end
    if (pause_button == false and life > -1) then
        pause_draw()
    end
    if victory == true then
        love.graphics.draw(victory_img, 0, 0, 0)
        love.graphics.print(string.sub(tostring(timer_speedrun_load), 1, 4), 1 * 64 + 30, 3 * 64, 0, 3, 4)
    end
end

function love.mousepressed(x, y, button, istouch, key)
    if in_start_menu == true then
        button_menu(x, y, button, key)
    end

    if pause_button == false then
        pause_menu(x, y, button, key)
    end

end

function love.keypressed( key )
    if in_start_menu == false then
        if over == false and pause_button == true then
            if move_player( key ) == 1 then
                love.audio.setVolume(1)
                love.audio.play(effect[2])
                monsters_move()
                timer = 10
            end
        end
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