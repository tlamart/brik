local function ball_speed_variation(location, bar, ball, delta)
    ball.speed = ball.speed + delta
end

local function bar_speed_variation(location, bar, ball, delta)
    bar.speed = bar.speed + delta
end

local function bar_resize(location, bar, ball, delta)
    if location == "top" or location == "bottom" then
        bar.scalex = bar.scalex + -delta / 100
        bar.width = bar.asset:getWidth() * bar.scalex
        bar.originx = bar.width / (2 * bar.scalex)
    else
        bar.scaley = bar.scaley + -delta / 100
        bar.height = bar.asset:getHeight() * bar.scaley
        bar.originy = bar.height / (2 * bar.scaley)
    end
end

local function ball_double(location, bar, ball, delta)
    local new = Ball(ball.speed, ball.asset)
    new.x = ball.x
    new.y = ball.y
    new.bouncex = ball.bouncex
    new.bouncey = ball.bouncey
    if location == "top" or location == "bottom" then
        new.vx = -ball.vx
        new.vy = ball.vy
    else
        new.vx = ball.vx
        new.vy = -ball.vy
    end
    table.insert(Balls, new)
end

local function ball_pop(location, bar, ball, delta)
    table.insert(Balls, Ball(ball.speed, ball.asset))
end

local function infinite_mode(location, bar, ball, delta)
    Infinite = true
end

local levelUp = {
    bar_speed_variation,
    ball_speed_variation,
    bar_resize,
    ball_pop,
    ball_double,
    infinite_mode,
}

return levelUp