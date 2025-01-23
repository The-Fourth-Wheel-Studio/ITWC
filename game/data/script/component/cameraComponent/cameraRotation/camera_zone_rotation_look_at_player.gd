extends cameraRotation
class_name cameraRotationLookAtPlayer

func justRotate():
	GameManager.currentCamera.look_at(GameManager.player.global_position)
