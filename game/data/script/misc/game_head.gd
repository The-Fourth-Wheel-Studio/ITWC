@icon("res://editor/assets/component/martin.png")
extends Node3D
class_name gameHead

func _enter_tree():
	#first thing first
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
	GameManager.switchScene("res://game/testFolder/game.tscn")

func test():
	print(GameManager.lang["test"])
	EventObserver.createEvent("test","")
