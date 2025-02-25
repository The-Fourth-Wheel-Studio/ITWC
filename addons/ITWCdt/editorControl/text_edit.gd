@tool
extends PanelContainer
class_name ITWCdt_textEdit

const SELF_SCENE : PackedScene = preload("res://addons/ITWCdt/editorControl/text_edit.tscn")


@export var textEdit : TextEdit
static var textData : String = "do you like what you see ? because you shouldn't"

static func init(txt : String):
	var scene = SELF_SCENE.instantiate()
	scene.textData = txt
	return scene

func _ready():
	textEdit.text = textData
