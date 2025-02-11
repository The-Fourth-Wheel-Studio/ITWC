@icon("res://editor/assets/component/cameraZoneBehaviorComponent.png")
extends Node3D
class_name cameraZoneBehavior

var cameraPosition : Vector3 = Vector3.ZERO

func behave():
	pass

func setup():
	cameraPosition = self.global_position

func setCameraPosition(pos):
	GameManager.currentCamera.position = pos

func getCameraPosition():
	return Vector3.ZERO

func behaveInTransition():
	cameraPosition = getCameraPosition()
