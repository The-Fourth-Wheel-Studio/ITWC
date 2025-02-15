extends ResourceFormatLoader
class_name CustomResourceLoader

func _get_recognized_extensions() -> PackedStringArray:
	return ["ITWCdata"]

func _handles_type(type: StringName) -> bool:
	return type == "ITWCdata"

func _load(path: String, original_path: String, use_sub_threads: bool, cache_mode: int) -> Resource:
	var file = FileAccess.open(path, FileAccess.READ)
	if file == null:
		push_error("Failed to open resource: " + path)
		return null
	
	var content = file.get_as_text()
	file.close()

	var resource = ITWCdata.new()
	resource.data = content
	
	return resource
