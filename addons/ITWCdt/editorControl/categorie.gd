@tool
extends VBoxContainer
class_name ITWCdt_categorie
const _scriptName : String = "categorie"

const SELF_SCENE : PackedScene = preload("res://addons/ITWCdt/editorControl/categorie.tscn")
const TEXT_SCENE : PackedScene = preload("res://addons/ITWCdt/editorControl/text_edit.tscn")

@export var labelName : Label
@export var key : TextEdit
@export var value : TextEdit
@export var loadContainer : VBoxContainer

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
	loadContainer.category = categoryName
	refresh()

func _on_game_load_button_pressed():
	var txt0 : String = key.text
	var txt1 : String = value.text
	if(txt0 != "" and txt1 != ""):
		parent.setFileValue(categoryName,txt0,txt1)
	else:
		MKUtil.print("enable to set value", _scriptName)
	refresh()

func _on_remove_button_down() -> void:
	parent.removeCategory(categoryName)

func refresh():
	EngineTool.removeAllChildren(loadContainer)
	for i in parent.file.get_section_keys(categoryName):
		print(i)
		var text = TEXT_SCENE.instantiate()
		loadContainer.add_child(text.init(i, parent.file.get_value(categoryName,i)))
		
