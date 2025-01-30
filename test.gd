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
	
	var textArray : PackedStringArray = getLineText()
	print(textArray[getMaxCharInList(textArray)])
	bubbleUpperPart.scale.x = Common.getTextSize(textArray[getMaxCharInList(textArray)], text.font).x + 0.2
	bubbleUpperPart.position.y = Common.getTextSize(text.text, text.font).y * getNumberOfLine()
	
func setVisible():
	bubbleUpperPart.visible = true

func setInvisible():
	bubbleUpperPart.visible = false

func getLineText():
	var arr : PackedStringArray = text.text.split("\n", true)
	arr.sort()
	return arr

func getNumberOfLine():
	return len(Common.banUnallowedChar([""],getLineText()))

func getMaxCharInList(array : Array):
	var index : int = 0
	for i in range(len(array)):
		if len(array[index]) < len(array[i]):
			index = i
	return index
