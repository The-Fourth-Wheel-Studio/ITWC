extends abilities


func doWhatever(_delta):
	if player.isAbleToMove:
		for body in player.repulseHandlerComponent.getOtherBody():
			player.velocityHandler.addVelocityXZ(player.repulseHandlerComponent.repulse(body,player))
