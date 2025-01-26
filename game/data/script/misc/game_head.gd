extends Node
class_name gameHead

func _ready():
	FileLoader.loadFileToRead("res://data/asset/lang/fr_fr.json")
	MKUtil.print("The game is loaded")
