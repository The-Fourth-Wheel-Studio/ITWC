@icon("res://editor/assets/component/martin.png")
extends Node3D
class_name gameHead

var loadedScene : Dictionary = {}

func _enter_tree():
	MKUtil.print("Loading Game Files")
	
	MKUtil.print("Loading Game")
	loadHead()
	#load parameter
	#Settings.load()
	print(loadITWCdata("core/ITWC/pack.ITWCdata"))

func loadHead():
	GameManager.head = self
	GameManager.gamePath = FileLoader.getAbsolutePath()

func loadScene():
	pass

func loadMods():
	pass

func loadITWCdata(path : String) -> Dictionary:
	var file : ITWCdata = ITWCdata.new()
	file = FileLoader.loadITWCdata(path)
	var tempDict : Dictionary = {}
	for i in file.get_sections():
		tempDict[i] = {}
		for j in file.get_section_keys(i):
			tempDict[i][j] = file.get_value(i,j)
	return tempDict
	
func readLoaderFile():
	

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
