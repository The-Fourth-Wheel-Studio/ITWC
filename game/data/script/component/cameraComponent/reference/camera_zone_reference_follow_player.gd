extends cameraZoneReference
class_name cameraZoneReferenceMoais

var rot : Vector3 = Vector3.ZERO

func setup():
	rot = self.rotation
	GameManager.currentCamera.rotation = rot
	GameManager.currentCamera.getNewReference()
	
func changeReference():
	GameManager.currentCamera.rotation = rot
