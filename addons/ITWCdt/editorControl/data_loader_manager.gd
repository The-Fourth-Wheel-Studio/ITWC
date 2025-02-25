@tool
extends VBoxContainer
class_name ITWCdt_VBoxContainer

const SELF_SCENE : PackedScene = preload("res://addons/ITWCdt/editorControl/dataLoaderManager.tscn")
const TEXT_SCENE : PackedScene = preload("res://addons/ITWCdt/editorControl/text_edit.tscn")


const mod_path = "core/mods"
const GAME_PATH = "core/ITWC"

#init var
static var labelName : String = "you shoudn't be able to see this"
static var filePath : String = "core/ITWC"

@export var nameLabel : Label
@export var loadContainer : VBoxContainer


static func init(txt : String, path : String):
	var scene : ITWCdt_VBoxContainer = SELF_SCENE.instantiate()
	scene.labelName = txt
	scene.filePath = path
	return scene

func _ready():
	nameLabel.text = labelName
	loadContainer.add_child(TEXT_SCENE.instantiate())

func _on_game_load_button_pressed():
	print(FileLoader.getAllFile(mod_path))

func refresh():
	pass
