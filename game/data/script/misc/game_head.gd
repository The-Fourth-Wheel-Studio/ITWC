extends Node
class_name gameHead

func _ready():
	#load parameter
	Option.loadParameter()
	#load language
	GameManager.lang = FileLoader.JsonToDict(FileLoader.loadJsonToRead("res://data/asset/lang/"+Option.option["language"]))
	MKUtil.print("The game is loaded")
