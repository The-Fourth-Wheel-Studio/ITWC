extends cameraZoneRotationTransition
class_name cameraZoneRotationTransitionConstant

func doSomething():
	if abs(GameManager.currentCamera.rotation - cameraZoneVar.reference.rot) > Vector3(0.01,0.01,0.01):
		GameManager.currentCamera.rotation = Common.lerpRotation(GameManager.currentCamera.rotation, cameraZoneVar.reference.rot, 0.1)
		return false
	else:
		return true
