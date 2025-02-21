@tool
extends VBoxContainer

const mod_path = "core/mods"
const GAME_PATH = "core/ITWC"

func _on_game_load_button_pressed():
	print(FileLoader.getAllFile(mod_path))
