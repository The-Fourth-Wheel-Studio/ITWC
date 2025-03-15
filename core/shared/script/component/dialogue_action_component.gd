@icon("res://editor/assets/component/dialogue_action_component.png")
extends Node3D
class_name dialogueActionComponent

@export_category("action dependancy")
@export var speech : speechBubble

func _ready() -> void:
	connectAllSignal()

func actionIsFinished():
	self.get_parent().doNextAction()
	

func doTheAction(sender, optionnal):
	pass

func connectAllSignal():
	pass
