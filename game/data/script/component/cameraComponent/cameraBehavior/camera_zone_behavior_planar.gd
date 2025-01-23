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
	plan = Plan.new(x,y,self.global_position)

func behave():
	setCameraPosition(getCameraPosition())

func _process(delta):
	#wtf is this line titruc ????
	#ok i've figure it out, this is to set the planar vector, but in process so in the editor i can change it TODO : repear your shit
	setXY()
	print(plan.x)

func setXY():
	x = point1.global_position - self.global_position
	y = point2.global_position - self.global_position
	plan = Plan.new(x,y,self.global_position)
	
func getCameraPosition():
	return self.global_position + plan.getOrthogonalProjection(GameManager.player.global_position)
