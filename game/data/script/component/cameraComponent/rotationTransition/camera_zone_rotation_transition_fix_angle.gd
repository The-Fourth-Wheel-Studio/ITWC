extends cameraZoneRotationTransition
class_name cameraZoneRotationTransitionConstant

func doSomething(speed : float = 1.0):
	if abs(GameManager.currentCamera.rotation - cameraZoneVar.reference.rot) > Vector3(speed + 0.02,speed + 0.02,speed + 0.02):
		GameManager.currentCamera.rotation = Common.lerpRotation(GameManager.currentCamera.rotation, cameraZoneVar.reference.rot, speed * GameManager.invDelta)
		return false
	else:
		return true
