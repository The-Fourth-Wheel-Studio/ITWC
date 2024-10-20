@icon("res://editor/assets/component/cameraZoneComponent.png")
extends Area3D
class_name cameraZone

@export var collider : cameraZoneCollider
@export var behavior : cameraZoneBehavior
@export var color : Color = Color(1.0,1.0,0.3,1.0)

func behave():
	behavior.execute()
	
func _on_body_entered(body):
	behave()
