@icon("res://editor/assets/component/dialogue_action_component.png")
extends Node3D
class_name dialogueActionComponent

@export_category("action dependancy")

func _ready() -> void:
	connectAllSignal()

func actionIsFinished():
	self.get_parent().nextAction()
	

func doTheAction():
	pass

func connectAllSignal():
	pass
