extends abilities

var speed : float = 0.0

func doWhatever(delta):
	if player.isAbleToMove:
		
		speed = lerp(speed, 
					player.speedVariation(),
					player.playerAttributeVar.SPEED_VARIATION)
		var input_dir = player.inputhandler.direction
		player.velocityHandler.setVelocityXZ(player.camera.getNewDir(input_dir) * speed)
