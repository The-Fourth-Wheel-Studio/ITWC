@icon("res://editor/assets/component/cameraZoneBehaviorComponent.png")
@tool
extends cameraZoneBehavior
class_name cameraZoneBehaviorPlanar

@export var point1 : cameraZoneBehaviorPlanarPoint
@export var point2 : cameraZoneBehaviorPlanarPoint

@export var x : Vector3
@export var y : Vector3
	
var plan : Plan

func _ready() -> void:
	plan = Plan.new(x, y, self.global_position)

func _process(_delta):
	if Engine.is_editor_hint():
		setXY()
	pass

func setXY():
	x = point1.global_position - self.global_position
	y = point2.global_position - self.global_position
	plan = Plan.new(x, y, self.global_position)

func getCameraPosition():
	return plan.getProjection(GameManager.player.global_position, GameManager.currentCamera.currentCameraZone.reference.getLookVector())
