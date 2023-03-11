function love.load()
    load()
end

function load()
    player = {}
    player.x = 0;
    player.y = 0;

    ennemy = {}
    ennemy.x = 32;
    ennemy.y = 32;
    ennemy.radius = 10;

    object = {}

    flame = newAnimation(love.graphics.newImage("flamme_blue.png"), 75, 185, 9)
    animation = newAnimation(love.graphics.newImage("oldHero.png"), 16, 18, 6)

    table.insert(object, flame )
    table.insert(object, animation )

    nb = 0
    dt = 0.1
end

function love.update()

    for i = 1, #object do
        object[i].currentTime = object[i].currentTime + dt
        if object[i].currentTime >= object[i].duration then
            object[i].currentTime = object[i].currentTime - object[i].duration
        end
    end
end

function love.draw()
    for i = 1, #object do
        local spriteNum = math.floor(object[i].currentTime / object[i].duration * #object[i].quads) + 1
        love.graphics.draw(object[i].spriteSheet, object[i].quads[spriteNum], player.x, player.y, 0, 2)
    end
    love.graphics.circle("fill", ennemy.x, ennemy.y, ennemy.radius)
end

function love.keypressed( key )
    if key == "right" then
        update()
        player.x = player.x + 32
    end
    if key == "left" then
        update()
        player.x = player.x - 32
    end
    if key == "down" then
        update()
        player.y = player.y + 32
    end
    if key == "up" then
        update()
        player.y = player.y - 32
    end
end

function update()
    ennemy.y = ennemy.y + 32
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
