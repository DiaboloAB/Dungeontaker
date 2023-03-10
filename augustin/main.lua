require "test"

function love.load()
    start = love.graphics.newImage("asset_menu/start.png")
    quit = love.graphics.newImage("asset_menu/quit.png")
    sign = love.graphics.newImage("asset_menu/wood_sign.png")
    bg_menu = love.graphics.newImage("asset_menu/bg_menu1.jpg")


    animation = newAnimation(love.graphics.newImage("asset_menu/flamme_blue.png"), 75, 185, 6)
    dt = 0.1
end


function love.update()
    animation.currentTime = animation.currentTime + dt
    if animation.currentTime >= animation.duration then
        animation.currentTime = animation.currentTime - animation.duration
    end
end

function love.draw()

    love.graphics.draw(bg_menu, 0, 0)
    love.graphics.draw(sign, 960 - 240, -80)
    love.graphics.draw(start,  200, 700)
    love.graphics.draw(quit,  1420, 700)

    local spriteNum = math.floor(animation.currentTime / animation.duration * #animation.quads) + 1
    love.graphics.draw(animation.spriteSheet, animation.quads[spriteNum], 80, 350, 0, 1)
    love.graphics.draw(animation.spriteSheet, animation.quads[spriteNum], 1750, 350, 0, 1)

end


function newAnimation(image, width, height, duration)
    local animation = {}
    animation.spriteSheet = image;
    animation.quads = {};
    for y = 0, image:getHeight() - height, height do
        for x = 0, image:getWidth() - width, width do
            table.insert(animation.quads, love.graphics.newQuad(x, y, width, height, image:getDimensions()))
        end
    end
    animation.duration = duration or 1
    animation.currentTime = 0
    return animation
end


function love.conf(t)
    t.window.width = 1920
    t.window.height = 1080
end


function main()
    love.graphics.setMode(1920, 1080)
    love.draw()
end
