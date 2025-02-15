extends EditorPlugin

var resource_loader

func enter_tree():
	resource_loader = preload("res://addons/ITWCdt/ressourceFormatLoader/ITWCDataRessourceFormatLoader.gd").new()
	ResourceLoader.add_resource_format_loader(resource_loader)

func exit_tree():
	ResourceLoader.remove_resource_format_loader(resource_loader)
