extends Node3D

@export var bubble : Control

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	bubble.position = get2DPos(GameManager.currentCamera)

func get2DPos(cam : theBestCameraEver):
	return cam.unproject_position(self.position)
