Ball = Object.extend(Object)

function Ball.new(self, x, y, vx, vy)
  self.xstart = x
  self.ystart = y
  self.x = x
  self.y = y
  self.vx = vx
  self.vy = vy
end