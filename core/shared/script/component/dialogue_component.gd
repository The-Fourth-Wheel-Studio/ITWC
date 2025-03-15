@icon("res://editor/assets/component/dialogue_component.png")
extends Node3D
class_name dialogue

@export_category("action maker")
@export var actionMaker : Array[dialogueActor]

var dialogueActionId : int = 0
var isActive = false

func nextAction():
	self.get_child(dialogueActionId).doTheAction()
	dialogueActionId += 1

func _ready():
	var dialogueGroupvar : dialogueGroup = self.get_parent()
	for i in actionMaker:
		if not dialogueGroupvar.dialogueSpeaker.has(i):
			dialogueGroupvar.dialogueSpeaker[i] = self

func doAction():
	isActive = true
	print("do the action")
