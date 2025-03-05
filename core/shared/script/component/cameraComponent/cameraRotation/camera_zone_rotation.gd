@icon("res://editor/assets/component/cameraZoneRotationComponent.png")
extends Node3D
class_name cameraRotation
static var _scriptName : String = "camera_zone_rotation"

var rot : Vector3 = Vector3.ZERO

func setup():
	pass
	
func justRotate():
	GameManager.currentCamera.rotation = getCameraRotation()

func getCameraRotation():
	return Vector3.ZERO

func getLookVector():
	return -transform.basis.z.normalized()
