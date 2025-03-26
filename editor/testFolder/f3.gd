extends VBoxContainer

@export var fpsLabel : Label
@export var isOnFloorLabel : Label
@export var coyoteLabel : Label
@export var coyoteTimeLabel : Label
@export var gravityLabel : Label

func _process(_delta: float) -> void:
	fpsLabel.set_text("FPS " + str(Engine.get_frames_per_second()))
	coyoteLabel.set_text(str(GameManager.player.isOnFloor.isCoyoteTime()))
	coyoteTimeLabel.set_text(str(GameManager.player.isOnFloor.coyoteTimer.time_left))
	gravityLabel.set_text(str(GameManager.player.gravityAccelerator))
