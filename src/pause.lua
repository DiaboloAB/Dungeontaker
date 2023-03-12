function pause_load ()
    cursor = love.graphics.newImage("asset_menu/cursor.png")
    pause = love.graphics.newImage("asset_menu/pause.png")
    pause_bg = love.graphics.newImage("asset_menu/sign_pause.png")
    kill = love.graphics.newImage("asset_menu/kill.png")
    quit_pause = love.graphics.newImage("asset_menu/quit.png")
    pause_green = love.graphics.newImage("asset_menu/pause.png")
    resume = love.graphics.newImage("asset_menu/resume.png")
    music = love.graphics.newImage("asset_menu/music.png")
    music_mute = love.graphics.newImage("asset_menu/music_mute.png")
    pause_button = true;
    music_button = true;

end

function pause_draw ()
    local x, y = love.mouse.getPosition()
    love.graphics.draw(pause_bg,  450, -10, 0 , 4, 4)
    love.graphics.draw(kill, 700, 565, 0, 2, 2)
    love.graphics.draw(resume, 855, 595, 0, 0.6, 0.6)
    love.graphics.draw(pause, 825, 350 , 0, 1, 1)
    love.graphics.draw(quit_pause, 1075, 605, 0, 0.6, 0.6)
    love.graphics.draw(music, 915, 485, 0, 0.15, 0.15)
    love.graphics.draw(cursor, x, y, 0, 0.3, 0.3)
    if music_button == false then
        love.graphics.draw(music_mute, 875, 605, 0, 0.6, 0.6)
    end

end

function pause_menu (x, y, button)
    local width_music = music:getWidth()
    local height_music = music:getHeight()

    local width_quit_pause = quit_pause:getWidth()
    local height_quit_pause = quit_pause:getHeight()

    local width_music_mute= music_mute:getWidth()
    local height_music_mute = music_mute:getHeight()

    local width_kill = kill:getWidth()
    local height_kill = kill:getHeight()

    local width_resume = resume:getWidth()
    local height_resume = resume:getHeight()


    if button == 1 then

        if x > 705 and x < 820 and y < 690 and y > 585 then
            print("coucou")
            pause_button = true
            life = -1
        end
        if width_resume + 800 > x  and x > 855 and  height_resume  +  530 > y  and y > 595 then
            pause_button = true
        end

        if width_quit_pause + 1075 > x  and x > 1075 and  height_quit_pause +  550 > y  and y > 605 then
        love.window.close()
        os.exit()
        end

    end
end

function pause_menu_true( key )

    if key == "escape" and game_over == false then
            pause_button = false
    end
end

function pause_menu_false( key )

    if key == "escape" then
            pause_button = true
    end
end


