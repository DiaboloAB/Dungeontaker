function audio_load()
    start_audio = true
    source = {}
    effect = {}
    audio = love.graphics.newImage("asset_menu/note.png")
    source[1] = love.audio.newSource("sound/Invitation.ogg", "stream")
    source[2] = love.audio.newSource("sound/TheTrial.ogg", "stream")
    source[3] = love.audio.newSource("sound/BountyHunter.ogg", "stream")
    source[4] = love.audio.newSource("sound/Monolith.ogg", "stream")
    
    effect[1] = love.audio.newSource("sound/Hit_hurt.wav", "static")
    effect[2] = love.audio.newSource("sound/move.wav", "static")
    effect[3] = love.audio.newSource("sound/coin.wav", "static")
end

function audio_update()
    love.audio.setVolume(0.1)
    if start_audio == true then
        if in_start_menu == true then
            love.audio.pause(source)
            love.audio.play(source[1])
        elseif map_nb == 6 then
            love.audio.pause(source)
            love.audio.play(source[2])
        elseif map_nb == 10 then
            love.audio.pause(source)
            love.audio.play(source[3])
        else
            love.audio.pause(source)
            love.audio.play(source[4])
        end
    end
    if start_audio == false then
        love.audio.pause(source)
    end
end

