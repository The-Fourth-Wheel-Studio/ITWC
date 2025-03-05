@icon("res://editor/assets/component/inputHandler.png")
extends Node
class_name inputHandler


@export var asJump : bool = false
@export var isSprinting : bool = false
@export var direction : Vector2 = Vector2(0, 0)
@export var leftClick : bool = false
@export var isCrouch : bool = false
@export var constraint : Dictionary
	
func gather():
	asJump = Input.is_action_pressed("jump")
	isSprinting = Input.is_action_pressed("sprint")
	direction = Input.get_vector("left", "right", "up", "down")
	leftClick = Input.is_action_pressed("left_click")
	isCrouch = Input.is_action_pressed("crouch")
	applyconstraint()

func applyconstraint():
	for i in constraint.keys():
		var varToChange = get(constraint[i])
		var varToSet = get(i)
		varToChange = Common.xor(varToChange, varToSet)
		set(constraint[i], varToChange)
