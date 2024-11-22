@icon("res://editor/assets/component/repulseHandler.png")
extends Node3D
class_name repulseHandler

@export_category("repulse Handler Attributes")
@export_range(0, 1) var force : float = 1.0

@export_category("don't touch unless you'r titruc")
@export var collider : repulseHandlerZone
@onready var area : Area3D = self.get_child(0)
	
func getOtherBody():
	var list : Array[repulseHandler]
	for i in area.get_overlapping_areas():
		if i.get_parent() is repulseHandler:
			list.append(i.get_parent())
	return list
	
func getRadius():
	return collider.shape.radius


func repulse(body,thisBody):
	var vector : Vector3 = (body.global_position - thisBody.global_position) * -1
	var vectorToVector2 : Vector2 = Vector2(vector.x, vector.z)
	var repulseForce : float = (self.getRadius() - vectorToVector2.length()) + 2
	return vectorToVector2.normalized() * repulseForce * force
