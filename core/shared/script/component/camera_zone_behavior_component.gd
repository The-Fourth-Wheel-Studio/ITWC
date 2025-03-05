@icon("res://editor/assets/component/cameraZoneBehaviorComponent.png")
extends Node3D
class_name cameraZoneBehavior


func setup():
	pass

func setCameraPosition(pos):
	GameManager.currentCamera.position = pos

func getCameraPosition():
	return Vector3.ZERO
