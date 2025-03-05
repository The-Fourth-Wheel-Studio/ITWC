@tool
extends HBoxContainer
class_name ITWCdt_textEdit
static var _scriptName : String = "text_edit"

const SELF_SCENE : PackedScene = preload("res://addons/ITWCdt/editorControl/text_edit.tscn")


@export var textEdit1 : TextEdit
@export var textEdit2 : TextEdit

@onready var loadContainer : ITWCdt_loadContainer = self.get_parent()

static var text1Data : String = "do you like what you see ? because you shouldn't"
static var text2Data : String = "do you like what you see ? because you shouldn't"


static func init(txt : String,txt2 : String):
	var scene = SELF_SCENE.instantiate()
	scene.text1Data = txt
	scene.text2Data = txt2
	return scene

func _ready():
	textEdit1.text = text1Data
	textEdit2.text = text2Data

func _on_button_button_down() -> void:
	loadContainer.parent.parent.removeFileValue(loadContainer.category,textEdit1.text)
	loadContainer.parent.refresh()
