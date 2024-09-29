local tilemap = require("src.physics.tilemap")
local player  = require("src.entities.player")

function love.load()
    love.graphics.setBackgroundColor(1, 1, 1)
    world = love.physics.newWorld(0, 0, true)

    player.load(world)
end

function love.update(dt)
    world:update(dt)
    player.update(dt)
end


function love.draw()
    tilemap.drawGround()
    player.draw()
end

