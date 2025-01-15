function Keyinput(bars, balls, dt, speed)
  if love.keyboard.isDown("up") then
    bars.right:up(dt, speed)
  elseif love.keyboard.isDown("down") then
    bars.right:down(dt, speed)
  end
  if love.keyboard.isDown("left") then
    bars.bottom:left(dt, speed)
  elseif love.keyboard.isDown("right") then
    bars.bottom:right(dt, speed)
  end
  if love.keyboard.isDown("z") then
    bars.left:up(dt, speed)
  elseif love.keyboard.isDown("s") then
    bars.left:down(dt, speed)
  end
  if love.keyboard.isDown("q") then
    bars.top:left(dt, speed)
  elseif love.keyboard.isDown("d") then
    bars.top:right(dt, speed)
  end
end