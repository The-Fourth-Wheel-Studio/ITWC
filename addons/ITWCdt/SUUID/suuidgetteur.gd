@tool
extends VBoxContainer

@export var textEdit : TextEdit


func _on_button_button_down() -> void:
	textEdit.text = str(setUniqueId())


func setUniqueId():
	var tempId : Array = (FileLoader.loadFileToRead("res://addons/ITWCdt/SUUID/SUUIDList.txt").get_as_text()).split("\n")
	for i in range(len(tempId)):
		tempId[i] = int(tempId[i])
	var ok : bool = false
	while not ok:
		var rng = RandomNumberGenerator.new()
		var suuid = rng.randi()
		if suuid not in tempId:
			ok = true
		var fileIn = FileLoader.loadFileToRead("res://addons/ITWCdt/SUUID/SUUIDList.txt").get_as_text()
		var file = FileLoader.loadFileToWrite("res://addons/ITWCdt/SUUID/SUUIDList.txt")
		file.seek_end()
		file.store_string(fileIn + "\n" + str(suuid))
		return suuid
