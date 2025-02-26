@tool
extends ScrollContainer

@export var cont : VBoxContainer

var CONFIG_FILE_PATH = FileLoader.getGameDataPath().path_join("data/game/settings/config.ini")
var ITWCdt_VBoxContainer_path : PackedScene = preload("res://addons/ITWCdt/editorControl/dataLoaderManager.tscn")
var modPath : String = "core/mods"

func _enter_tree() -> void:
	modPath = getModPath()
	var newChild = ITWCdt_VBoxContainer_path.instantiate()
	newChild.init("ITWC data","core/ITWC/pack.ITWCdata")
	cont.add_child(newChild)
	for i in FileLoader.getAllFile(modPath):
		newChild = ITWCdt_VBoxContainer_path.instantiate()
		newChild.init(i,modPath.path_join(i).path_join("/pack.ITWCdata"))
		cont.add_child(newChild)


func getModPath():
	var config : ConfigFile = ConfigFile.new()
	config.load(CONFIG_FILE_PATH)
	return config.get_value("game_config", "mod_path")
