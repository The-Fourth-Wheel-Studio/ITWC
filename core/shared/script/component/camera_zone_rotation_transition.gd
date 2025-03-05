@icon("res://editor/assets/component/cameraZoneRotationTransitionComponent.png")
extends Node3D
class_name cameraZoneRotationTransition
static var _scriptName : String = "camera_zone_rotation_transition"

var cameraZoneVar : cameraZone
var angle3D : Vector3 = Vector3.ZERO

func _ready():
	cameraZoneVar = self.get_parent().get_parent()
	setup()
	
func setup():
	pass
	
func doSomething(_delta, _speed : float = 1.0):
	return true
