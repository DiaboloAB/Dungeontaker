function pause_load ()
    cursor = love.graphics.newImage("asset_menu/cursor.png")
    pause = love.graphics.newImage("asset_menu/pause.png")
    pause_bg = love.graphics.newImage("asset_menu/sign_pause.png")
    kill = love.graphics.newImage("asset_menu/kill.png")
    quit = love.graphics.newImage("asset_menu/quit.png")
    pause_green = love.graphics.newImage("asset_menu/pause.png")
    resume = love.graphics.newImage("asset_menu/resume.png")
    music = love.graphics.newImage("asset_menu/music.png")
    pause_button = true;
    music_button = true;

end

function pause_draw ()
    local x, y = love.mouse.getPosition()
    love.graphics.draw(pause_bg,  450, -10, 0 , 4, 4)
    love.graphics.draw(kill, 700, 565, 0, 2, 2)
    love.graphics.draw(resume, 855, 595, 0, 0.6, 0.6)
    love.graphics.draw(pause, 825, 350 , 0, 1, 1)
    love.graphics.draw(quit, 1075, 605, 0, 0.6, 0.6)
    love.graphics.draw(music, 870, 515, 0, 0.15, 0.15)
    love.graphics.draw(cursor, x, y, 0, 0.3, 0.3)

end


function pause_menu_true( key )

    if key == "escape" then
            pause_button = false
    end
end

function pause_menu_false( key )

    if key == "escape" then
            pause_button = true
    end
end