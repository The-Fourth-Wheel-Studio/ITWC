@icon("res://editor/assets/component/cameraZonereferenceComponent.png")
extends Node3D
class_name cameraZoneReference
static var _scriptName : String = "camera_zone_reference_component"

func setup():
	pass

func changeReference():
	pass

func getLookVector():
	return -transform.basis.z.normalized()
