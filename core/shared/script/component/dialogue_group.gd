@icon("res://editor/assets/component/dialogue_group.png")
extends Node3D
class_name dialogueGroup

@export_category("Event observer")
@export var eventState : int

@export_category("dialogue sorting")
@export var dialogueSpeaker : Dictionary
