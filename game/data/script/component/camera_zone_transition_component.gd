@icon("res://editor/assets/component/cameraZoneTransitionComponent.png")
extends Node3D
class_name cameraZoneTransition

@export var rotationTransition : cameraZoneRotationTransition

var pos : Vector3 

func _ready():
	pos = self.global_position

func transition():
	if (pos.distance_to(GameManager.currentCamera.position) < 0.6):
		return false
	else:
		rotationTransition.doSomething()
		return true
