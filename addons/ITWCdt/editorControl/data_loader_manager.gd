@tool
extends VBoxContainer
class_name ITWCdt_VBoxContainer

const SELF_SCENE : PackedScene = preload("res://addons/ITWCdt/editorControl/dataLoaderManager.tscn")

const mod_path = "core/mods"
const GAME_PATH = "core/ITWC"

static var labelName : String = "you shoudn't be able to see this"

@export var nameLabel : Label

static func init(txt : String):
	var scene : ITWCdt_VBoxContainer = SELF_SCENE.instantiate()
	scene.labelName = txt
	return scene

func _ready():
	nameLabel.text = labelName

func _on_game_load_button_pressed():
	print(FileLoader.getAllFile(mod_path))
