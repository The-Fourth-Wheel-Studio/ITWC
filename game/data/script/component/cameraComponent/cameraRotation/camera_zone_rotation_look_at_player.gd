extends cameraRotation
class_name cameraRotationLookAtPlayer

func getCameraRotation():
	return Common.get_rotation_towards(GameManager.currentCamera.global_position, GameManager.player.global_position)
