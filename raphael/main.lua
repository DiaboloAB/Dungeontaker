function love.load()
    player = {}
    player.x = 0;
    player.y = 0;

    ennemy = {}
    ennemy.x = 32;
    ennemy.y = 32;
    ennemy.radius = 10;


    flame = newAnimation(love.graphics.newImage("flamme_blue.png"), 75, 185, 10)
    animation = newAnimation(love.graphics.newImage("oldHero.png"), 16, 18, 6)
    nb = 0
    dt = 0.1
end

function love.update()
    animation.currentTime = animation.currentTime + dt
    if animation.currentTime >= animation.duration then
        animation.currentTime = animation.currentTime - animation.duration
    end
end

function love.draw()
    local spriteNum = math.floor(animation.currentTime / animation.duration * #animation.quads) + 1
    love.graphics.draw(animation.spriteSheet, animation.quads[spriteNum], player.x, player.y, 0, 2)
    love.graphics.draw(flame.spriteSheet, flame.quads[spriteNum], 100, 100, 0, 1)
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