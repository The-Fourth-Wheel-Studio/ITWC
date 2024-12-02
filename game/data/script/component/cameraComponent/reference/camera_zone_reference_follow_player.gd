@icon("res://editor/assets/component/cameraZonereferenceComponent.png")
extends cameraZoneReference
class_name cameraZoneReferenceMoais

func setup():
	rot = self.rotation
	GameManager.currentCamera.rotation = rot
	GameManager.currentCamera.getNewReference()
	
func changeReference():
	GameManager.currentCamera.rotation = rot
