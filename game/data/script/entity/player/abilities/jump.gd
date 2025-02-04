extends abilities

@export var bufferTimer : Timer

func _ready():
	bufferTimer.one_shot = true
	
func doWhatever(delta):
	if player.isAbleToMove:
			# Handle Jump.
			if player.inputhandler.asJump :
				if player.isOnFloor.isOnFloorImprove() or player.isOnFloor.isCoyoteTime():
					player.isOnFloor.resetCoyote
					bufferTimer.start(player.playerAttributeVar.JUMP_TIME)
					player.velocityHandler.addVelocityY(player.playerAttributeVar.JUMP_VELOCITY)
				if not player.isOnFloor.isOnFloorImprove() and not bufferTimer.is_stopped():
					player.velocityHandler.addVelocityY(player.playerAttributeVar.JUMP_FORCE)
