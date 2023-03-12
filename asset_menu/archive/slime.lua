local love = require 'love'

function slime_load()
    pose_slime = {13, 5}
    slime = newAnimation(love.graphics.newImage("sprites/slime.png"), 8, 8, 6)
end

function slime_update()
    slime.currentTime = slime.currentTime + dt
    if slime.currentTime >= slime.duration then
        slime.currentTime = slime.currentTime - slime.duration
    end
end

function slime_draw()
    local spriteNum = math.floor(slime.currentTime / slime.duration * #slime.quads) + 1
    love.graphics.draw(slime.spriteSheet, slime.quads[spriteNum], pose_slime[1] * 64, pose_slime[2] * 64, 0, 8)
end

function move_slime( key )

    pose_x = player_pose[map_nb][1]
    pose_slime_x = pose_slime[1]
    pose_y = player_pose[map_nb][2]
    pose_slime_y = pose_slime[2]

    if key == "up" then
        if map_list[map_nb][player_pose[map_nb][2]][player_pose[map_nb][1] + 1] ~= "wall" then
            X = pose_x - pose_slime_x
            Y = pose_y - pose_slime_y

            tmp_X = X
            tmp_Y = Y

            if tmp_X < 0 then
                tmp_X = tmp_X * -1
            elseif tmp_Y < 0 then
                tmp_Y = tmp_Y * -1
            end

            if tmp_X > tmp_Y then
                if X < 0 then
                    pose_slime[1] = pose_slime[1] - 1
                else
                    pose_slime[1] = pose_slime[1] + 1
                end
            else
                if Y < 0 then
                    pose_slime[2] = pose_slime[2] - 1
                else
                    pose_slime[2] = pose_slime[2] + 1
                end
            end
        end
    end

    if key == "down" then
        if map_list[map_nb][player_pose[map_nb][2] + 2][player_pose[map_nb][1] + 1] ~= "wall" then
            X = pose_x - pose_slime_x
            Y = pose_y - pose_slime_y

            tmp_X = X
            tmp_Y = Y

            if tmp_X < 0 then
                tmp_X = tmp_X * -1
            elseif tmp_Y < 0 then
                tmp_Y = tmp_Y * -1
            end

            if tmp_X > tmp_Y then
                if X < 0 then
                    pose_slime[1] = pose_slime[1] - 1
                else
                    pose_slime[1] = pose_slime[1] + 1
                end
            else
                if Y < 0 then
                    pose_slime[2] = pose_slime[2] - 1
                else
                    pose_slime[2] = pose_slime[2] + 1
                end
            end
        end
    end

    if key == "left" then
        if map_list[map_nb][player_pose[map_nb][2] + 1][player_pose[map_nb][1]] ~= "wall" then
            X = pose_x - pose_slime_x
            Y = pose_y - pose_slime_y

            tmp_X = X
            tmp_Y = Y

            if tmp_X < 0 then
                tmp_X = tmp_X * -1
            elseif tmp_Y < 0 then
                tmp_Y = tmp_Y * -1
            end

            if tmp_X > tmp_Y then
                if X < 0 then
                    pose_slime[1] = pose_slime[1] - 1
                else
                    pose_slime[1] = pose_slime[1] + 1
                end
            else
                if Y < 0 then
                    pose_slime[2] = pose_slime[2] - 1
                else
                    pose_slime[2] = pose_slime[2] + 1
                end
            end
        end
    end

    if key == "right" then
        if map_list[map_nb][player_pose[map_nb][2] + 1][player_pose[map_nb][1] + 2] ~= "wall" then
            X = pose_x - pose_slime_x
            Y = pose_y - pose_slime_y

            tmp_X = X
            tmp_Y = Y


            if tmp_X < 0 then
                tmp_X = tmp_X * -1
            elseif tmp_Y < 0 then
                tmp_Y = tmp_Y * -1
            end

            if tmp_X > tmp_Y then
                if X < 0 then
                    pose_slime[1] = pose_slime[1] - 1
                else
                    pose_slime[1] = pose_slime[1] + 1
                end
            else
                if Y < 0 then
                    pose_slime[2] = pose_slime[2] - 1
                else
                    pose_slime[2] = pose_slime[2] + 1
                end
            end
        end
    end

    if (pose_slime_x == pose_x) and (pose_slime_y == pose_y) then
        pose_slime[math.random(1, 2)] = pose_slime[1] + math.random(0, 25)
    end
end