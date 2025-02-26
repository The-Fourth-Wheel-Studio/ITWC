@tool
extends VBoxContainer
class_name ITWCdt_VBoxContainer

const SELF_SCENE : PackedScene = preload("res://addons/ITWCdt/editorControl/dataLoaderManager.tscn")
const TEXT_SCENE : PackedScene = preload("res://addons/ITWCdt/editorControl/text_edit.tscn")


const mod_path = "core/mods"
const GAME_PATH = "core/ITWC"

#init var
static var labelName : String = "you shoudn't be able to see this"
static var filePath : String = "core/ITWC"

@export var nameLabel : Label
@export var loadContainer : VBoxContainer

#onload
@export var onLoadKey : TextEdit
@export var onLoadValue : TextEdit

var file : ITWCdata

static func init(txt : String, path : String):
	var scene : ITWCdt_VBoxContainer = SELF_SCENE.instantiate()
	scene.labelName = txt
	scene.filePath = path
	return scene

func _ready():
	nameLabel.text = labelName
	loadContainer.add_child(ITWCdt_textEdit.init("grrr","miam"))
	file = loadITWCdata()
	
func _on_game_load_button_pressed():
	var txt0 : String = onLoadKey.text
	var txt1 : String = onLoadValue.text
	if(txt0 != "" and txt1 != ""):
		file.set_value("OnLoad",txt0,txt1)
		file.save(filePath)
	else:
		MKUtil.print("enable to set value")

func loadITWCdata():
	var file = ITWCdata.new()
	file = FileLoader.loadITWCdata(filePath)
	return file

func refresh():
	pass
