extends ResourceFormatLoader
class_name ITWCResourceLoader
static var _scriptName : String = "ITWCdata"

func _get_recognized_extensions() -> PackedStringArray:
	return ["ITWCdata"]

func _handles_type(type: StringName) -> bool:
	return type == "ITWCdata"

func _load(path: String, original_path: String, use_sub_threads: bool, cache_mode: int) -> ITWCdata:
	var resource: ITWCdata = ITWCdata.new()
	resource.load(path)
	
	return resource
