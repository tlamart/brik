local button = Object:extend()

function button:new(x, y, text, callback, ...)
    self.x = x
    self.y = y
    self.width = 400
    self.height = 40
    self.text = text
    self.callback = callback
    self.arg = {...}
end

function button:draw()
    love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
    love.graphics.print(self.text, self.x + self.width / 2, self.y + self.height / 2, 0, 1.5, 1.5, #self.text * 3.5, 7)
end

function button:click()
    self.callback(self.arg)
end

local title = Object:extend()

function title:new(x, y, text)
    self.x = x
    self.y = y
    self.text = text
    self.width = 400
    self.height = 60
end

function title:draw()
    love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
    love.graphics.print(self.text, self.x + self.width / 2, self.y + self.height / 2, 0, 1.5, 1.5, #self.text * 3.5, 7)
end

local ui = Object:extend()

local function setLevel(n)
    n = n[1]
    Level = n
    if n == 6 then Infinite = true end
    Song[1]:play()
end

function ui:new()
    local x, y = love.graphics.getDimensions()
    x = x / 2 - 200
    y = 100
    self.ui = {
        title(x, y + 0 * 50, "Select a game mode:"),
        button(x, y + 3 * 50, "Classic", setLevel, 1),
        button(x, y + 4 * 50, "Ball acceleration", setLevel, 2),
        button(x, y + 5 * 50, "Bar shrink", setLevel, 3),
        button(x, y + 6 * 50, "Multiple balls", setLevel, 4),
        -- button(x, y + 5 * 50, "Multiple balls (impossible mode)", setLevel, 5),
        -- button(x, y + 6 * 50, "Infinite mode", setLevel, 5)
    }
end

function ui:draw()
    for _, obj in ipairs(self.ui) do
        obj:draw()
    end
end

return ui