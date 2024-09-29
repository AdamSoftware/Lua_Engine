local player = {
    body = nil,
    shape = nil,
    fixture = nil,
    sprite = nil,
    speed = 200,
    jumpImpulse = -500
}

function player.load(world)
    player.body = love.physics.newBody(world, 100, 100, "dynamic") -- Starting position (100, 100)
    player.shape = love.physics.newRectangleShape(32, 32)          -- Size of the player
    player.fixture = love.physics.newFixture(player.body, player.shape)
    player.body:setGravityScale(1)
    -- Load the player sprite
    local success
    success, player.sprite = pcall(love.graphics.newImage, "assets/images/Character.png")
    if not success then
        error("Failed to load player sprite: " .. player.sprite)
    end
end

function player.update(dt)
    local vx, vy = 0, 0
    if love.keyboard.isDown("a") then
        vx = -player.speed
    elseif love.keyboard.isDown("d") then
        vx = player.speed
    end

    if love.keyboard.isDown("w") then
        vy = -player.speed
    elseif love.keyboard.isDown("s") then
        vy = player.speed
    end

    player.body:setLinearVelocity(vx, vy)
    
    jump()
end


function jump()
    local _, vy = player.body:getLinearVelocity()
    if love.keyboard.isDown("space") and math.abs(vy) < 0.1 then
        player.body:applyLinearImpulse(0, player.jumpImpulse)
    end
end



function player.draw()
    local x, y = player.body:getPosition()

    -- Get the points of the rectangle shape
    local points = {player.shape:getPoints()}
    local width = points[3] - points[1]
    local height = points[4] - points[2]

    -- Draw the player sprite, centered on the physics body
    love.graphics.draw(player.sprite, x, y, 0, 1, 1, width / 2, height / 2)
end

return player
