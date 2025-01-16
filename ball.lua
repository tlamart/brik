local Ball = Object:extend()

function Ball:new(speed, asset)
  self.xstart = 400
  self.ystart = 300
  self.x = self.xstart
  self.y = self.ystart
  self.speed = speed
  self.vx = math.random((-1) * speed, speed)
  self.vy = math.sqrt(speed ^ 2 - self.vx ^ 2)
  self.asset = asset
  self.width = self.asset:getWidth()
  self.height = self.asset:getHeight()
  self.radius = self.width / 2
  self.center = self.height / 2
  self.bouncex = nil
  self.bouncey = nil
end

function Ball:update(dt)
  self.x = self.x + self.vx * dt
  self.y = self.y + self.vy * dt
  if self.bouncex then
    self.x = self.bouncex
    self.bouncex = nil
  elseif self.bouncey then
    self.y = self.bouncey
    self.bouncey = nil
  end
end

function Ball:restart()
  self.x = self.xstart
  self.y = self.ystart
  self.speed = 200
  self.vx = math.random((-1) * self.speed, self.speed)
  self.vy = math.sqrt(self.speed ^ 2 - self.vx ^ 2)
end

function Ball:draw()
  love.graphics.draw(self.asset, self.x, self.y, 0, 1, 1, self.radius, self.center)
end
return Ball