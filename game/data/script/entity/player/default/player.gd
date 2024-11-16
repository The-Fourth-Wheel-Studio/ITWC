extends Player
	
func _ready():
	GameManager.setCurrentPlayer(self)
	abilitieManager.load()
	
func _unhandled_input(event):
	pass

func _process(delta):
	#set velocity
	velocityHandler.setCurrentVelocity(velocity)
	#move
	abilitieManager.execute(delta)
	#repulse handler to fix
	#for body in repulseHandler.getOtherBody():
		#velocityHandler.addVelocityXZ(repulseHandler.repulse(body,self))
	velocity = velocityHandler.getFinalVelocity()
	move_and_slide()
		
func speedVariation():
	var speed : float 
	if inputhandler.isSprinting :
		speed = playerAttributeVar.SPRINT_SPEED
	elif inputhandler.isCrouch :
		speed = playerAttributeVar.CROUCH_SPEED
	else :
		speed = playerAttributeVar.WALK_SPEED
	return speed 

	
func _headbob(time) -> Vector3:
	var pos : Vector3 = Vector3.ZERO
	pos.y = sin(time * playerAttributeVar.BOB_FREQUENTY) * playerAttributeVar.BOB_AMPLITUDE
	pos.x = cos(time * playerAttributeVar.BOB_FREQUENTY/2.0) * playerAttributeVar.BOB_AMPLITUDE
	return pos
