@tool
extends ScrollContainer

@export var cont : VBoxContainer

var CONFIG_FILE_PATH = FileLoader.getGameDataPath().path_join("data/game/settings/config.ini")
var modPath : String = "core/mods"

func _enter_tree() -> void:
	modPath = getModPath()
	cont.add_child(ITWCdt_VBoxContainer.init("ITWC data","core/ITWC/pack.ITWCdata"))
	for i in FileLoader.getAllFile(modPath):
		cont.add_child(ITWCdt_VBoxContainer.init(i,modPath.path_join(i).path_join("/pack.ITWCdata")))

func getModPath():
	var config : ConfigFile = ConfigFile.new()
	config.load(CONFIG_FILE_PATH)
	return config.get_value("game_config", "mod_path")
