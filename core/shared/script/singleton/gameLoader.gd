class_name GameLoader

static func getGameFile():
	return FileLoader.loadITWCdata("core/ITWC/pack.ITWCdata")
	
static func getModFile():
	var arr : Array = []
	for i in FileLoader.getAllFile(Settings.gameConfig["mod_path"]):
		var path : String = Settings.gameConfig["mod_path"].path_join(i).path_join("pack.ITWCdata")
		if FileAccess.file_exists(path):
			arr.append(FileLoader.loadITWCdata(path))
	return arr
