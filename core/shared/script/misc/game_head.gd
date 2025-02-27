@icon("res://editor/assets/component/martin.png")
extends Node3D
class_name gameHead

func _enter_tree():
	MKUtil.print("Loading Game Files")
	MKUtil.print("Loading Game")
	loadHead()

	#load game
	onLoad()

func onLoad():
	loadDefaultFile()
	loadMods()
	finalizeLoad()
	MKUtil.print("game file correctly loaded :  " + str(GameManager.loadedScene))

func loadHead():
	GameManager.head = self
	GameManager.gamePath = FileLoader.getAbsolutePath()
	Settings.loadConfigFile()
	GameManager.modsPath = Settings.gameConfig["mod_path"]

func loadDefaultFile():
	loadScene("core/ITWC/")
	
func finalizeLoad():
	for i in GameManager.loadedScene.keys():
		if GameManager.loadedScene[i] == {}:
			GameManager.loadedScene.erase(i)

func loadMods():
	if DirAccess.dir_exists_absolute(GameManager.modsPath):
		MKUtil.print("Loading " + str(len(FileLoader.getAllFile(GameManager.modsPath))) + " Mods")
		for i in FileLoader.getAllFile(GameManager.modsPath):
			loadScene(GameManager.modsPath.path_join(i))
	else:
		MKUtil.print("no mods to load :(")
		
func loadScene(path : String):
	var JSONdict : Dictionary = {}
	var loadDict : Dictionary = {}
	if FileAccess.file_exists(path.path_join("pack.ITWCdata")):
		loadDict = loadITWCdata(path.path_join("pack.ITWCdata"))
		for j in loadDict.keys():
			for k in loadDict[j].keys():
				JSONdict = FileLoader.JsonToDict(FileLoader.loadJsonToRead(loadDict[j][k]))
				handleMode(j, k, JSONdict)

func handleMode(categorie : String, key : String, json : Dictionary):
	if (json.has("mode") and json.has("scene")):
		if json["mode"] == "add":
			handleAddMode(categorie, key, json["scene"])
		elif json["mode"] == "replace":
			handleReplaceMode(categorie, key, json["scene"])
		elif json["mode"] == "remove":
			handleRemoveMode(categorie, key, json["scene"])
					
func handleAddMode(categorie : String, key : String, value : Array):
	modeInit(categorie)
	if not GameManager.loadedScene[categorie].has(key):
		GameManager.loadedScene[categorie][key] = value

func handleReplaceMode(categorie : String, key : String, value : Array):
	modeInit(categorie)
	GameManager.loadedScene[categorie][key] = value
		
func handleRemoveMode(categorie : String, key : String, value : Array):
	modeInit(categorie)
	if GameManager.loadedScene[categorie].has(key):
		GameManager.loadedScene[categorie].erase(key)
		
func modeInit(categorie : String):
	if not GameManager.loadedScene.has(categorie):
		GameManager.loadedScene[categorie] = {}

func loadITWCdata(path : String) -> Dictionary:
	var file : ITWCdata = ITWCdata.new()
	file = FileLoader.loadITWCdata(path)
	var tempDict : Dictionary = {}
	for i in file.get_sections():
		tempDict[i] = {}
		for j in file.get_section_keys(i):
			tempDict[i][j] = file.get_value(i,j)
	return tempDict

	'''
	#old code
	#first thing first
	GameManager.head = self
	GameManager.gamePath = OS.get_executable_path().get_base_dir()
	#load parameter
	Option.loadParameter()
	#load language
	GameManager.lang = FileLoader.JsonToDict(FileLoader.loadJsonToRead("data/asset/lang/"+Option.option["language"]))["translation"]
	#everything is loaded
	MKUtil.print("The game is loaded")
	
	MKUtil.print("assert like Martelet does")
	test()
	
func loadSave(saveId : int):
	#load eventObserver
	#EventObserver.loadEventObserverData(Option.option["save_path"].path_join(FileLoader.getAllFile(Option.option["save_path"])[saveId]))
	
	#TEMP !!!!!!!!!!!!!!!!
	EngineTool.loadScene(self, "res://editor/testFolder/game.tscn")

func getAllSaveFiles():
	var saveFiles : Array = FileLoader.getAllFile(Option.option["save_path"])
	EngineTool.MKprintArray("Save Files", saveFiles)
	return saveFiles

func test():
	print(GameManager.lang["test"])
	EventObserver.createEvent("test","")
	'''
