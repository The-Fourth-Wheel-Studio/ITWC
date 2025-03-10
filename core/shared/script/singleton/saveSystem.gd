extends Node
const _scriptName : String = "saveSystem"

static func saveSaveFile(filePath : String, toSave : Dictionary):
	var absolutePath : String = FileLoader.getGameDataPath().path_join(filePath)
	var file = FileAccess.open(absolutePath, FileAccess.WRITE)
	if FileAccess.get_open_error() != OK:
		MKUtil.print("Failed to save or create save file at: " + filePath + " return error " + str(FileAccess.get_open_error()))
	else:
		file.store_var(toSave)
		MKUtil.print("Game correcly saved at : " + filePath, _scriptName)
		file.close()

static func loadSaveFile(filePath : String) -> Variant:
	var absolutePath : String = FileLoader.getGameDataPath().path_join(filePath)
	if not FileAccess.file_exists(absolutePath):
		MKUtil.print("Save file does not exist: " + filePath)
		return null
	
	var file = FileAccess.open(absolutePath, FileAccess.READ)
	if FileAccess.get_open_error() != OK:
		MKUtil.print("Failed to load save file at: " + filePath + " return error " + str(FileAccess.get_open_error()))
		return null
	else:
		var data = file.get_var()
		file.close()
		MKUtil.print("Save file : " + filePath + " correctly loaded", _scriptName)
		return data
