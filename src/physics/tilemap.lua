local tilesize = 64 -- Tile size for the ground

-- -- Function to draw the sky
-- local function drawSky()
--     for i = 0, love.graphics.getHeight(), 1 do
--         local t = i / love.graphics.getHeight()
--         love.graphics.setColor(0.5 * (1 - t), 0.7 * (1 - t), 1) -- Gradient sky
--         love.graphics.line(0, i, love.graphics.getWidth(), i)   -- Draw the gradient line-by-line
--     end
-- end

-- Function to draw the ground with a Zelda-like pseudo-3D perspective
local function drawGround()
    local mapHeight = math.ceil(love.graphics.getHeight() / tilesize) -- Number of rows
    local mapWidth = math.ceil(love.graphics.getWidth() / tilesize)   -- Number of columns

    -- Loop to draw each row of tiles
    for y = 0, mapHeight - 1 do
        -- Calculate vertical position for the row
        local posY = y * tilesize

        -- Loop to draw each column of tiles in the current row
        for x = 0, mapWidth - 1 do
            -- Calculate horizontal position for the tile
            local posX = x * tilesize

            -- Alternate the tile colors for a checkerboard effect
            if (x + y) % 2 == 0 then
                love.graphics.setColor(0.2, 0.7, 0.2)   -- Light green for one tile
            else
                love.graphics.setColor(0.15, 0.6, 0.15) -- Darker green for the other tile
            end

            -- Draw the tile
            love.graphics.rectangle("fill", posX, posY, tilesize, tilesize)
        end
    end

    love.graphics.setColor(1, 1, 1) -- Reset color to white
end

-- Return the functions for use in your main file
return {
    drawGround = drawGround
}
