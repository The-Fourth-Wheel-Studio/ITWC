extends Node3D

@export var panel : Control
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	panel.position = GameManager.currentCamera.unproject_position(self.position)
