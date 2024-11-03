@icon("res://editor/assets/component/cameraZoneTransitionComponent.png")
extends Node3D
class_name cameraZoneTransition

@export var startPos : cameraZoneBehaviorStartPos
@export var speed : float = 1.0

var startPoint : Vector3 

func _ready():
	startPoint = startPos.position

func transition():
	if (startPoint.distance_to(GameManager.currentCamera.position) < 0.6):
		return false
	else:
		GameManager.currentCamera.moveFromVect3((startPoint - GameManager.currentCamera.position).normalized() * speed)
		GameManager.currentCamera.look_at(GameManager.player.position)
		return true
