extends cameraZoneRotationTransition
class_name cameraZoneRotationTransitionLookAtPlayer

func doSomething(speed : float = 1.0):
	if not GameManager.currentCamera.currentCameraZone.transition.asTransitionnedOnPosition:
		GameManager.currentCamera.look_at(GameManager.player.global_position)
		return false
	else:
		return true
