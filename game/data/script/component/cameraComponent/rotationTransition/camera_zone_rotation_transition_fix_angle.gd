extends cameraZoneRotationTransition
class_name cameraZoneRotationTransitionConstant

func getAngle():
	if angle3D != Vector3.ZERO:
		angle3D = cameraZoneVar.reference.rot
	return angle3D

func doSomething():
	GameManager.currentCamera.rotation = Common.lerpRotation(GameManager.currentCamera.rotation, cameraZoneVar.reference.rot, 0.1)
	
