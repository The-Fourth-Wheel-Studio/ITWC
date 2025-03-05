extends Node
static var _scriptName : String = "eventObserver"

var event : Dictionary = {}

func createEvent(eventName : String, state):
	event.get_or_add(eventName, state)		
		
func loadEventObserverData(savePath : String):
	event = FileLoader.JsonToDict(FileLoader.loadJsonToRead(savePath))["eventObserverData"]
