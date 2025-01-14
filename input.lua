function keyinput(bars, balls, dt)
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
end