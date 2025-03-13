@icon("res://editor/assets/component/quest_component.png")
extends Node
class_name Quest

func _ready() -> void:
	GlobalDialogueManager.triggerDialogue.connect(onDialogueTrigger)
	GlobalDialogueManager.emit_signal("triggerDialogue", GlobalDialogueManager.senderType.OTHER, self)

func onDialogueTrigger(sender, option):
	print(sender, option)
