extends cameraRotation
class_name cameraRotationMoais

func setup():
	rot = self.rotation
	GameManager.currentCamera.rotation = self.rotation
