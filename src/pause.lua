function pause_load ()
    cursor = love.graphics.newImage("asset_menu/cursor.png")
    pause = love.graphics.newImage("asset_menu/pause.png")
    pause_bg = love.graphics.newImage("asset_menu/sign_pause.png")
    pause_button = true;
    love.mouse.setVisible(false)

end

function pause_draw ()
    local x, y = love.mouse.getPosition()
    love.graphics.draw(pause_bg,  400, -10)

end

function pause_bg_draw()
    local x, y = love.mouse.getPosition()
    love.graphics.draw(pause,  15, 15, 0.01, 0.001)
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