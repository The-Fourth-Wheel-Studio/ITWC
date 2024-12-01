extends Node3D
class_name cameraZoneRotationTransition

var cameraZoneVar : cameraZone
var angle3D : Vector3 = Vector3.ZERO

func _ready():
	cameraZoneVar = self.get_parent().get_parent()
	setup()
	
func setup():
	pass
	
func doSomething(speed : float = 1.0):
	return true
