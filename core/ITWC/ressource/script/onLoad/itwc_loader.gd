extends Node
static var _scriptName : String = "itwc_loader"

func _enter_tree() -> void:
	Setting.loadSettingFile()
