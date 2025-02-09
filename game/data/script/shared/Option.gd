extends Node

@export var option : Dictionary

func loadParameter():
	option = FileLoader.JsonToDict(FileLoader.loadJsonToRead("data/game/parameter/parameter.json"))
