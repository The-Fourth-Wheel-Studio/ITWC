@icon("res://editor/assets/component/martin.png")
extends Node
class_name gameHead

func _ready():
	#first thing first
	GameManager.rootScene = self.get_parent()
	GameManager.head = self
	#load parameter
	Option.loadParameter()
	#load language
	GameManager.lang = FileLoader.JsonToDict(FileLoader.loadJsonToRead("res://data/asset/lang/"+Option.option["language"]))["translation"]
	#everything is loaded
	MKUtil.print("The game is loaded")
	
	MKUtil.print("assert like Martelet does")
	test()

func loadSave(saveId : int):
	#load eventObserver
	EventObserver.loadEventObserverData("res://data/saves/"+FileLoader.getAllFile(Option.option["save_path"])[saveId])


func test():
	print(GameManager.lang["test"])
	EventObserver.createEvent("test","")
