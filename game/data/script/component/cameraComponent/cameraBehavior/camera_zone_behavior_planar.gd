@icon("res://editor/assets/component/cameraZoneBehaviorComponent.png")
@tool
extends cameraZoneBehavior
class_name cameraZoneBehaviorPlanar

@export var point : cameraZoneBehaviorPlanarPoint

@export var x : Vector3
@export var y : Vector3
	
var plan : Plan

func _ready() -> void:
	plan = Plan.new(x,y,self.position + self.get_parent().position)
	
func behave():
	GameManager.currentCamera.position = plan.getOrthogonalProjection(GameManager.player.position)
	GameManager.currentCamera.getNewReference()
	GameManager.currentCamera.look_at(GameManager.player.position)

func _process(delta):
	setXY()

func setXY():
	x = Vector3(point.global_position.x - self.global_position.x,point.global_position.y - self.global_position.y,0)
	y = Vector3(0 ,point.global_position.y - self.global_position.y,point.global_position.z - self.global_position.z)
