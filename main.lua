 function love.load( ... )
  	-- body
 	player={
 		x = 100,
 		y = 200
 	}
 end
 function love.update( dt )
 	-- body
 	check_move()
 end

 function love.draw()
 	-- body
 	love.graphics.rectangle('fill',player.x,player.y,20,40)
 end

 function check_move( ... )
 	-- body
 	if love.keyboard.isDown('up') then
 		player.y = player.y - 10
 	end
 	if love.keyboard.isDown('down') then
 		player.y = player.y + 10
 	end
 	if love.keyboard.isDown('left') then
 		player.x = player.x - 10
 	end
 	if love.keyboard.isDown('right') then
 		player.x = player.x + 10

 	else return
 	end

 end