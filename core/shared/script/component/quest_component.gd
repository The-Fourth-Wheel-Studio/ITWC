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
	if sender.relatedQuest.name == questName:
		dialogueManagerComponent.get_child(EventObserver.getEvent(questName))
