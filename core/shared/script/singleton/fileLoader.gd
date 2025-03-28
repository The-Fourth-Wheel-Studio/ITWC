class_name FileLoader
const _scriptName : String = "fileLoader"

static func getAllFile(folderPath : String):
	var fileGet : Array
	if DirAccess.dir_exists_absolute(folderPath):
		fileGet = DirAccess.get_files_at(folderPath)
	return fileGet
		
static func loadFileToRead(filePath : String):
	return FileLoader.openFile(filePath, FileAccess.READ)

static func loadFileToWrite(filePath):
	return FileLoader.openFile(filePath, FileAccess.WRITE)

static func openFile(filePath : String, flag : FileAccess.ModeFlags):
	var absolutePath : String = GameManager.gamePath.path_join(filePath)
	if FileAccess.file_exists(absolutePath):
		MKUtil.print("'" + absolutePath + "' correctly loaded", _scriptName)
		return FileAccess.open(absolutePath, flag)
	elif FileAccess.file_exists("res://".path_join(filePath)):
		absolutePath = "res://".path_join(filePath)
		MKUtil.print("'" + absolutePath + "' correctly loaded", _scriptName)
		return FileAccess.open(absolutePath, flag)
	else:
		MKUtil.print("Error : the file '" + str(filePath, _scriptName) + "' doesn't exist")
		return null

static func loadJsonToRead(filePath : String):
	var json : JSON = JSON.new()
	var loadedFileAsText = loadFileToRead(filePath)
	if loadedFileAsText != null:
		json.parse(loadedFileAsText.get_as_text())
	else:
		MKUtil.print("Error : cannot load the json file : '" + str(filePath, _scriptName) + "'")
		return null
	loadedFileAsText.close()
	return json

static func JsonToDict(json : JSON):
	if json != null:
		return json.data
	else:
		MKUtil.print("ERROR : unable to convert JSON", _scriptName)
	return null

static func getAbsolutePath():
	return OS.get_executable_path().get_base_dir()
	
static func getGameDataPath():
	return "user://"

static func createFolder(path : String):
	if !DirAccess.dir_exists_absolute(path):
		var err = DirAccess.make_dir_recursive_absolute(path)
		if err != OK:
			MKUtil.print("Unable to create folder: " + path + " Error: " + str(err), _scriptName)
	else:
		MKUtil.print("the folder already exist at path : " + path, _scriptName)
static func saveConfigFile(config_file: ConfigFile, file_path: String):
	var folder_path = file_path.get_base_dir()
	createFolder(folder_path)
	var err = config_file.save(file_path)
	if err != OK:
		MKUtil.print("Unable to create config file: " + file_path + " Error: " + str(err), _scriptName)

static func loadITWCdata(filePath : String):
	var ITWCData : ITWCdata = ITWCdata.new()
	var absolutePath : String = GameManager.gamePath.path_join(filePath)
	if FileAccess.file_exists(absolutePath):
		MKUtil.print("ITWCdata at path : '" + absolutePath + "' correctly loaded", _scriptName)
		ITWCData.load(absolutePath)
		return ITWCData
	elif FileAccess.file_exists("res://".path_join(filePath)):
		absolutePath = "res://".path_join(filePath)
		MKUtil.print("ITWCdata at path :  '" + absolutePath + "' correctly loaded", _scriptName)
		ITWCData.load(absolutePath)
		return ITWCData
	else:
		MKUtil.print("Error : the ITWCdata file at '" + str(filePath, _scriptName) + "' doesn't exist")
		return null

static func loadPCKFromPath(filePath : String):
	var absolutePath : String = GameManager.gamePath.path_join(filePath)
	if FileAccess.file_exists(absolutePath):
		MKUtil.print("PCK at path : '" + absolutePath + "' correctly loaded", _scriptName)
		ProjectSettings.load_resource_pack(absolutePath)
	elif FileAccess.file_exists("res://".path_join(filePath)):
		absolutePath = "res://".path_join(filePath)
		MKUtil.print("PCK at path :  '" + absolutePath + "' correctly loaded", _scriptName)
		ProjectSettings.load_resource_pack(absolutePath)
	else:
		MKUtil.print("Error : the PCK file at '" + str(filePath, _scriptName) + "' doesn't exist")
		return null
