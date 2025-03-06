@icon("res://editor/assets/component/abilitiesManager.png")
extends Node
class_name abilitiesManager
const _scriptName : String = "abilities"

var abilitiesList : Array[abilities]
var abilitiesAfterPhysicsList : Array[abilitiesAfterPhysics]

func load():
	for i in self.get_children():
		if i is abilitiesAfterPhysics:
			abilitiesAfterPhysicsList.append(i)
			i.load()
		elif i is abilities:
			abilitiesList.append(i)
			i.load()
	MKUtil.print("successful loading of " + str(len(abilitiesList)) + " abilities and " + str(len(abilitiesAfterPhysicsList)) + " abilities after physics", _scriptName)


func execute(delta):
	for i in abilitiesList:
		if i.active:
			i.execute(delta)

func executeAfterPhysics(delta):
	for i in abilitiesAfterPhysicsList:
		if i.active:
			i.execute(delta)
