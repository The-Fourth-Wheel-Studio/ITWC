extends Node

var event : Dictionary = {}

func createEvent(name : String, state):
	event.get_or_add(name, state)		
		
func loadEventObserverData(savePath : String):
	event = FileLoader.JsonToDict(FileLoader.loadJsonToRead(savePath))["eventObserverData"]
