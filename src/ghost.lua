local love = require 'love'

function ghost_load()
    pose_ghost = {
        {13, 5},
        {1, 1},
        {1, 1},
        {1, 1},
        {1, 1},
        {1, 1},
        {1, 1},
        {1, 1},
        {1, 1},
        {1, 1},
        {1, 1},
    }

    local _x, _y

    ghost = newAnimation(love.graphics.newImage("sprites/ghost.png"), 8, 8, 6)
end

function ghost_update()
    ghost.currentTime = ghost.currentTime + dt
    if ghost.currentTime >= ghost.duration then
        ghost.currentTime = ghost.currentTime - ghost.duration
    end
end

function ghost_draw()
    local spriteNum = math.floor(ghost.currentTime / ghost.duration * #ghost.quads) + 1
    love.graphics.draw(ghost.spriteSheet, ghost.quads[spriteNum], pose_ghost[map_nb][1] * 64, pose_ghost[map_nb][2] * 64, 0, 8)
end

function move_ghost( key )

    pose_x = player_pose[map_nb][1]
    pose_ghost_x = pose_ghost[map_nb][1]
    pose_y = player_pose[map_nb][2]
    pose_ghost_y = pose_ghost[map_nb][2]

    if key == "up" then
        if map_list[map_nb][player_pose[map_nb][2]][player_pose[map_nb][1] + 1] then
            X = pose_x - pose_ghost_x
            Y = pose_y - pose_ghost_y

            tmp_X = X
            tmp_Y = Y

            if tmp_X < 0 then
                tmp_X = tmp_X * -1
            elseif tmp_Y < 0 then
                tmp_Y = tmp_Y * -1
            end

            if tmp_X > tmp_Y then
                if X < 0 then
                    pose_ghost[map_nb][1] = pose_ghost[map_nb][1] - 1
                else
                    pose_ghost[map_nb][1] = pose_ghost[map_nb][1] + 1
                end
            else
                if Y < 0 then
                    pose_ghost[map_nb][2] = pose_ghost[map_nb][2] - 1
                else
                    pose_ghost[map_nb][2] = pose_ghost[map_nb][2] + 1
                end
            end
        end
    end

    if key == "down" then
        if map_list[map_nb][player_pose[map_nb][2] + 2][player_pose[map_nb][1] + 1] then
            X = pose_x - pose_ghost_x
            Y = pose_y - pose_ghost_y

            tmp_X = X
            tmp_Y = Y

            if tmp_X < 0 then
                tmp_X = tmp_X * -1
            elseif tmp_Y < 0 then
                tmp_Y = tmp_Y * -1
            end

            if tmp_X > tmp_Y then
                if X < 0 then
                    pose_ghost[map_nb][1] = pose_ghost[map_nb][1] - 1
                else
                    pose_ghost[map_nb][1] = pose_ghost[map_nb][1] + 1
                end
            else
                if Y < 0 then
                    pose_ghost[map_nb][2] = pose_ghost[map_nb][2] - 1
                else
                    pose_ghost[map_nb][2] = pose_ghost[map_nb][2] + 1
                end
            end
        end
    end

    if key == "left" then
        if map_list[map_nb][player_pose[map_nb][2] + 1][player_pose[map_nb][1]] then
            X = pose_x - pose_ghost_x
            Y = pose_y - pose_ghost_y

            tmp_X = X
            tmp_Y = Y

            if tmp_X < 0 then
                tmp_X = tmp_X * -1
            elseif tmp_Y < 0 then
                tmp_Y = tmp_Y * -1
            end

            if tmp_X > tmp_Y then
                if X < 0 then
                    pose_ghost[map_nb][1] = pose_ghost[map_nb][1] - 1
                else
                    pose_ghost[map_nb][1] = pose_ghost[map_nb][1] + 1
                end
            else
                if Y < 0 then
                    pose_ghost[map_nb][2] = pose_ghost[map_nb][2] - 1
                else
                    pose_ghost[map_nb][2] = pose_ghost[map_nb][2] + 1
                end
            end
        end
    end

    if key == "right" then
        if map_list[map_nb][player_pose[map_nb][2] + 1][player_pose[map_nb][1] + 2]  then
            X = pose_x - pose_ghost_x
            Y = pose_y - pose_ghost_y

            tmp_X = X
            tmp_Y = Y


            if tmp_X < 0 then
                tmp_X = tmp_X * -1
            elseif tmp_Y < 0 then
                tmp_Y = tmp_Y * -1
            end

            if tmp_X > tmp_Y then
                if X < 0 then
                    pose_ghost[map_nb][1] = pose_ghost[map_nb][1] - 1
                else
                    pose_ghost[map_nb][1] = pose_ghost[map_nb][1] + 1
                end
            else
                if Y < 0 then
                    pose_ghost[map_nb][2] = pose_ghost[map_nb][2] - 1
                else
                    pose_ghost[map_nb][2] = pose_ghost[map_nb][2] + 1
                end
            end
        end
    end

    if (pose_ghost_x == pose_x) and (pose_ghost_y == pose_y) then
        pose_ghost[map_nb][math.random(1, 2)] = pose_ghost[map_nb][1] + math.random(0, 25)
    end
end