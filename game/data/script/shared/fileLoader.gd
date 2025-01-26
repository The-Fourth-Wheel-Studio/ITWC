class_name FileLoader

static func loadFileToRead(filePath : String):
	return FileLoader.openFile(filePath, FileAccess.READ)

static func loadFileToWrite(filePath):
	return FileLoader.openFile(filePath, FileAccess.WRITE)

static func openFile(filePath : String, flag : FileAccess.ModeFlags):
	if FileAccess.file_exists(filePath):
		return FileAccess.open(filePath,flag)
	else:
		MKUtil.print("Error : the file '" + str(filePath) + "' doesn't exist")
		return null
