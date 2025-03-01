@icon("res://editor/assets/component/cameraZoneBehaviorComponent.png")
@tool
extends cameraZoneBehavior
class_name cameraZoneBehaviorTravelling

@export var point : pointComponent


@export var x : Vector3
@export var y : Vector3
	
var line : Vector3

func _ready() -> void:
	line = point.global_position - self.global_position
	
func _process(delta):
	if Engine.is_editor_hint():
		setXY()
	pass

func setXY():
	line = point.global_position - self.global_position

func getCameraPosition():
	return project_point_on_line(GameManager.player.global_position, self.global_position, self.line)

func project_point_on_line(point: Vector3, line_point: Vector3, line_direction: Vector3) -> Vector3:
	var w = point - line_point
	var projection = w.dot(line_direction) / line_direction.dot(line_direction) * line_direction
	return line_point + projection
