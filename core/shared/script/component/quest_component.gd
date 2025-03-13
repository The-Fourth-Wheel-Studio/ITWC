@icon("res://editor/assets/component/quest_component.png")
extends Node3D
class_name Quest

func _ready() -> void:
	GlobalDialogueManager.triggerDialogue.connect(onDialogueTrigger)

func onDialogueTrigger(sender, option):
	print(sender, option)
