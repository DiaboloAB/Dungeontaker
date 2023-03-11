require "menu"

function love.load()
    in_start_menu = true;
    menu_load()
end


function love.update()
    if in_start_menu == true then
        menu_update()
    end
end

function love.draw()
    if in_start_menu == true then
        menu_draw()
    end
end
