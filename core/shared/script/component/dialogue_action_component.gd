@icon("res://editor/assets/component/dialogue_action_component.png")
extends Node3D
class_name dialogueActionComponent

func _ready() -> void:
	GlobalDialogueManager.actionFinished.connect(actionIsFinished)

func actionIsFinished():
	self.get_parent().doNextAction()
	

func doTheAction(sender, optionnal):
	pass
