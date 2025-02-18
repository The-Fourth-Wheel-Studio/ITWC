extends Resource
class_name ITWCdata

@export var data : String 

func parse(newData : String):
	data = newData

func getLine(i : int):
	return data.get_slice("\n",i)
	
