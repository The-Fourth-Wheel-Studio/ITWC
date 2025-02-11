@tool
extends Node3D
class_name playerLoader

@export_category("don't touch unless you're Titruc")
@export var id : int = -1

@export_category("tool for Martin")
@export_tool_button("Set Unique ID", "Callable") var setIdAction= setUniqueId
func setUniqueId():
	var tempId : int = int(FileLoader.loadFileToRead("res://editor/loadingSystem/player_loading_id.txt").get_line())
	id = tempId
	FileLoader.loadFileToWrite("res://editor/loadingSystem/player_loading_id.txt").store_line(str(tempId+1))

@export_category("Player Loader Data")
@export var firstCameraZone : cameraZone
@export var playerScene : String = "res://game/data/scene/entity/player/default/player.tscn"
@export var cameraScene : String = "res://editor/component/camera_component.tscn"

func loadPlayer():
	var player = load(playerScene).instantiate()
	
