local love = require 'love'

function game_over_load()
    game_over = love.graphics.newImage("asset_menu/game_over.png")
end

function game_over_draw()
    local x, y = love.mouse.getPosition()
    over = true
    love.graphics.draw(game_over, 0, 0, 0, 1, 1)
end

function return_menu(key)
    if key == "escape" then
    end
end