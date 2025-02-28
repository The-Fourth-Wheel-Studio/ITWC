@tool
extends VBoxContainer
class_name ITWCdt_VBoxContainer

const SELF_SCENE : PackedScene = preload("res://addons/ITWCdt/editorControl/dataLoaderManager.tscn")
const CATEGORIE_SCENE : PackedScene = preload("res://addons/ITWCdt/editorControl/categorie.tscn")


const mod_path = "core/mods"
const GAME_PATH = "core/ITWC"

#init var
var labelName : String = "you shoudn't be able to see this"
var filePath : String = "core/ITWC"


@export var nameLabel : Label
@export var categorie : VBoxContainer
@export var categoryName : TextEdit

var file : ITWCdata

func init(txt: String, path: String):
	self.labelName = txt
	self.filePath = path

func _ready():
	nameLabel.text = labelName
	file = loadITWCdata()
	refresh()

func loadITWCdata():
	var file = ITWCdata.new()
	file = FileLoader.loadITWCdata(filePath)
	return file

func refresh():
	EngineTool.removeAllChildren(categorie)
	for i in file.get_sections():
		categorie.add_child(ITWCdt_categorie.init(i,i))

func setFileValue(category : String, key : String, value : String):
	file.set_value(category,key,value)
	file.save(filePath)
	refresh()

func removeFileValue(category : String, key : String):
	file.erase_section_key(category, key)
	file.save(filePath)
	refresh()

func removeCategory(category : String):
	if file.has_section(category):
		file.erase_section(category)
		file.save(filePath)
		refresh()


func _on_add_button_down():
	categorie.add_child(ITWCdt_categorie.init(categoryName.text,categoryName.text))
