extends abilities

func doWhatever(delta):
	if player.isAbleToMove:
		# Handle Jump.
		if player.inputhandler.asJump :
			if player.isOnFloor.isOnFloorImprove() or player.isOnFloor.isCoyoteTime():
				player.isOnFloor.resetCoyote()
				player.velocityHandler.setVelocityY(player.playerAttributeVar.JUMP_VELOCITY)
			elif player.velocityHandler.Velocity.y <= 0:
				player.gravityAccelerator = true
		elif player.inputhandler.releaseJump :
			player.velocityHandler.divideVelocityY(2)
			player.gravityAccelerator = true
