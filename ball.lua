local Ball = Object:extend()

function Ball:new(x, y, speed, path)
  self.xstart = x
  self.ystart = y
  self.x = x
  self.y = y
  self.speed = speed
  self.vx = math.random((-1) * speed, speed)
  self.vy = math.sqrt(speed ^ 2 - self.vx ^ 2)
  self.asset = love.graphics.newImage(path)
  self.width = self.asset:getWidth()
  self.height = self.asset:getHeight()
  self.radius = self.width / 2
  self.center = self.height / 2
end
function Ball:update(dt)
  self.x = self.x + self.vx * dt
  self.y = self.y + self.vy * dt
end
function Ball:restart()
  self.x = self.xstart
  self.y = self.ystart
  self.speed = 200
  self.vx = math.random((-1) * self.speed, self.speed)
  self.vy = math.sqrt(self.speed ^ 2 - self.vx ^ 2)
end
function Ball:draw()
  -- love.graphics.circle("fill", self.x, self.y, self.radius)
  love.graphics.draw(self.asset, self.x, self.y, 0, 1, 1, self.radius, self.center)
end
return Ball