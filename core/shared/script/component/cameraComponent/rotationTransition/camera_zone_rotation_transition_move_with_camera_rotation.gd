extends cameraZoneRotationTransition
class_name cameraZoneRotationTransitionMoveWithCameraRotation

func doSomething(delta, speed : float = 1.0):
	if abs(GameManager.currentCamera.rotation - cameraZoneVar.cameraTurner.getCameraRotation()) > Vector3(speed * 0.0001,speed * 0.0001,speed * 0.0001):
		GameManager.currentCamera.rotation = cameraZoneVar.cameraTurner.getCameraRotation()
		return false
	else:
		return true
