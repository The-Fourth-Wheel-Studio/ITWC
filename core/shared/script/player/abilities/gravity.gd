extends abilities


func doWhatever(delta):
	if player.isAbleToMove:
		if not player.isOnFloor.isOnFloorImprove():
			if player.gravityAccelerator:
				player.velocityHandler.applyGravity(player.playerAttributeVar.GRAVITY * player.playerAttributeVar.ACCELERATION_FACTOR, delta)
			else:
				player.velocityHandler.applyGravity(player.playerAttributeVar.GRAVITY, delta)
		elif player.gravityAccelerator:
			player.gravityAccelerator = false
