function move(balls, dt)
  for index, ball in ipairs(balls) do
    ball:update(dt)
  end
end
function collision(bars, balls)
  for index, ball in ipairs(balls) do
    checkCollision(bars, ball)
  end
end
function checkCollision(bars, ball)
  if bars.left.x + bars.left.width >= ball.x - ball.radius
  and bars.left.y <= ball.y
  and bars.left.y + bars.left.height >= ball.y
  then
    ball.vy = math.random((-1) * ball.speed, ball.speed)
    ball.vx = math.sqrt(ball.speed * ball.speed - ball.vy * ball.vy)
    --ball.speed = ball.speed + 10
    --bars.speed = bars.speed + 10
  end
  if bars.right.x <= ball.x + ball.radius
  and bars.right.y <= ball.y
  and bars.right.y + bars.right.height >= ball.y
  then
    ball.vy = math.random((-1) * ball.speed, ball.speed)
    ball.vx = (-1) * math.sqrt(ball.speed * ball.speed - ball.vy * ball.vy)
    ball.speed = ball.speed + 10
    bars.speed = bars.speed + 10
  end
  if bars.top.y + bars.top.height >= ball.y - ball.radius
  and bars.top.x <= ball.x
  and bars.top.x + bars.top.width >= ball.x
  then
    ball.vx = math.random((-1) * ball.speed, ball.speed)
    ball.vy = math.sqrt(ball.speed * ball.speed - ball.vx * ball.vx)
    ball.speed = ball.speed + 10
    bars.speed = bars.speed + 10
  end
  if bars.bottom.y <= ball.y + ball.radius
  and bars.bottom.x <= ball.x
  and bars.bottom.x + bars.bottom.width >= ball.x
  then
    ball.vx = math.random((-1) * ball.speed, ball.speed)
    ball.vy = (-1) * math.sqrt(ball.speed * ball.speed - ball.vx * ball.vx)
    ball.speed = ball.speed + 10
    bars.speed = bars.speed + 10
  end
end
function isballin(balls)
  for index, ball in ipairs(balls) do
    -- If ball outstide the screen, restart its position
    if ball.x < 0
    or ball.x > 800
    or ball.y < 0
    or ball.y > 600
    then ball:restart()
    end
  end
end