extends Node3D
class_name cameraZoneReference

var rot : Vector3 = Vector3.ZERO

func setup():
	pass

func changeReference():
	pass

func getLookVector():
	return -transform.basis.z.normalized()
