@tool
extends VBoxContainer
class_name ITWCdt_categorie

const SELF_SCENE : PackedScene = preload("res://addons/ITWCdt/editorControl/categorie.tscn")

@export var labelName : Label

@onready var parent = self.get_parent().root

static var text1Data : String = "do you like what you see ? because you shouldn't"
static var categoryName : String

static func init(txt : String,txt2 : String):
	var scene = SELF_SCENE.instantiate()
	scene.text1Data = txt
	scene.categoryName = txt2
	return scene

func _ready():
	labelName.text = text1Data

func _on_game_load_button_pressed():
	var txt0 : String = onLoadKey.text
	var txt1 : String = onLoadValue.text
	if(txt0 != "" and txt1 != ""):
		setFileValue("OnLoad",txt0,txt1)
	else:
		MKUtil.print("enable to set value")

func _on_remove_button_down() -> void:
	parent.removeCategory(categoryName)
