local Bar = Object:extend()

function Bar:new(mode, x, y, width, height)
  self.mode = mode
  self.x = x
  self.y = y
  self.width = width
  self.height = height
end
function Bar:draw()
  love.graphics.rectangle(self.mode, self.x, self.y, self.width, self.height)
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