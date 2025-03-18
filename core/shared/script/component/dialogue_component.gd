@icon("res://editor/assets/component/dialogue_component.png")
extends Node3D
class_name dialogue

@export_category("action maker")
@export var actionMaker : Array[dialogueActor]

var dialogueActionId : int = -1
var isActive = false

func nextAction():
	print(dialogueActionId)
	if dialogueActionId < self.get_child_count() -1:
		dialogueActionId += 1
		self.get_child(dialogueActionId).doTheAction()
	else:
		isActive = false
		

func _ready():
	var dialogueGroupvar : dialogueGroup = self.get_parent()
	for i in actionMaker:
		if not dialogueGroupvar.dialogueSpeaker.has(i):
			dialogueGroupvar.dialogueSpeaker[i] = self

func doAction():
	isActive = true
	nextAction()
