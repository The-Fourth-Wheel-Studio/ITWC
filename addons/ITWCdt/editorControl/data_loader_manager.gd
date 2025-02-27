@tool
extends VBoxContainer
class_name ITWCdt_VBoxContainer

const SELF_SCENE : PackedScene = preload("res://addons/ITWCdt/editorControl/dataLoaderManager.tscn")
const TEXT_SCENE : PackedScene = preload("res://addons/ITWCdt/editorControl/text_edit.tscn")
const CATEGORIE_SCENE : PackedScene = preload("res://addons/ITWCdt/editorControl/categorie.tscn")


const mod_path = "core/mods"
const GAME_PATH = "core/ITWC"

#init var
var labelName : String = "you shoudn't be able to see this"
var filePath : String = "core/ITWC"

@export var nameLabel : Label
@export var categorie : VBoxContainer

var file : ITWCdata

func init(txt: String, path: String):
	self.labelName = txt
	self.filePath = path

func _ready():
	nameLabel.text = labelName
	file = loadITWCdata()
	categorie.add_child(ITWCdt_categorie.init("test","test"))
	categorie.add_child(ITWCdt_categorie.init("test","test"))
	categorie.add_child(ITWCdt_categorie.init("test","test"))
	categorie.add_child(ITWCdt_categorie.init("test","test"))
	categorie.add_child(ITWCdt_categorie.init("test","test"))
	refresh()

func loadITWCdata():
	var file = ITWCdata.new()
	file = FileLoader.loadITWCdata(filePath)
	return file

func refresh():
	pass

func setFileValue(category : String, key : String, value : String):
	file.set_value(category,key,value)
	file.save(filePath)
	refresh()

func removeFileValue(category : String, key : String):
	file.erase_section_key(category, key)
	file.save(filePath)
	refresh()
