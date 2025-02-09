extends Node

@export var option : Dictionary

func loadParameter():
	print(FileLoader.loadJsonToRead("data/game/parameter/parameter.json"))
	option = FileLoader.JsonToDict(FileLoader.loadJsonToRead("data/game/parameter/parameter.json"))
