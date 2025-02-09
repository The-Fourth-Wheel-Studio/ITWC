class_name FileLoader

static func getAllFile(folderPath : String):
	return DirAccess.get_files_at(folderPath)
	
static func loadFileToRead(filePath : String):
	return FileLoader.openFile(filePath, FileAccess.READ)

static func loadFileToWrite(filePath):
	return FileLoader.openFile(filePath, FileAccess.WRITE)

static func openFile(filePath : String, flag : FileAccess.ModeFlags):
	var absolutePath : String = GameManager.gamePath.path_join(filePath)
	if FileAccess.file_exists(absolutePath):
		MKUtil.print("'"+filePath+"' correctly loaded")
		return FileAccess.open(absolutePath,flag)
	elif FileAccess.file_exists("res://".path_join(filePath)):
		absolutePath = "res://".path_join(filePath)
		MKUtil.print("'"+filePath+"' correctly loaded")
		return FileAccess.open(absolutePath,flag)
	else:
		MKUtil.print("Error : the file '" + str(filePath) + "' doesn't exist")
		return null

static func loadJsonToRead(filePath : String):
	var json : JSON = JSON.new()
	var loadedFileAsText = loadFileToRead(filePath)
	print("loadedFileAsText : ",loadedFileAsText)
	if loadedFileAsText != null:
		json.parse(loadedFileAsText.get_as_text())
	else:
		MKUtil.print("Error : cannot load the json file :'" + str(filePath) + "'")
		return null
	return json

static func JsonToDict(json : JSON):
	if json != null:
		return json.data
	else:
		MKUtil.print("ERROR : enable to convert JSON")
	return null
