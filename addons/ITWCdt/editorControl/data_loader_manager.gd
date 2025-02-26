@tool
extends VBoxContainer
class_name ITWCdt_VBoxContainer

const SELF_SCENE : PackedScene = preload("res://addons/ITWCdt/editorControl/dataLoaderManager.tscn")
const TEXT_SCENE : PackedScene = preload("res://addons/ITWCdt/editorControl/text_edit.tscn")


const mod_path = "core/mods"
const GAME_PATH = "core/ITWC"

#init var
var labelName : String = "you shoudn't be able to see this"
var filePath : String = "core/ITWC"

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

#quest
@export var questLoadContainer : VBoxContainer
@export var questKey : TextEdit
@export var questValue : TextEdit


var file : ITWCdata

func init(txt: String, path: String):
	self.labelName = txt
	self.filePath = path

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

func _on_quest_button_pressed() -> void:
	var txt0 : String = questKey.text
	var txt1 : String = questValue.text
	if(txt0 != "" and txt1 != ""):
		setFileValue("Quest",txt0,txt1)
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
	EngineTool.removeAllChildren(questLoadContainer)
	if file.has_section("OnLoad"):
		for i in file.get_section_keys("OnLoad"):
			loadContainer.add_child(ITWCdt_textEdit.init(i,file.get_value("OnLoad",i)))
	if file.has_section("Menue"):
		for i in file.get_section_keys("Menue"):
			menueLoadContainer.add_child(ITWCdt_textEdit.init(i,file.get_value("Menue",i)))
	if file.has_section("Game"):
		for i in file.get_section_keys("Game"):
			gameLoadContainer.add_child(ITWCdt_textEdit.init(i,file.get_value("Game",i)))
	if file.has_section("Quest"):
		for i in file.get_section_keys("Quest"):
			questLoadContainer.add_child(ITWCdt_textEdit.init(i,file.get_value("Quest",i)))

func setFileValue(category : String, key : String, value : String):
	file.set_value(category,key,value)
	file.save(filePath)
	refresh()

func removeFileValue(category : String, key : String):
	file.erase_section_key(category, key)
	file.save(filePath)
	refresh()
