static func getGameFile():
	var data : ITWCdata = ITWCdata.new()
	data.load("res://core/ITWC/pack.ITWCdata")
	var arr : Array
	for i in data.get_section_keys("game_config"):
		arr.append(data.get_value("game_config", i))
	return arr
	
static func getModFile():
	pass
