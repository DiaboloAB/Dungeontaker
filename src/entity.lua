local Class = require("src/class")

local Entity = Class {}

function Entity:init(xp, yp, image, r, speed, width, height)
    self.x = xp or 0
    self.y = yp or 0
    self.img = image or nil
    self.rotation = r or 0
    self.widht = width or 8
    self.heigt = height or 8

    self.velocity = {x=0, y=0}

    self.speed = speed or 1
end

function Entity:setVelocityX(x)
    self.velocity.x = x
end

function Entity:setVelocityY(y)
    self.velocity.y = y
end

function Entity:setVelocityXY(x, y)
    self.velocity.x = x
    self.velocity.y = y
end

function Entity:getVelocityXY(x, y)
    return self.velocity.x, self.velocity.y
end

function Entity:stop()
    self.velocity = {x=0, y=0}
end

function Entity:update(dt)
    self.x = self.x + (self.velocity.x * dt)
    self.y = self.y + (self.velocity.y * dt)
end

function Entity:render()
    love.graphics.draw(self.img, self.x * 64, self.y * 64, self.rotation)
end

function Entity:Move(key)
    if key == "left" then
        print("left")
        self.x = self.x - self.speed
    end
    if key == "right" then
        self.x = self.x + self.speed
    end
    if key == "up" then
        self.y = self.y - self.speed
    end
    if key == "down" then
        self.y = self.y + self.speed
    end
end

return Entity