@tool
extends Node3D

@export var bubbleUpperPart : Sprite3D
@export var text : Label3D

const PIXELSIZE = 0.005

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	isActive(delta)

func isActive(delta : float):
	setBubblePos()

func setBubblePos():
	bubbleUpperPart.scale.x = getTextSize().x
	bubbleUpperPart.position.y = getTextSize().y
	
func setVisible():
	bubbleUpperPart.visible = true

func setInvisible():
	bubbleUpperPart.visible = false

func get2DPos(cam : theBestCameraEver):
	return cam.unproject_position(self.global_position)

func getDistanceFromCam(cam : theBestCameraEver):
	return (self.global_position - cam.global_position).length()

func getTextSize():
	return text.font.get_string_size(text.text) * PIXELSIZE
