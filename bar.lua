local Bar = Object:extend()

function Bar:new(x, y, width, height, path)
  self.asset = love.graphics.newImage("assets/" .. path .. "/bar_round_small.png")
  self.mode = mode
  self.x = x
  self.y = y
  self.width = self.asset:getWidth() * 2
  self.height = self.asset:getHeight()
end
--function Bar:draw()
--  love.graphics.rectangle(self.mode, self.x, self.y, self.width, self.height)
--end
function Bar:draw(direction)
  love.graphics.draw(self.asset, self.x, self.y, direction, 2, 1, self.width / 4, self.height / 2)
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