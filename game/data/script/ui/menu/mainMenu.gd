extends Control

@export var saveSelector : OptionButton

func _enter_tree():
	MKUtil.print(FileLoader.getAllFile("res://data/saves/"))
	for i in FileLoader.getAllFile("res://data/saves/"):
		saveSelector.add_item(i)

func _on_button_pressed():
	GameManager.head.loadSave(saveSelector.get_selected_id())
	hide()
	
