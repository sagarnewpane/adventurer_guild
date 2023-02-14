 function love.load( ... )
  	-- body
 	player={}
    player.x=140
    player.y=300

    player.image=love.graphics.newImage('sprites/player/player.png')
 end
 function love.update( dt )
 	-- body
 	check_move()
 end

 function love.draw()
 	-- body
 	love.graphics.draw(player.image,player.x,player.y)
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