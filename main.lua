if arg[2] == "debug" then
  require("lldebugger").start()
end

local function initBar()
  local bars = {}
  bars.top = Bar(400, 15, 1, 0.5, Assets[2], Speed)
  bars.bottom = Bar(400, 600 - 15, 1, 0.5, Assets[3], Speed)
  bars.left = Bar(15, 300, 0.5, 1, Assets[4], Speed)
  bars.right = Bar(800 - 15, 300, 0.5, 1, Assets[5], Speed)
  return bars
end

function love.load()
  math.randomseed(os.time())
  Object = require "classic"
  Bar = require "bar"
  Ball = require "ball"
  LevelUp = require "level"
  Level = nil
  require "physics"
  require "input"
  Assets = {
    love.graphics.newImage("assets/bar_round_small_square.png"),
    love.graphics.newImage("assets/yellow/bar_square_small.png"),
    love.graphics.newImage("assets/red/bar_square_small.png"),
    love.graphics.newImage("assets/blue/bar_square_small.png"),
    love.graphics.newImage("assets/green/bar_square_small.png"),
  }
  Speed = 400
  Bars = initBar()
  Balls = {Ball(200, Assets[1])}
  Score = 0
  Song = {
    love.audio.newSource("assets/tron-arp-synth-loop-155bpm-cb-minor-191911.mp3", "stream"),
    love.audio.newSource("assets/medium-explosion-40472.mp3", "static"),
  }
  Song[1]:setLooping(true)
  Menu = require "menu"
  Menu = Menu()
end

local function inGame()
  return #Balls ~= 0
end

function love.update(dt)
  if Level ~= nil then
    if inGame() then
      Keyinput(Bars, Balls, dt)
      Isballin(Balls)
      Collision(Bars, Balls)
      Move(Balls, dt)
    else
      if love.keyboard.isDown("f1") then
        table.insert(Balls, Ball(200, Assets[1]))
        Score = 0
        Level = nil
      elseif love.keyboard.isDown("f2") then
        love.event.quit('quit')
      end
    end
  end
end

function love.mousepressed(x, y, button)
  if Level == nil then
    for i = 2, #Menu.ui do
      if math.abs(x - (Menu.ui[i].x + Menu.ui[i].width / 2)) <= Menu.ui[i].width / 2
      and math.abs(y - (Menu.ui[i].y + Menu.ui[i].height / 2)) <= Menu.ui[i].height
      then
        Menu.ui[i].callback(Menu.ui[i].arg)
      end
    end
  end
end

function love.draw()
  if Level then
    Bars.top:draw()
    Bars.bottom:draw()
    Bars.left:draw()
    Bars.right:draw()
    for index, ball in ipairs(Balls) do
      ball:draw()
    end
    love.graphics.print("Score:"..Score, 25, 25)
    if inGame() == false then
      love.graphics.print("\t\tPerdu !\n\nPress f1 to restart\nPress f2 to quit", 340, 280)
    end
  else
    Menu:draw()
  end
end

local love_errorhandler = love.errorhandler

function love.errorhandler(msg)
    if lldebugger then
        error(msg, 2)
    else
        return love_errorhandler(msg)
    end
end