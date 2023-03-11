

function player_load()
    pose = {}
    pose.x = 64;
    pose.y = 64;

    player = newAnimation(love.graphics.newImage("sprites/player.png"), 8, 8, 6)
    
    dt = 0.1
end

function player_update()
    player.currentTime = player.currentTime + dt
    if player.currentTime >= player.duration then
        player.currentTime = player.currentTime - player.duration
    end
end

function player_draw()
    local spriteNum = math.floor(player.currentTime / player.duration * #player.quads) + 1
    love.graphics.draw(player.spriteSheet, player.quads[spriteNum], pose.x, pose.y, 0, 8)
end

function move_player( key )

    if key == "up" then
        pose.y = pose.y - 64
    end
    if key == "right" then
        pose.x = pose.x + 64
    end
    if key == "down" then
        pose.y = pose.y + 64
    end
    if key == "left" then
        pose.x = pose.x - 64
    end

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