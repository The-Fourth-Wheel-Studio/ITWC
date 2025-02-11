@icon("res://editor/assets/component/cameraZonereferenceComponent.png")
extends Node3D
class_name cameraZoneReference

func setup():
	pass

func changeReference():
	pass

func getLookVector():
	return -transform.basis.z.normalized()
