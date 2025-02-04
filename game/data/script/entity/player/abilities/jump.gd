extends abilities


func doWhatever(delta):
	if player.isAbleToMove:
			# Handle Jump.
			if player.inputhandler.asJump :
				if player.isOnFloor.isOnFloorImprove() or player.isOnFloor.isCoyoteTime():
					player.isOnFloor.resetCoyote()
					player.velocityHandler.setVelocityY(player.playerAttributeVar.JUMP_VELOCITY)
