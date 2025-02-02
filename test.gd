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
	bubbleUpperPart.scale.x = Common.getTextSize(getLineText()[-1], text.font).x + 0.2
	bubbleUpperPart.position.y = Common.getTextSize(text.text, text.font).y * getNumberOfLine()
	
func setVisible():
	bubbleUpperPart.visible = true

func setInvisible():
	bubbleUpperPart.visible = false

func get2DPos(cam : theBestCameraEver):
	return cam.unproject_position(self.global_position)

func getDistanceFromCam(cam : theBestCameraEver):
	return (self.global_position - cam.global_position).length()

func getLineText():
	var arr : PackedStringArray = text.text.split("\n", true)
	arr.sort()
	return arr

func getNumberOfLine():
	return len(Common.banUnallowedChar([""],getLineText()))
