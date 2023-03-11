function player_load()
    pose = {}
    pose.x = 1;
    pose.y = 1;

    map = {
        {"wall", "wall", "wall"},
        {"wall", "empty", "empty"},
        {"wall", "empty", "empty"}
    }

    player = newAnimation(love.graphics.newImage("sprites/player.png"), 8, 8, 6)
end

function player_update()
    player.currentTime = player.currentTime + dt
    if player.currentTime >= player.duration then
        player.currentTime = player.currentTime - player.duration
    end
end

function player_draw()
    local spriteNum = math.floor(player.currentTime / player.duration * #player.quads) + 1
    love.graphics.draw(player.spriteSheet, player.quads[spriteNum], pose.x * 64, pose.y * 64, 0, 8)
end

function move_player( key )

    if key == "up" then
        if map[pose.y][pose.x + 1] ~= "wall" then
            pose.y = pose.y - 1
        end
    end
    if key == "right" then
        if map[pose.y + 1][pose.x + 2] ~= "wall" then
            pose.x = pose.x + 1
        end
    end
    if key == "down" then
        if map[pose.y + 2][pose.x + 1] ~= "wall" then
            pose.y = pose.y + 1
        end
    end
    if key == "left" then
        if map[pose.y + 1][pose.x] ~= "wall" then
            pose.x = pose.x - 1
        end
    end

end


function move_player_in_tab( direction )
    
    return true
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