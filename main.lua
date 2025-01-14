function checkCollision(bars, ball)
  if bars.left.x + bars.left.width >= ball.x - ball.radius
  and bars.left.y <= ball.y
  and bars.left.y + bars.left.height >= ball.y
  then
    ball.vx = ball.vx * (-1)
    ball.vy = math.random()
    ball.speed = ball.speed + 50
  end
  if bars.right.x <= ball.x + ball.radius
  and bars.right.y <= ball.y
  and bars.right.y + bars.right.height >= ball.y
  then
    ball.vx = ball.vx * (-1)
    ball.vy = math.random()
    ball.speed = ball.speed + 50
  end
  if bars.top.y + bars.top.height >= ball.y - ball.radius
  and bars.top.x <= ball.x
  and bars.top.x + bars.top.width >= ball.x
  then
    ball.vy = ball.vy * (-1)
    ball.vx = math.random()
    ball.speed = ball.speed + 50
  end
  if bars.bottom.y <= ball.y + ball.radius
  and bars.bottom.x <= ball.x
  and bars.bottom.x + bars.bottom.width >= ball.x
  then
    ball.vy = ball.vy * (-1)
    ball.vx = math.random()
    ball.speed = ball.speed + 50
  end
end
function initBar()
  bars = {}
  bars.top = Bar("fill", 300, 5, 200, 15)
  bars.bottom = Bar("line", 300, 600 - 15 - 5, 200, 15)
  bars.left = Bar("fill", 5, 250, 15, 200)
  bars.right = Bar("line", 800 - 15 - 5, 250, 15, 200)
  bars.speed = 450
  return bars
end
function love.load()
  math.randomseed(os.time())
  Object = require "classic"
  Bar = require "bar"
  Ball = require "ball"
  bars = initBar()
  balls = {Ball(395, 295, -1, 0, 200)}
end
function love.update(dt)
  if love.keyboard.isDown("up") then
    bars.right:up(dt, bars.speed)
  elseif love.keyboard.isDown("down") then
    bars.right:down(dt, bars.speed)
  end
  if love.keyboard.isDown("left") then
    bars.bottom:left(dt, bars.speed)
  elseif love.keyboard.isDown("right") then
    bars.bottom:right(dt, bars.speed)
  end
  if love.keyboard.isDown("z") then
    bars.left:up(dt, bars.speed)
  elseif love.keyboard.isDown("s") then
    bars.left:down(dt, bars.speed)
  end
  if love.keyboard.isDown("q") then
    bars.top:left(dt, bars.speed)
  elseif love.keyboard.isDown("d") then
    bars.top:right(dt, bars.speed)
  end
  for index, ball in ipairs(balls) do
    -- If ball outstide the screen, restart is position
    if ball.x < 0
    or ball.x > 800
    or ball.y < 0
    or ball.y > 600
    then ball:restart()
    end
  end
  for index, ball in ipairs(balls) do
    checkCollision(bars, ball)
    ball:update(dt)
  end
  if love.keyboard.isDown("space") then
    for index, ball in ipairs(balls) do
      ball:restart()
    end
  end
end

function love.draw()
  bars.top:draw()
  bars.bottom:draw()
  bars.left:draw()
  bars.right:draw()
  for index, ball in ipairs(balls) do
    ball:draw()
  end
end