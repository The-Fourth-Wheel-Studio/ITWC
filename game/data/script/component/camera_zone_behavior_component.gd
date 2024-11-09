@icon("res://editor/assets/component/cameraZoneBehaviorComponent.png")
extends Node3D
class_name cameraZoneBehavior

@export var x : Vector3
@export var y : Vector3


func behave():
	
	GameManager.currentCamera.getNewReference()
	GameManager.currentCamera.look_at(GameManager.player.position)
