extends abilities


func doWhatever(_delta):
	if player.isAbleToMove:
		for body in player.repulseHandler.getOtherBody():
			player.velocityHandler.addVelocityXZ(player.repulseHandler.repulse(body,player))
