@icon("res://editor/assets/component/dialogue_group.png")
extends Node3D
class_name dialogueGroup

@export_category("Event observer")
@export var eventState : int

@export_category("dialogue sorting")
@export var dialogueSpeaker : Dictionary

func _ready():
	var dialogueManagervar : dialogueManager = self.get_parent()
	if dialogueManagervar.dialogueGroupRelatedEventIndex.has(eventState):
		dialogueManagervar.dialogueGroupRelatedEventIndex[eventState].append(self)
	else:
		dialogueManagervar.dialogueGroupRelatedEventIndex[eventState] = [self]

func doTheDialogue(senderType : GlobalDialogueManager.senderType, sender : dialogueActor):
	if senderType == GlobalDialogueManager.senderType.PNJ:
		dialogueSpeaker[sender].doAction()
