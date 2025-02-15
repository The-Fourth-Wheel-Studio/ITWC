@icon("res://editor/assets/component/martin.png")
extends Node3D
class_name gameHead

func _enter_tree():
	MKUtil.print("Loading Game")
	GameManager.head = self
	GameManager.gamePath = FileLoader.getAbsolutePath()
	#load parameter
	Settings.load()
	#load language
	var my_resource = ResourceLoader.load("res://core/ITWC/test.ITWCdata")
	print(FileLoader.JsonToDict(FileLoader.loadJsonToRead("core/ITWC/test.ITWCdata")))

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
