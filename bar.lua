local Bar = Object:extend()

function Bar:new(x, y, scalex, scaley, path)
  self.asset = love.graphics.newImage("assets/" .. path .. "/bar_round_small.png")
  self.x = x
  self.y = y
  self.width = self.asset:getWidth() * scalex
  self.height = self.asset:getHeight() * scaley
  self.scalex = scalex
  self.scaley = scaley
  self.originx = self.width / (2 * self.scalex)
  self.originy = self.height / (2 * self.scaley)
end

function Bar:draw()
  love.graphics.draw(self.asset, self.x, self.y, 0, self.scalex, self.scaley, self.originx, self.originy)
  end
function Bar:up(dt, speed)
  self.y = self.y - speed * dt
end
function Bar:down(dt, speed)
  self.y = self.y + speed * dt
end
function Bar:right(dt, speed)
  self.x = self.x + speed * dt
end
function Bar:left(dt, speed)
  self.x = self.x - speed * dt
end
return Bar