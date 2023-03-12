function audio_load()
    start_audio = true
    audio = love.graphics.newImage("asset_menu/note.png")
    source = love.audio.newSource("asset_menu/audio/back_audio.wav", "static")

end

function audio_update()
    local width_audio = audio:getWidth()
    local height_audio = audio:getWidth()

    if start_audio == false and width_audio + 1724 > x and x > 1724 and height_audio + 56 > y and y > 56 then
        start_audio = true
    end
    if start_audio == true and width_audio + 1724 > x and x > 1724 and height_audio + 56 > y and y > 56 then
        start_audio = false
    end
end

