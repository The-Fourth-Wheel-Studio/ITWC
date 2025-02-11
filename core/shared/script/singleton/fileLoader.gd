class_name FileLoader

static func getAllFile(folderPath : String):
	var absolutePath : String = GameManager.gamePath.path_join(folderPath)
	var fileGet : Array
	fileGet = DirAccess.get_files_at(absolutePath)
	if fileGet == []:
		absolutePath = "res://".path_join(folderPath)
		fileGet = DirAccess.get_files_at(absolutePath)
	return fileGet
		
static func addFileDirectory(path : String, fileName : String):
	if path[-1] == "/":
		return path.path_join(fileName)
	return path + "/" + fileName
	
static func loadFileToRead(filePath : String):
	return FileLoader.openFile(filePath, FileAccess.READ)

static func loadFileToWrite(filePath):
	return FileLoader.openFile(filePath, FileAccess.WRITE)

static func openFile(filePath : String, flag : FileAccess.ModeFlags):
	var absolutePath : String = GameManager.gamePath.path_join(filePath)
	MKUtil.print("path to load : "+absolutePath)
	if FileAccess.file_exists(absolutePath):
		MKUtil.print("'"+absolutePath+"' correctly loaded")
		return FileAccess.open(absolutePath,flag)
	elif FileAccess.file_exists("res://".path_join(filePath)):
		absolutePath = "res://".path_join(filePath)
		MKUtil.print("'"+absolutePath+"' correctly loaded")
		return FileAccess.open(absolutePath,flag)
	else:
		MKUtil.print("Error : the file '" + str(filePath) + "' doesn't exist")
		return null

static func loadJsonToRead(filePath : String):
	var json : JSON = JSON.new()
	var loadedFileAsText = loadFileToRead(filePath)
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
