extends cameraZonePositionTransition
class_name cameraZonePositionTansitionMovingWithBehave

@export var behavior : cameraZoneBehavior

func setup():
	behavior = cameraZoneVar.behavior
	
func doSomething(delta, speed : float = 1.0):
	position3D = behavior.getCameraPosition()
	if(position3D.distance_to(GameManager.currentCamera.position) > 0.0005):
		GameManager.currentCamera.moveToPos(position3D, speed * delta)
		return false
	else:
		return true
