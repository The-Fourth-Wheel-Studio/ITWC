class_name FileLoader

static func loadFileToRead(filePath : String):
	return FileLoader.openFile(filePath, FileAccess.READ)

static func loadFileToWrite(filePath):
	return FileLoader.openFile(filePath, FileAccess.WRITE)

static func openFile(filePath : String, flag : FileAccess.ModeFlags):
	if FileAccess.file_exists(filePath):
		MKUtil.print("'"+filePath+"' correctly loaded")
		return FileAccess.open(filePath,flag)
	else:
		MKUtil.print("Error : the file '" + str(filePath) + "' doesn't exist")
		return null

static func loadJsonToRead(filePath : String):
	var json : JSON = JSON.new()
	json.parse(loadFileToRead(filePath).get_as_text())
	return json
