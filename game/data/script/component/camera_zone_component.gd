@icon("res://editor/assets/component/cameraZoneComponent.png")
extends Area3D
class_name cameraZone

@export var collider : cameraZoneCollider
@export var behavior : cameraZoneBehavior

func behave():
	behavior.execute()
	
func _on_body_entered(body):
	behave()
