function Keyinput(bars, balls, dt)
  if love.keyboard.isDown("up") then
    bars.right:up(dt)
  elseif love.keyboard.isDown("down") then
    bars.right:down(dt)
  end
  if love.keyboard.isDown("left") then
    bars.bottom:left(dt)
  elseif love.keyboard.isDown("right") then
    bars.bottom:right(dt)
  end
  if love.keyboard.isDown("z") then
    bars.left:up(dt)
  elseif love.keyboard.isDown("s") then
    bars.left:down(dt)
  end
  if love.keyboard.isDown("q") then
    bars.top:left(dt)
  elseif love.keyboard.isDown("d") then
    bars.top:right(dt)
  end
end