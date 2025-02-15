extends Node

var ITWCcustomRessource = CustomResourceLoader.new()

func _ready():
	ResourceLoader.add_resource_format_loader(ITWCcustomRessource)
