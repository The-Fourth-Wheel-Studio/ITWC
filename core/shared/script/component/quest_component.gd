@icon("res://editor/assets/component/quest_component.png")
extends Node3D
class_name Quest

@export_category("Quest Attribut")
@export var questName : String

@export_category("Quest component")
@export var dialogueManagerComponent : dialogueManager

func _ready() -> void:
	GlobalDialogueManager.triggerDialogue.connect(onDialogueTrigger)

func onDialogueTrigger(senderType : GlobalDialogueManager.senderType, sender : dialogueActor):
	print("test 1", sender.relatedQuest.questName)
	if sender.relatedQuest.questName == questName:
		print("test 2",EventObserver.getEvent(questName))
		for i in dialogueManagerComponent.dialogueGroupRelatedEventIndex[EventObserver.getEvent(questName)]:
			i.doTheDialogue(senderType,sender)
