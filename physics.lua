function Move(balls, dt)
  for index, ball in ipairs(balls) do
    ball:update(dt)
  end
end

local function horizontalbounce(location, bar, ball)
  local dir = ball.vy > 0 and (-1) or 1
  ball.vx = ((ball.x - bar.x) / (bar.width * 1.1 / 2)) * ball.speed
  ball.vy = math.sqrt(ball.speed ^ 2 - ball.vx ^ 2)
  ball.vy = ball.vy * dir
end

local function verticalbounce(location, bar, ball)
  local dir = ball.vx > 0 and (-1) or 1
  ball.vy = (ball.y - bar.y) / (bar.height * 1.1 / 2) * ball.speed
  ball.vx = math.sqrt(ball.speed ^ 2 - ball.vy ^ 2)
  ball.vx = ball.vx * dir
end

local function bounce(location, bar, ball)
  if location == "top"
  or location == "bottom"
  then
    horizontalbounce(location, bar, ball)
  else
    verticalbounce(location, bar, ball)
  end
end
local function checkcollision(location, bar, ball)
  if math.abs(bar.x - ball.x) <= bar.width / 2 + ball.radius
  and math.abs(bar.y - ball.y) <= bar.height / 2 + ball.radius
  then
    bounce(location, bar, ball)
    Score = Score + 1
    if #Balls < 3 and Score > 0 and Score % 10 == 0 then
      table.insert(Balls, Ball(200, Assets[1]))
    end
  end
end

function Collision(bars, balls)
  for index, ball in ipairs(balls) do
    for location, bar in pairs(bars) do
      checkcollision(location, bar, ball)
    end
  end
end

function Isballin(balls)
  for index, ball in ipairs(balls) do
    if ball.x < 0
    or ball.x > 800
    or ball.y < 0
    or ball.y > 600
    then
      table.remove(balls, index)
    end
  end
end