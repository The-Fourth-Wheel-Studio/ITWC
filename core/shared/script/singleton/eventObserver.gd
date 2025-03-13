extends Node

const _SUUID : int = 1486940497

var event : Dictionary = {}
var currentHandObject : String = ""

func load(savePath : String):
	addSaveData()
	event = getSavedData(savePath)

func createEvent(eventName : String, state):
	event.get_or_add(eventName, state)
	
func addSaveData():
	SaveSystem.addThingsToSave(self.get_instance_id(), "event", _SUUID)

func getSavedData(savePath : String):
	var temp = SaveSystem.getDataFromSUUID(savePath, _SUUID)
	if temp != null:
		return temp
	return {}

func setCurrentHandObject(handObject : String):
	currentHandObject = handObject
