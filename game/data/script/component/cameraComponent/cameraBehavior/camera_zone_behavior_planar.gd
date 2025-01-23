@icon("res://editor/assets/component/cameraZoneBehaviorComponent.png")
@tool
extends cameraZoneBehavior
class_name cameraZoneBehaviorPlanar

@export var point : cameraZoneBehaviorPlanarPoint

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

func setXY():
	x = Vector3(point.global_position.x - self.global_position.x,point.global_position.y - self.global_position.y,0)
	y = Vector3(0 ,point.global_position.y - self.global_position.y,point.global_position.z - self.global_position.z)
	plan = Plan.new(x,y,self.global_position)
	
func getCameraPosition():
	return self.global_position + plan.getOrthogonalProjection(GameManager.player.global_position)
