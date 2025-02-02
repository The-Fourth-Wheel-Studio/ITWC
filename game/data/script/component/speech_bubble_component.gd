@tool
extends Control
class_name speechBubble

@export var textLabel : Label
@export var timer : Timer
@export var display : MarginContainer
@export var base : Control

var text : String = ""
var letterIndex : int = 0

var letterTime = 0.03

func setPosition():
	base.position = Vector2(0, -1)

func _process(delta: float) -> void:
	setPosition()
