@icon("res://editor/assets/component/cameraZoneBehaviorComponent.png")
extends cameraZoneBehavior
class_name cameraZoneBehaviorPlanar
	
func behave():
	
	GameManager.currentCamera.getNewReference()
	GameManager.currentCamera.look_at(GameManager.player.position)
