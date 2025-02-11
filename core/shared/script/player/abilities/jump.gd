extends abilities


func doWhatever(_delta):
	if player.isAbleToMove:
			# Handle Jump.
			if player.inputhandler.asJump :
				if player.isOnFloor.isOnFloorImprove():
					player.velocityHandler.setVelocityY(player.playerAttributeVar.JUMP_VELOCITY)
