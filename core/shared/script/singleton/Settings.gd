extends Node

var config : ConfigFile = ConfigFile.new()
var setting : ConfigFile = ConfigFile.new()

@export var gameConfig : Dictionary = {}
@export var lang : String = ""

var CONFIG_FILE_PATH = FileLoader.getGameDataPath().path_join("data/game/settings/config.ini")
var SETTINGS_FILE_PATH = FileLoader.getGameDataPath().path_join("data/game/settings/setting.ini")

func load():
	loadConfigFile()
	loadSettingFile()
	
func loadConfigFile():
	if !FileAccess.file_exists(CONFIG_FILE_PATH):
		setDefaultConfig()
	loadConfig()
	MKUtil.print("game config correctly loaded")

func loadSettingFile():
	if !FileAccess.file_exists(SETTINGS_FILE_PATH):
		setDefaultSetting()
	loadSetting()
	MKUtil.print("game setting correctly loaded")

func loadConfig():
	config.load(CONFIG_FILE_PATH)
	for i in config.get_section_keys("game_config"):
		gameConfig[i] = config.get_value("game_config", i)

func loadSetting():
	setting.load(SETTINGS_FILE_PATH)
	self.lang = setting.get_value("general", "language")

func setDefaultConfig():
	config.set_value("game_config", "save_path", "data/game/saves")
	FileLoader.saveConfigFile(config, CONFIG_FILE_PATH)
	MKUtil.print("default config file created at: " + CONFIG_FILE_PATH)

func setDefaultSetting():
	setting.set_value("general", "language", "fr_fr.json")
	FileLoader.saveConfigFile(setting, SETTINGS_FILE_PATH)
	MKUtil.print("default setting file created at: " + SETTINGS_FILE_PATH)
