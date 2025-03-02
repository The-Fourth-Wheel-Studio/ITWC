extends cameraZonePositionTransition
class_name cameraZonePositionTansitionMovingWithBehave

@export var behavior : cameraZoneBehavior

func setup():
	behavior = cameraZoneVar.behavior
	
func doSomething(speed : float = 1.0):
	position3D = behavior.getCameraPosition()
	print("aaa" , behavior.getCameraPosition())
	if(position3D.distance_to(GameManager.currentCamera.position) > (speed - speed/2)):
		GameManager.currentCamera.moveFromVect3((position3D - GameManager.currentCamera.position).normalized() * speed * GameManager.invDelta)
		return false
	else:
		return true
