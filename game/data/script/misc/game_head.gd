@icon("res://editor/assets/component/martin.png")
extends Node
class_name gameHead

func _ready():
	#load parameter
	Option.loadParameter()
	#load language
	GameManager.lang = FileLoader.JsonToDict(FileLoader.loadJsonToRead("res://data/asset/lang/"+Option.option["language"]))["translation"]
	#load eventObserver
	EventObserver.loadEventObserverData()
	#everything is loaded
	MKUtil.print("The game is loaded")
	
	MKUtil.print("assert like Martelet does")
	test()
	

func test():
	print(GameManager.lang["test"])
	EventObserver.createEvent("test","")
