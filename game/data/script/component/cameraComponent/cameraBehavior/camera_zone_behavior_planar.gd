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

func behave():
	setCameraPosition(getCameraPosition())

func _process(delta):
	setXY()

func setXY():
	x = point1.global_position - self.global_position
	y = point2.global_position - self.global_position
	plan = Plan.new(x, y, self.global_position)
	print(plan.getProjection(Vector3(0, 1, 2), GameManager.currentCamera.currentCameraZone.reference.getLookVector()))
	
func getCameraPosition():
	return plan.getProjection(GameManager.player.global_position, GameManager.currentCamera.currentCameraZone.reference.getLookVector())
