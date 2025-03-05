extends Player

func _enter_tree():
	GameManager.setCurrentPlayer(self)
	abilitieManager.load()
	
func _unhandled_input(_event):
	pass

func execute(delta):
	#set velocity
	inputhandler.gather()
	velocityHandler.setCurrentVelocity(velocity)
	#move
	abilitieManager.execute(delta)
	#repulse handler to fix (titruc - july 2024)
	#it's fix ! (look at habilities) (titruc - november 2024)
	
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
