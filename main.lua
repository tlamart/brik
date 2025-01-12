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
  rectTop = createRect("fill", 300, 5, 200, 15)
  rectBottom = createRect("line", 300, 600 - 15 - 5, 200, 15)
  rectLeft = createRect("fill", 5, 250, 15, 200)
  rectRight = createRect("line", 800 - 15 - 5, 250, 15, 200)
  speed = 450
  ball1 = {}
  ball1.xStart = 395
  ball1.yStart = 295
  ball1.x = ball1.xStart
  ball1.y = ball1.yStart
  ball1.vx = -1
  ball1.vy = 0
end

function love.update(dt)
  if love.keyboard.isDown("up") then
    rectRight.y = rectRight.y - speed * dt
  elseif love.keyboard.isDown("down") then
    rectRight.y = rectRight.y + speed * dt
  end
  if love.keyboard.isDown("left") then
    rectBottom.x = rectBottom.x - speed * dt
  elseif love.keyboard.isDown("right") then
    rectBottom.x = rectBottom.x + speed * dt
  end
  if love.keyboard.isDown("z") then
    rectLeft.y = rectLeft.y - speed * dt
  elseif love.keyboard.isDown("s") then
    rectLeft.y = rectLeft.y + speed * dt
  end
  if love.keyboard.isDown("q") then
    rectTop.x = rectTop.x - speed * dt
  elseif love.keyboard.isDown("d") then
    rectTop.x = rectTop.x + speed * dt
  end
  if ball1.x < 0 or ball1.x > 800 then
    -- game over just reset ball position for now
    ball1.x = ball1.xStart
  end
  if (ball1.x <= 5 + 15 and ball1.y >= rectLeft.y and ball1.y <= rectLeft.y + 200) or (ball1.x >= 800 - 15 - 5  and ball1.y >= rectRight.y and ball1.y <= rectRight.y + 200) then
    ball1.vx = ball1.vx * (-1)
  end
  ball1.x = ball1.x + speed / 3 * ball1.vx * dt
  ball1.y = ball1.y + speed / 3 * ball1.vy * dt
end

function love.draw()
  drawRect(rectTop)
  drawRect(rectLeft)
  drawRect(rectRight)
  drawRect(rectBottom)
  love.graphics.circle("fill", ball1.x, ball1.y, 10)
end
