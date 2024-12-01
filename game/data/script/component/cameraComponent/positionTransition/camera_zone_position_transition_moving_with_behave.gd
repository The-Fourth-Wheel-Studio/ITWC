extends cameraZonePositionTransition
class_name cameraZonePositionTansitionMovingWithBehave

@export var behavior : cameraZoneBehavior

func setup():
	behavior = cameraZoneVar.behavior
	
func doSomething(speed : float = 1.0):
	position3D = behavior.cameraPosition
	if(position3D.distance_to(GameManager.currentCamera.position) > 0.5):
		GameManager.currentCamera.moveFromVect3((position3D - GameManager.currentCamera.position).normalized() * speed)
		return false
	else:
		return true
