extends cameraZoneRotationTransition
class_name cameraZoneRotationTransitionConstant

func getAngle():
	if angle3D != Vector3.ZERO:
		angle3D = cameraZoneVar.reference.rot
	return angle3D

func doSomething():
	if abs(GameManager.currentCamera.rotation - cameraZoneVar.reference.rot) > Vector3(0.01,0.01,0.01):
		GameManager.currentCamera.rotation = Common.lerpRotation(GameManager.currentCamera.rotation, cameraZoneVar.reference.rot, 0.1)
		return false
	else:
		return true
