extends abilities

var speed : float = 0.0

func doWhatever(delta):
	if player.isAbleToMove:
		speed = lerp(speed, 
					player.speedVariation(),
					player.playerAttributeVar.SPEED_VARIATION)
		player.velocityHandler.lerpVelocityXZ(player.camera.getNewDir(player.inputhandler.direction) * speed * delta,0.2)
		if player.inputhandler.direction.length():
			applyRotation(delta)

func applyRotation(delta):
	var refVector : Vector2 = GameManager.currentCamera.getNewDir(player.inputhandler.direction)
	player.model.rotation.y = lerp_angle(player.model.rotation.y,Common.getComplexArgument(refVector.x, refVector.y * -1),0.08 * delta)

	
