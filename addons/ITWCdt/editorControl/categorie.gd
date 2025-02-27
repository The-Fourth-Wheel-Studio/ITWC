@tool
extends VBoxContainer
class_name ITWCdt_categorie

const SELF_SCENE : PackedScene = preload("res://addons/ITWCdt/editorControl/categorie.tscn")

@export var labelName : Label

static var text1Data : String = "do you like what you see ? because you shouldn't"


static func init(txt : String,txt2 : String):
	var scene = SELF_SCENE.instantiate()
	scene.text1Data = txt
	return scene

func _ready():
	labelName.text = text1Data
