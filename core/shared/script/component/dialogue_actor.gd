@icon("res://editor/assets/component/dialogueActor.png")
extends Node3D
class_name dialogueActor

@export_category("related quest")
@export var relatedQuest : Quest
@export_category("don't even think touching here unless you're a beautiful man called Titruc")
@export var setManually : bool = false

func _ready() -> void:
	if not setManually:
		relatedQuest = self.get_parent()
