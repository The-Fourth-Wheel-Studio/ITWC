extends Node3D

@export var bubble : Control

func _ready() -> void:
	setVisible()

func _process(delta: float) -> void:
	isActive(delta)

func isActive(delta : float):
	bubble.position = get2DPos(GameManager.currentCamera)
	bubble.size = Vector2(1000,1000) * 1/getDistanceFromCam(GameManager.currentCamera)
	print(getDistanceFromCam(GameManager.currentCamera))
	
func setVisible():
	bubble.visible = true

func setInvisible():
	bubble.visible = false

func get2DPos(cam : theBestCameraEver):
	return cam.unproject_position(self.global_position)

func getDistanceFromCam(cam : theBestCameraEver):
	return (self.global_position - cam.global_position).length()
