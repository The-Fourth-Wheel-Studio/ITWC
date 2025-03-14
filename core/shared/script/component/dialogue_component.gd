@icon("res://editor/assets/component/dialogue_component.png")
extends Node3D
class_name dialogue

var dialogueActionId : int = 0

signal doNextAction

func nextAction():
	dialogueActionId += 1
