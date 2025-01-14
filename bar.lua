Bar = Object.extend(Object)

function Bar.new(self, mode, x, y, width, height)
  self.mode = mode
  self.x = x
  self.y = y
  self.width = width
  self.height = height
end
function Bar.draw(self)
  love.graphics.rectangle(self.mode, self.x, self.y, self.width, self.height)
  end
function Bar.up(self, dt)
  self.y = self.y - 100 * dt
end
function Bar.down(self, dt)
  self.y = self.y + 100 * dt
end
function Bar.right(self, dt)
  self.x = self.x + 100 * dt
end
function Bar.left(self, dt)
  self.x = self.x - 100 * dt
end
