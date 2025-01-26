extends Node
class_name gameHead

func _ready():
	#load language
	GameManager.lang = FileLoader.loadJsonToRead("res://data/asset/lang/fr_fr.json")
	MKUtil.print("The game is loaded")
	print(FileLoader.readJsonData(GameManager.lang,"translator"))
