@icon("res://editor/assets/component/martin.png")
extends Node3D
class_name gameHead

func _enter_tree():
	print("-----------------------------------------------------------------------")
	MKUtil.print("Load Game Head")
	loadHead()
	MKUtil.print("Loading Game")
	#load game
	onLoad()
	MKUtil.print("game fully loaded")
	print("-----------------------------------------------------------------------")

func loadHead():
	GameManager.head = self
	GameManager.gamePath = FileLoader.getAbsolutePath()
	Settings.loadConfigFile()
	GameManager.modsPath = Settings.gameConfig["mod_path"]











#hello




















#OK DON'T LOOK THIS IS VERY BIZARRE
#all loading ITWC/mods handle here
func onLoad():
	'''
	function called to load every file
	'''
	loadDefaultFile()
	loadMods()
	finalizeLoad()
	MKUtil.print("game file correctly loaded :  " + str(GameManager.loadedScene))

func finalizeLoad():
	'''
	function to remove useless key in the final dictionnary
	'''
	for i in GameManager.loadedScene.keys():
		if GameManager.loadedScene[i] == {}:
			GameManager.loadedScene.erase(i)

func loadDefaultFile():
	'''
	load default ITWCdata in core/ITWC/pack.ITWCdata basicly all the default game file
	'''
	loadScene("core/ITWC/")

func loadMods():
	'''
	this is where it get interesting, this is where mod loading is handle
	'''
	if DirAccess.dir_exists_absolute(GameManager.modsPath) and not len(FileLoader.getAllFile(GameManager.modsPath)) == 0:
		MKUtil.print("Loading " + str(len(FileLoader.getAllFile(GameManager.modsPath))) + " Mods")
		for i in FileLoader.getAllFile(GameManager.modsPath):
			loadScene(GameManager.modsPath.path_join(i))
	else:
		MKUtil.print("no mods to load :(")
		
func loadScene(path : String):
	'''
	ths func load all json store in the itwcdata file, the dict is created following the different loading mode
	'''
	var JSONdict : Dictionary = {}
	var loadDict : Dictionary = {}
	if FileAccess.file_exists(path.path_join("pack.ITWCdata")):
		loadDict = loadITWCdata(path.path_join("pack.ITWCdata"))
		for j in loadDict.keys():
			for k in loadDict[j].keys():
				JSONdict = FileLoader.JsonToDict(FileLoader.loadJsonToRead(loadDict[j][k]))
				handleMode(j, k, JSONdict)

func handleMode(categorie : String, key : String, json : Dictionary):
	'''
	handle all different mode for loading, add just add the value to the dict, remove remove the value and replace replace the value
	'''
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
	'''
	just to make sure the key exist so it doesn't crash
	'''
	if not GameManager.loadedScene.has(categorie):
		GameManager.loadedScene[categorie] = {}

func loadITWCdata(path : String) -> Dictionary:
	'''
	load ITWCdata info into a dict so it's easier to read it
	'''
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
