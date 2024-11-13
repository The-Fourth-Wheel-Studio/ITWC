extends abilities


func doWhatever(delta):
	if player.isAbleToMove:
		for body in player.repulseHandler.getOtherBody():
			player.velocityHandler.addVelocityXZ(player.repulseHandler.repulse(body,player))
