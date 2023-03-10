 function love.load( ... )
  	-- body

    -- libraries
    camera=require 'libraries/camera'
    sti = require 'libraries/sti'
    wf = require 'libraries/windfield'

    cam=camera()

    world = wf.newWorld(0,0)
    gameMap = sti('maps/testMap2.lua')

 	player={
 		x = 100,
 		y = 200,
        collider = world:newBSGRectangleCollider(200,250,20,40,4),
        speed = 300,
        image=love.graphics.newImage('sprites/player/player.png')

 	}
    player.collider:setFixedRotation(true)

    walls={}

    -- check for collisons on every wall 
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

    cam:attach()

        gameMap:draw()
 	-- love.graphics.rectangle('fill',player.x-10,player.y-20,20,40)
        love.graphics.draw(player.image,player.x,player.y)
    -- world:draw()
    cam:detach()
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