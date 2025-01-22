local Bar = Object:extend()

function Bar:new(x, y, scalex, scaley, asset, speed)
  -- self.asset = love.graphics.newImage("assets/" .. path .. "/bar_round_small.png")
  self.asset = asset
  self.x = x
  self.y = y
  self.width = self.asset:getWidth() * scalex
  self.height = self.asset:getHeight() * scaley
  self.scalex = scalex
  self.scaley = scaley
  self.originx = self.width / (2 * self.scalex)
  self.originy = self.height / (2 * self.scaley)
  self.speed = speed
end

function Bar:draw()
  love.graphics.draw(self.asset, self.x, self.y, 0, self.scalex, self.scaley, self.originx, self.originy)
  end
function Bar:up(dt)
  self.y = self.y - self.speed * dt
end
function Bar:down(dt)
  self.y = self.y + self.speed * dt
end
function Bar:right(dt)
  self.x = self.x + self.speed * dt
end
function Bar:left(dt)
  self.x = self.x - self.speed * dt
end
return Bar