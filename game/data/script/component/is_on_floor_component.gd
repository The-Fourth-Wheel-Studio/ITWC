@icon("res://editor/assets/component/isOnFloorComponent.png")
extends Node3D
class_name isOneFloorComponent

@export_category("don't touch unless you're Titruc")
@export var NodeToCheck : Node

@export_category("floor")
@export var lenght : float
@export var raycast : RayCast3D

@export_category("Coyote Time")
@export var coyoteTimer : Timer
@export var coyoteTime : float = 0.01

var wasOnFloor : bool = true

func _ready():
	raycast.target_position.y = lenght * -1.0
	
func isOnFloorImprove():
	var ok : bool = NodeToCheck.is_on_floor() or raycast.is_colliding()
	if not ok and wasOnFloor:
		coyoteTimer.start(coyoteTime)
	wasOnFloor = ok
	return ok
	
func isCoyoteTime():
	return not coyoteTimer.is_stopped()

func resetCoyote():
	coyoteTimer.stop()
