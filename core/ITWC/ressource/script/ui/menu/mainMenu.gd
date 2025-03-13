extends Control


@export var saveSelector : OptionButton

func _enter_tree():
	refresh()
	
func refresh():
	saveSelector.clear()
	for i in SaveSystem.getAllSaveFiles():
		saveSelector.add_item(i)

func _on_button_pressed():
	EventObserver.load(GameManager.savePath.path_join("save"+str(saveSelector.get_selected_id())+".dat"))
	hide()

func _on_button_pressed_2():
	FileLoader.createFolder(FileLoader.getGameDataPath().path_join(GameManager.savePath))
	SaveSystem.saveSaveFile(GameManager.savePath.path_join("save"+str(len(SaveSystem.getAllSaveFiles())))+".dat", {})
	refresh()
