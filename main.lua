function createRect(mode, x, y, width, height)
  rect = {}
  rect.mode = mode
  rect.x = x
  rect.y = y
  rect.width = width
  rect.height = height
  return rect
end

function drawRect(rectangle)
  love.graphics.rectangle(rectangle.mode, rectangle.x, rectangle.y, rectangle.width, rectangle.height)
end

function love.load()
  Object = require "classic"
  require "bar"
  require "ball"
  barTop = Bar("fill", 300, 5, 200, 15)
  barBottom = Bar("line", 300, 600 - 15 - 5, 200, 15)
  barLeft = Bar("fill", 5, 250, 15, 200)
  barRight = Bar("line", 800 - 15 - 5, 250, 15, 200)
  speed = 450
  ball1 = Ball(395, 295, -1, 0)
end

function love.update(dt)
  if love.keyboard.isDown("up") then
    barRight.up(barRight, dt)
  elseif love.keyboard.isDown("down") then
    barRight.down(barRight, dt)
  end
  if love.keyboard.isDown("left") then
    barBottom.left(barBottom, dt)
  elseif love.keyboard.isDown("right") then
    barBottom.right(barBottom, dt)
  end
  if love.keyboard.isDown("z") then
    barLeft.up(barLeft, dt)
  elseif love.keyboard.isDown("s") then
    barLeft.down(barLeft, dt)
  end
  if love.keyboard.isDown("q") then
    barTop.left(barTop, dt)
  elseif love.keyboard.isDown("d") then
    barTop.right(barTop, dt)
  end
  if ball1.x < 0 or ball1.x > 800 then
    -- game over just reset ball position for now
    ball1.x = ball1.xstart
  end
  if (ball1.x <= 5 + 15 and ball1.y >= barLeft.y and ball1.y <= barLeft.y + 200) or (ball1.x >= 800 - 15 - 5  and ball1.y >= barRight.y and ball1.y <= barRight.y + 200) then
    ball1.vx = ball1.vx * (-1)
  end
  ball1.x = ball1.x + speed / 2 * ball1.vx * dt
  ball1.y = ball1.y + speed / 2 * ball1.vy * dt
end

function love.draw()
  barTop.draw(barTop)
  barLeft.draw(barLeft)
  barRight.draw(barRight)
  barBottom.draw(barBottom)
  love.graphics.circle("fill", ball1.x, ball1.y, 10)
end
