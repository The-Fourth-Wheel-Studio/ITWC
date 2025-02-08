extends Node

var event : Dictionary = {}

func createEvent(name : String, state):
	event.get_or_add(name, state)		
		
func loadEventObserverData():
	event = FileLoader.JsonToDict(FileLoader.loadJsonToRead("res://data/saves/save1.json"))["eventObserverData"]
