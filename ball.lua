local Ball = Object:extend()

function Ball:new(x, y, vx, vy, speed)
  self.xstart = x
  self.ystart = y
  self.x = x
  self.y = y
  self.vx = vx
  self.vy = vy
  self.speed = speed
  self.radius = 5
end
function Ball:update(dt)
  self.x = self.x + self.vx * self.speed * dt
  self.y = self.y + self.vy * self.speed * dt
end
function Ball:restart()
  self.x = self.xstart
  self.y = self.ystart
  self.vx = math.random(-1, 1)
  self.vy = math.random(-1, 1)
  self.speed = 100
end
function Ball:draw()
  love.graphics.circle("fill", self.x, self.y, self.radius)
end
return Ball