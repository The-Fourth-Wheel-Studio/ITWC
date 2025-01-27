extends Node

@export var option : Dictionary

func loadParameter():
	option = FileLoader.JsonToDict(FileLoader.loadJsonToRead("res://data/game/parameter/parameter.json"))
