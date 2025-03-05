extends Control
static var _scriptName : String = "mainMenu"

@export var saveSelector : OptionButton

func _enter_tree():
	for i in GameManager.head.getAllSaveFiles():
		saveSelector.add_item(i)

func _on_button_pressed():
	GameManager.head.loadSave(saveSelector.get_selected_id())
	hide()
	
