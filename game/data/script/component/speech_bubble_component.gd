@tool
extends Control
class_name speechBubble

@export var textLabel : Label
@export var timer : Timer
@export var display : MarginContainer
@export var base : Control
@export var pike : MeshInstance2D

var text : String = ""
var letterIndex : int = 0

var letterTime = 0.03

func setPosition():
	base.position = Vector2(0, -display.size.y)

func _process(delta: float) -> void:
	setPike()
	setPosition()

func setPike():
	var vertices = PackedVector2Array()
	vertices.push_back(Vector2(base.get_parent().position.x + (display.size.x/4), base.get_parent().position.y))
	vertices.push_back(Vector2(base.get_parent().position.x, base.get_parent().position.y+ (-display.size.y/4)))
	vertices.push_back(Vector2(0, 0))

	# Initialize the ArrayMesh.
	var arr_mesh = ArrayMesh.new()
	var arrays = []
	arrays.resize(Mesh.ARRAY_MAX)
	arrays[Mesh.ARRAY_VERTEX] = vertices

	# Create the Mesh.
	arr_mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arrays)
	pike.mesh = arr_mesh
