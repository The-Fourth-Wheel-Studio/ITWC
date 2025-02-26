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

#onload
@export var loadContainer : VBoxContainer
@export var onLoadKey : TextEdit
@export var onLoadValue : TextEdit

#menue
@export var menueLoadContainer : VBoxContainer
@export var menueKey : TextEdit
@export var menueValue : TextEdit

#game
@export var gameLoadContainer : VBoxContainer
@export var gameKey : TextEdit
@export var gameValue : TextEdit


var file : ITWCdata

static func init(txt : String, path : String):
	var scene : ITWCdt_VBoxContainer = SELF_SCENE.instantiate()
	scene.labelName = txt
	scene.filePath = path
	return scene

func _ready():
	nameLabel.text = labelName
	file = loadITWCdata()
	refresh()
	
func _on_game_load_button_pressed():
	var txt0 : String = onLoadKey.text
	var txt1 : String = onLoadValue.text
	if(txt0 != "" and txt1 != ""):
		setFileValue("OnLoad",txt0,txt1)
	else:
		MKUtil.print("enable to set value")

func _on_menue_button_pressed() -> void:
	var txt0 : String = menueKey.text
	var txt1 : String = menueValue.text
	if(txt0 != "" and txt1 != ""):
		setFileValue("Menue",txt0,txt1)
	else:
		MKUtil.print("enable to set value")

func _on_game_button_pressed() -> void:
	var txt0 : String = gameKey.text
	var txt1 : String = gameValue.text
	if(txt0 != "" and txt1 != ""):
		setFileValue("Game",txt0,txt1)
	else:
		MKUtil.print("enable to set value")

func loadITWCdata():
	var file = ITWCdata.new()
	file = FileLoader.loadITWCdata(filePath)
	return file

func refresh():
	EngineTool.removeAllChildren(loadContainer)
	EngineTool.removeAllChildren(menueLoadContainer)
	EngineTool.removeAllChildren(gameLoadContainer)
	if file.has_section("OnLoad"):
		for i in file.get_section_keys("OnLoad"):
			loadContainer.add_child(ITWCdt_textEdit.init(i,file.get_value("OnLoad",i)))
	if file.has_section("Menue"):
		for i in file.get_section_keys("Menue"):
			menueLoadContainer.add_child(ITWCdt_textEdit.init(i,file.get_value("Menue",i)))
	if file.has_section("Game"):
		for i in file.get_section_keys("Game"):
			gameLoadContainer.add_child(ITWCdt_textEdit.init(i,file.get_value("Game",i)))

func setFileValue(category : String, key : String, value : String):
	file.set_value(category,key,value)
	file.save(filePath)
	refresh()

func removeFileValue(category : String, key : String):
	file.erase_section_key(category, key)
	file.save(filePath)
	refresh()
