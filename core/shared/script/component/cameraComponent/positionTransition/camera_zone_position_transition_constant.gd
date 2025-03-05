extends cameraZonePositionTransition
class_name cameraZonePositionTansitionConstant
static var _scriptName : String = "camera_zone_position_transition_constant"

@export var posPoint : cameraZoneBehaviorStartPos

func setup():
	position3D = posPoint.global_position
	
func doSomething(delta, speed : float = 1.0):
	if(position3D.distance_to(GameManager.currentCamera.position) > 0.005):
		GameManager.currentCamera.moveToPos(position3D, speed * delta)
		return false
	else:
		return true
