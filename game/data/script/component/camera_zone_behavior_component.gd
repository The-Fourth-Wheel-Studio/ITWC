@icon("res://editor/assets/component/cameraZoneBehaviorComponent.png")
extends Node3D
class_name cameraZoneBehavior

func behave():
	
	GameManager.currentCamera.getNewReference()
	GameManager.currentCamera.look_at(GameManager.player.position)
