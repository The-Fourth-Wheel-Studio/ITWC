extends abilities

var speed : float = 0.0

func doWhatever():
	if player.isAbleToMove:
		
		speed = lerp(speed, 
					player.speedVariation(),
					player.playerAttributeVar.SPEED_VARIATION)
		print("ok ", player.speedVariation())
		var input_dir = player.inputhandler.direction
		print(input_dir)
		print(player.camera.getNewDir(input_dir) * player.speed)
		player.velocity = player.camera.getNewDir(input_dir) * player.speed
