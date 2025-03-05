extends Node3D
static var _scriptName : String = "pnjTest"

@export var speech : speechBubble
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	speech.setActive()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
