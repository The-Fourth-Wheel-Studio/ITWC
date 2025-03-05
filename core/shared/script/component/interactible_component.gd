@icon("res://editor/assets/component/interactibleComponent.png")
extends Node3D
class_name interactibleComponent
static var _scriptName : String = "interactible_component"

@export var scriptToExecute : interactionScript

func interact():
	scriptToExecute.execute()
