extends Node
class_name Config
const _scriptName : String = "config"

static var config : ConfigFile = ConfigFile.new()

static var gameConfig : Dictionary = {}

static var CONFIG_FILE_PATH = FileLoader.getGameDataPath().path_join("data/game/settings/config.ini")

static func loadConfigFile():
	if !FileAccess.file_exists(CONFIG_FILE_PATH):
		setDefaultConfig()
	loadConfig()
	MKUtil.print("game config correctly loaded", _scriptName)

static func loadConfig():
	config.load(CONFIG_FILE_PATH)
	for i in config.get_section_keys("game_config"):
		gameConfig[i] = config.get_value("game_config", i)
	
static func setDefaultConfig():
	config.set_value("game_config", "save_path", "data/game/saves")
	config.set_value("game_config", "mod_path", "core/mods")
	FileLoader.saveConfigFile(config, CONFIG_FILE_PATH)
	MKUtil.print("default config file created at: " + CONFIG_FILE_PATH, _scriptName)
