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
  if location == "top" then
    ball.bouncey = bar.y + bar.height / 2 + ball.radius + 1
  else
    ball.bouncey = bar.y - bar.height / 2 - ball.radius - 2
  end
end

local function verticalbounce(location, bar, ball)
  local dir = ball.vx > 0 and (-1) or 1
  ball.vy = (ball.y - bar.y) / (bar.height * 1.1 / 2) * ball.speed
  ball.vx = math.sqrt(ball.speed ^ 2 - ball.vy ^ 2)
  ball.vx = ball.vx * dir
  if location == "left" then
    ball.bouncex = bar.x + bar.width / 2 + ball.radius + 2
  else
    ball.bouncex = bar.x - bar.width / 2 - ball.radius - 2
  end
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
    -- if Score % 10 == 0 then
    --   Level = Level + 1
    --   if Level > #LevelUp then
    --     Level = 1
    --   end
    -- end
    LevelUp[Level](location, bar, ball, 10)
    -- ball.speed = ball.speed + 10
    -- if #Balls < 3 and Score > 0 and Score % 10 == 0 then
    --   table.insert(Balls, Ball(200, Assets[1]))
    -- end
  end
end

function Collision(bars, balls)
  for index, ball in ipairs(balls) do
    for location, bar in pairs(bars) do
      checkcollision(location, bar, ball)
    end
  end
end

local function infinite_bounce(ball)
  if ball.x <= 0 or ball.x >= 800 then
    ball.vx = -ball.vx
    if ball.x <= 0 then
      ball.x = 0
    else
      ball.x = 800
    end
  else
    ball.vy = -ball.vy
    if ball.y <= 0 then
      ball.y = 0
    else
      ball.y = 600
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
      if Infinite then
        infinite_bounce(ball)
      else
        table.remove(balls, index)
        if #balls == 0 then
          -- Song:setLooping(false)
          Song[1]:stop()
          Song[2]:play()
        end
      -- ball:restart()
      end
    end
  end
end