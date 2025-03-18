extends dialogueActionComponent
class_name dialogueActionComponentLockPlayer

@export_category("To Lock or not to lock")
@export var lock : bool = true

func doTheAction():
	if lock:
		GameManager.player.isAbleToMove = false
	else:
		GameManager.player.isAbleToMove = true
