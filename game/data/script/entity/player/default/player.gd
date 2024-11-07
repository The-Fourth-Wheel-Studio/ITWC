extends CharacterBody3D

#var for movement
var speed : float = 0.0
@export var playerAttributeVar : playerAttribute
@export var isAbleToMove : bool = true

@export var velocityHandler : velocityComponent
@export var inputhandler : inputHandler
@export var isOnFloor : isOneFloorComponent
@export var repulseHandler : repulseHandler
@export var camera : theBestCameraEver

@export var abilitieManager : abilitiesManager
	
func _ready():
	GameManager.setCurrentPlayer(self)
	abilitieManager.load()
	
func _unhandled_input(event):
	pass

func _process(delta):
	
	abilitieManager.execute()
	
	velocityHandler.setCurrentVelocity(velocity)
	if isAbleToMove:
		if not isOnFloor.isOnFloorImprove():
			velocityHandler.applyGravity(playerAttributeVar.GRAVITY, delta)
		# Handle Jump.
		if inputhandler.asJump :
			if isOnFloor.isOnFloorImprove():
				velocityHandler.setVelocityY(playerAttributeVar.JUMP_VELOCITY)

		# Update speed
		var currentSpeed : float
		speed = lerp(speed, 
					speedVariation(),
					playerAttributeVar.SPEED_VARIATION)
		var input_dir = inputhandler.direction
		#velocityHandler.setVelocityXZ(camera.getNewDir(input_dir) * speed)

		for body in repulseHandler.getOtherBody():
			velocityHandler.addVelocityXZ(repulseHandler.repulse(body,self))

		
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
