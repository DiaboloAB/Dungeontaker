function menu_load()
    love.mouse.setVisible(false)
    cursor = love.graphics.newImage("asset_menu/cursor.png")
    start = love.graphics.newImage("asset_menu/start.png")
    quit = love.graphics.newImage("asset_menu/quit.png")
    sign = love.graphics.newImage("asset_menu/wood_sign.png")
    bg_menu = love.graphics.newImage("asset_menu/bg_menu1.jpg")


    animation = menu_animation(love.graphics.newImage("asset_menu/flamme_blue.png"), 75, 185, 6)
    dt = 0.1
end





function menu_update()
    animation.currentTime = animation.currentTime + dt
    if animation.currentTime >= animation.duration then
        animation.currentTime = animation.currentTime - animation.duration
    end
end




function menu_draw()
    local x, y = love.mouse.getPosition()
    love.graphics.draw(bg_menu, 0, 0)
    love.graphics.draw(sign, 960 - 240, -80)
    love.graphics.draw(start,  200, 700)
    love.graphics.draw(quit,  1420, 700)

    local spriteNum = math.floor(animation.currentTime / animation.duration * #animation.quads) + 1
    love.graphics.draw(animation.spriteSheet, animation.quads[spriteNum], 80, 350, 0, 1)
    love.graphics.draw(animation.spriteSheet, animation.quads[spriteNum], 1750, 350, 0, 1)
    love.graphics.draw(cursor, x, y, 0, 0.3, 0.3)
end


function love.mousepressed(x, y, button, istouch)

    width_start = start:getWidth()
    height_start = start:getHeight()
    width_quit = quit:getWidth()
    height_quit = quit:getHeight()

    if button == 1 then
        if width_start + 200 > x  and x > 200 and  height_start  +  700 > y  and y > 700 then
            print("start")
        end
        if width_quit + 1420 > x  and x > 1420 and  height_quit +  700 > y  and y > 700 then
            print("sortie")
        end
     end
end


function menu_animation(image, width, height, duration)
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

