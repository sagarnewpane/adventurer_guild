 function love.load( ... )
  	-- body

    sti = require 'libraries/sti'
    wf = require 'libraries/windfield'
    world = wf.newWorld(0,0)
    gameMap = sti('maps/testMap.lua')
 	player={
 		x = 1000,
 		y = 200,
        collider = world:newBSGRectangleCollider(200,250,20,40,4),
        speed = 300
 	}
    player.collider:setFixedRotation(true)

    walls={}
    if gameMap.layers['walls'] then
        for i,obj in pairs(gameMap.layers['walls'].objects) do
            local wall = world:newRectangleCollider(obj.x,obj.y,obj.width,obj.height)
            wall:setType('static')
            table.insert(walls,wall)
        end
    end

 end



 function love.update( dt )
 	-- body
 	check_move()
    world:update(dt)
    player.x = player.collider:getX()
    player.y = player.collider:getY()
 end

 function love.draw()
 	-- body
    gameMap:draw()
 	love.graphics.rectangle('fill',player.x-10,player.y-20,20,40)
    -- world:draw()
    
 end

 function check_move( ... )
 	-- body
    local vx = 0
    local vy = 0
 	if love.keyboard.isDown('up') then
 		vy = player.speed * -1
 	end
 	if love.keyboard.isDown('down') then
 		vy = player.speed 
 	end
 	if love.keyboard.isDown('left') then
 		vx = player.speed * -1 
 	end
 	if love.keyboard.isDown('right') then
 		vx = player.speed
 	end
    player.collider:setLinearVelocity(vx,vy)    

 end