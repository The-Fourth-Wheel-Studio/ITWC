extends cameraZoneReference
class_name cameraZoneReferenceFollowPlayer

func changeReference():
	GameManager.currentCamera.getNewReference()
