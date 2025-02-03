@icon("res://editor/assets/component/speechBubbleComponent.png")
@tool
extends Control
class_name speechBubble

@export_category("Needed Children")
@export var textLabel : Label
@export var timer : Timer
@export var display : MarginContainer
@export var base : Control
@export var pike : MeshInstance2D

@export_category("Text Display Variables")
@export var letterTime = 0.03

signal asFinishDisplay

func _ready():
	setInactive()
	
func _process(delta: float) -> void:
	if Engine.is_editor_hint():
		setPike()
		setPosition()
	pass

func setPosition():
	base.position = Vector2(0, -display.size.y)

func displayLetterByLetter(textToDisplay : String, textFromStart : String = ""):
	var textSoFar : String = textFromStart
	textLabel.text = textSoFar
	for i in textToDisplay:
		textSoFar += i
		if asToBreak():
			textLabel.text= textSoFar
			timer.start(letterTime)
			await timer.timeout
		else:
			textLabel.text= textToDisplay
			#this is where i'm dead
			break
	asFinishDisplay.emit()

func asToBreak() -> bool:
	return false

func setPike():
	#https://docs.godotengine.org/fr/4.x/classes/class_arraymesh.html
	var vertices = PackedVector2Array()
	vertices.push_back(Vector2(getPikeOrigin().x,getPikeOrigin().y))
	vertices.push_back(Vector2(getPikeOrigin().z,getPikeOrigin().w))
	vertices.push_back(Vector2(0, 0))
	var arr_mesh = ArrayMesh.new()
	var arrays = []
	arrays.resize(Mesh.ARRAY_MAX)
	arrays[Mesh.ARRAY_VERTEX] = vertices
	arr_mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arrays)
	pike.mesh = arr_mesh

func getPikeOrigin() -> Vector4:
	var vec : Vector2 = (base.get_parent().position + Vector2(display.size.x,-display.size.y)/2)
	var vecDir = Vector2(-vec.y,vec.x).normalized() * 100
	var speechBallon : Vector2 = base.get_parent().position
	return Vector4(vec.x + vecDir.x,vec.y + vecDir.y,vec.x - vecDir.x,vec.y - vecDir.y)
	
func getPositionOnScreen(origin : Vector3, camera : theBestCameraEver) -> Vector2:
	return camera.unproject_position(origin)

func setActive():
	self.visible = true

func setInactive():
	self.visible = true
