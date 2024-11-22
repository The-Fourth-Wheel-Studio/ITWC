@icon("res://editor/assets/component/abilitiesManager.png")
extends Node
class_name abilitiesManager

var abilitiesList : Array[abilities]

func load():
	for i in self.get_children():
		abilitiesList.append(i)
		i.load()
	MKUtil.print("successful loading of " + str(len(abilitiesList)) + " abillities")


func execute(delta):
	for i in abilitiesList:
		if i.active:
			i.execute(delta)
