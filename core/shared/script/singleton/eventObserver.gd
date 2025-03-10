extends Node

const _SUUID : int = 1486940497

var event : Dictionary = {}

func createEvent(eventName : String, state):
	event.get_or_add(eventName, state)
	
func addSaveData():
	SaveSystem.addThingsToSave(self.get_instance_id(), "event", _SUUID)
