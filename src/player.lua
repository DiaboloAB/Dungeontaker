

function player_load()
    player = {}
    player.x = 0;
    player.y = 0;

    player = newAnimation(love.graphics.newImage("sprites/player.png"), 8, 8, 6)
    
    dt = 0.1
end


function player_draw()
    local spriteNum = math.floor(player.currentTime / player.duration * #player.quads) + 1
    love.graphics.draw(player.spriteSheet, player.quads[spriteNum], player.x, player.y, 0, 2)
end


function newAnimation(image, width, height, duration)
    local player = {}
    player.spriteSheet = image;
    player.quads = {};

    for y = 0, image:getHeight() - height, height do
        for x = 0, image:getWidth() - width, width do
            table.insert(player.quads, love.graphics.newQuad(x, y, width, height, image:getDimensions()))
        end
    end

    player.duration = duration or 1
    player.currentTime = 0

    return player
end