function initBar()
  bars = {}
  bars.top = Bar(300, 15, 200, 15, "yellow")
  bars.bottom = Bar(300, 600 - 15, 200, 15, "red")
  bars.left = Bar(15, 250, 15, 200, "green")
  bars.right = Bar(800 - 15, 250, 15, 200, "blue")
  bars.speed = 450
  return bars
end
function love.load()
  math.randomseed(os.time())
  Object = require "classic"
  Bar = require "bar"
  Ball = require "ball"
  require "physics"
  require "input"
  bars = initBar()
  balls = {Ball(395, 295, 200,"assets/bar_round_small_square.png")}
  --song = love.audio.newSource("assets/tron-arp-synth-loop-155bpm-cb-minor-191911.mp3", "stream")
  --song:setLooping(true)
  --song:play()
end
function love.update(dt)
  keyinput(bars, balls, dt)
  isballin(balls)
  collision(bars, balls)
  move(balls, dt)
end
function love.draw()
  bars.top:draw(0)
  bars.bottom:draw(0)
  bars.left:draw(math.pi / 2)
  bars.right:draw(math.pi / 2)
  for index, ball in ipairs(balls) do
    ball:draw()
  end
end