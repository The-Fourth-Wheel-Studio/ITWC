extends Node

var config : ConfigFile = ConfigFile.new()
var setting : ConfigFile = ConfigFile.new()

@export var gameConfig : Dictionary = {}

const SETTINGS_FILE_PATH = "res://data/game/settings/config.ini"

func load():
	if !FileAccess.file_exists(SETTINGS_FILE_PATH):
		setDefaultConfig()
	loadConfig()
	MKUtil.print("game config correctly loaded")
	
func loadConfig():
	config.load(SETTINGS_FILE_PATH)
	for i in config.get_section_keys("game_config"):
		gameConfig[i] = config.get_value("game_config", i)

func setDefaultConfig():
	MKUtil.print("default config file created")
	config.set_value("game_config", "save_path", "data/game/saves")
	config.set_value("game_config", "language", "fr_fr.json")
	
	config.save(SETTINGS_FILE_PATH)
