extends abilities


func doWhatever(delta):
	if player.isAbleToMove:
		if not player.isOnFloor.isOnFloorImprove():
			player.velocityHandler.applyGravity(player.playerAttributeVar.GRAVITY, delta)
