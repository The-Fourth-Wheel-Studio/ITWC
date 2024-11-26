extends cameraZoneReference
class_name cameraZoneReferenceFollowPlayer

func changeReference():
	GameManager.currentCamera.getNewReference()
	GameManager.currentCamera.look_at(GameManager.player.position)
