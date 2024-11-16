@icon("res://editor/assets/component/cameraZoneBehaviorComponent.png")
@tool
extends cameraZoneBehavior
class_name cameraZoneBehaviorPlanar

@export var x : Vector3
@export var y : Vector3
	
var plan : Plan

func _ready() -> void:
	plan = Plan.new(x,y,self.transform + self.get_parent().transform)
	
func behave():
	
	GameManager.currentCamera.getNewReference()
	GameManager.currentCamera.look_at(GameManager.player.position)
