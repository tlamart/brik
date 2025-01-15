if arg[2] == "debug" then
  require("lldebugger").start()
end

local function initBar()
  local bars = {}
  bars.top = Bar(400, 15, 2, 1, "yellow")
  bars.bottom = Bar(400, 600 - 15, 2, 1, "red")
  bars.left = Bar(15, 300, 1, 2, "green")
  bars.right = Bar(800 - 15, 300, 1, 2, "blue")
  return bars
end

function love.load()
  math.randomseed(os.time())
  Object = require "classic"
  Bar = require "bar"
  Ball = require "ball"
  require "physics"
  require "input"
  Bars = initBar()
  Assets = {love.graphics.newImage("assets/bar_round_small_square.png")}
  Balls = {Ball(200, Assets[1])}
  Speed = 400
  Score = 0
  local song = love.audio.newSource("assets/tron-arp-synth-loop-155bpm-cb-minor-191911.mp3", "stream")
  song:setLooping(true)
  song:play()
end

function love.update(dt)
  Keyinput(Bars, Balls, dt, Speed)
  Isballin(Balls)
  Collision(Bars, Balls)
  Move(Balls, dt)
end

function love.draw()
  Bars.top:draw()
  Bars.bottom:draw()
  Bars.left:draw()
  Bars.right:draw()
  for index, ball in ipairs(Balls) do
    ball:draw()
  end
  love.graphics.print("Score:"..Score, 25, 25)
end

local love_errorhandler = love.errorhandler

function love.errorhandler(msg)
    if lldebugger then
        error(msg, 2)
    else
        return love_errorhandler(msg)
    end
end