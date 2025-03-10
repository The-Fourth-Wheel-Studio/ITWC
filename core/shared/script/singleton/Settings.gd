extends Node
const _scriptName : String = "settings"

var setting : ConfigFile = ConfigFile.new()
var lang : String = ""

var SETTINGS_FILE_PATH = FileLoader.getGameDataPath().path_join("data/game/settings/setting.ini")

func _enter_tree() -> void:
	print(self.get_instance_id())

func loadSettingFile():
	if !FileAccess.file_exists(SETTINGS_FILE_PATH):
		setDefaultSetting()
	loadSetting()
	MKUtil.print("game setting correctly loaded", _scriptName)

func loadSetting():
	setting.load(SETTINGS_FILE_PATH)
	lang = setting.get_value("general", "language")

func setDefaultSetting():
	setting.set_value("general", "language", "fr_fr.json")
	FileLoader.saveConfigFile(setting, SETTINGS_FILE_PATH)
	MKUtil.print("default setting file created at: " + SETTINGS_FILE_PATH, _scriptName)
