extends ResourceFormatLoader

func get_recognized_extensions() -> Array:
	return ["ITWCdata"]

func handles_type(typename: String) -> bool:
	return typename == "ITWCDataResource"

func get_resource_type(path: String) -> String:
	if path.get_extension().to_lower() == "itwcdata":
		return "ITWCDataResource"
	return ""

func load(path: String, original_path: String, use_sub_threads: bool, cache_mode: int) -> Resource:
	var file = FileAccess.open(path, FileAccess.READ)
	if file:
		var json_text = file.get_as_text()
		file.close()
		var json = JSON.new()
		var error = json.parse(json_text)
		if error == OK:
			var resource = ITWCDataResource.new()
			resource.data = json.get_data()
			return resource
		else:
			push_error("Erreur lors de l'analyse du JSON : %s" % error)
	else:
		push_error("Impossible d'ouvrir le fichier %s." % path)
	return null
