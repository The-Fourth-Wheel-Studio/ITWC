@tool
extends EditorPlugin

var cameraZoneColliderGizmos = preload("res://addons/ITWCdt/gizmo/cameraZone/createCameraZoneColliderGizmo.gd").new()
var cameraZoneBehaviorGizmos = preload("res://addons/ITWCdt/gizmo/cameraZone/createCameraZoneBehaviorGizmo.gd").new()
var cameraRotationGizmos = preload("res://addons/ITWCdt/gizmo/cameraZone/createCameraRotationGizmo.gd").new()
var cameraReferenceGizmos = preload("res://addons/ITWCdt/gizmo/cameraZone/createCameraReferenceGizmo.gd").new()
var pnjDialogueManagerGizmo = preload("res://addons/ITWCdt/gizmo/pnj/createPnjDialogueManagerGizmo.gd").new()

var resourceLoaderInstance
var resource_loader

func _enter_tree():
	add_node_3d_gizmo_plugin(cameraZoneColliderGizmos)
	add_node_3d_gizmo_plugin(cameraZoneBehaviorGizmos)
	add_node_3d_gizmo_plugin(cameraRotationGizmos)
	add_node_3d_gizmo_plugin(cameraReferenceGizmos)
	add_node_3d_gizmo_plugin(pnjDialogueManagerGizmo)

	var editorPlugin = EditorPlugin.new()
	editorPlugin.add_autoload_singleton("ITWCdataLoader", "res://addons/ITWCdt/ressourceFormatLoader/loadITWCdata.gd")

	if not resourceLoaderInstance:
		resourceLoaderInstance = load("res://addons/ITWCdt/ressourceFormatLoader/loadITWCdata.gd").new()
		ResourceLoader.add_resource_format_loader(resourceLoaderInstance)
		print("ResourceFormatLoader added")
	resource_loader = preload("res://addons/ITWCdt/ressourceFormatLoader/ITWCDataRessourceFormatLoader.gd").new()
	ResourceLoader.add_resource_format_loader(resource_loader)


func _exit_tree():
	remove_node_3d_gizmo_plugin(cameraZoneColliderGizmos)
	remove_node_3d_gizmo_plugin(cameraZoneBehaviorGizmos)
	remove_node_3d_gizmo_plugin(cameraRotationGizmos)
	remove_node_3d_gizmo_plugin(cameraReferenceGizmos)
	remove_node_3d_gizmo_plugin(pnjDialogueManagerGizmo)

	var editorPlugin = EditorPlugin.new()
	editorPlugin.remove_autoload_singleton("ITWCdataLoader")

	if resourceLoaderInstance:
		ResourceLoader.remove_resource_format_loader(resourceLoaderInstance)
		print("ResourceFormatLoader removed")
		resourceLoaderInstance = null
	ResourceLoader.remove_resource_format_loader(resource_loader)
