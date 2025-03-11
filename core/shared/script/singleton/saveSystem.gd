extends Node
const _scriptName : String = "saveSystem"

@export var instanceIDToSUUID : Dictionary = {}
@export var SaveData : Dictionary = {}

func save(savePath : String):
	var dataToStore : Dictionary = {}
	for i in SaveData.keys():
		for j in SaveData[i]:
			dataToStore[i] = instance_from_id(instanceIDToSUUID[i]).get(j)
	saveSaveFile(savePath, dataToStore)

func addThingsToSave(instanceId : int, varNameToSave : String, scriptUUID : int):
	if not instanceIDToSUUID.has(scriptUUID):
		instanceIDToSUUID[scriptUUID] = instanceId
	if not SaveData.has(scriptUUID):
		SaveData[scriptUUID] = [varNameToSave]
	else:
		SaveData[scriptUUID].append(varNameToSave)

static func saveSaveFile(filePath : String, toSave : Dictionary):
	var absolutePath : String = FileLoader.getGameDataPath().path_join(filePath)
	var file = FileAccess.open(absolutePath, FileAccess.WRITE)
	if FileAccess.get_open_error() != OK:
		MKUtil.print("Failed to save or create save file at: " + absolutePath + " return error " + str(FileAccess.get_open_error()))
	else:
		file.store_var(toSave)
		MKUtil.print("Game correcly saved at : " + absolutePath, _scriptName)
		file.close()

static func loadSaveFile(filePath : String) -> Variant:
	var absolutePath : String = FileLoader.getGameDataPath().path_join(filePath)
	if not FileAccess.file_exists(absolutePath):
		MKUtil.print("Save file does not exist: " + absolutePath)
		return null
	
	var file = FileAccess.open(absolutePath, FileAccess.READ)
	if FileAccess.get_open_error() != OK:
		MKUtil.print("Failed to load save file at: " + absolutePath + " return error " + str(FileAccess.get_open_error()))
		return null
	else:
		var data = file.get_var()
		file.close()
		MKUtil.print("Save file : " + filePath + " correctly loaded", _scriptName)
		return data
		
func getDataFromSUUID(savePath : String, SUUID : int):
	var loadedData : Dictionary = loadSaveFile(savePath)
	if loadedData.has(SUUID):
		return loadedData[SUUID]
	return null

func getAllSaveFiles():
	var saveFiles : Array = FileLoader.getAllFile(FileLoader.getGameDataPath().path_join(GameManager.savePath))
	EngineTool.MKprintArray("Save Files", saveFiles, _scriptName)
	return saveFiles
