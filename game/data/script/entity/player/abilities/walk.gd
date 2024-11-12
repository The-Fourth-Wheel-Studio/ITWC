extends abilities

var speed : float = 0.0

func doWhatever(delta):
	if player.isAbleToMove:
		
		speed = lerp(speed, 
					player.speedVariation(),
					player.playerAttributeVar.SPEED_VARIATION)
		var input_dir : Vector2 = player.inputhandler.direction
		player.velocityHandler.setVelocityXZ(player.camera.getNewDir(input_dir) * speed)
		var refVector : Vector2 = GameManager.currentCamera.getNewDir(Vector2(1.0,0.0))
		player.model.rotation = Vector3(0.0,Vector3(refVector.x,0.0,refVector.y).angle_to(Vector3(player.camera.getNewDir(input_dir).x,0.0,player.camera.getNewDir(input_dir).y)),0.0)
