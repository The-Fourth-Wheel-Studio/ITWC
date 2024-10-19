@icon("res://editor/assets/component/cameraZoneBehaviorComponent.png")
extends Node
class_name cameraZoneBehavior

@export var setup : bool = false
@export var isSetup : bool = false
@onready var startPoint : Vector3 = $startPos.position


func execute():
	isSetup = false
	setup = true
	GameManager.currentCamera.currentBehavior = self
	print("executed !")

func run():
	if setup and not isSetup:
		transition()
	else:
		behave()

func transition():
	GameManager.currentCamera.moveFromVect3((startPoint - GameManager.currentCamera.position).normalized())
	GameManager.currentCamera.look_at(GameManager.player.position)
	if (startPoint.distance_to(GameManager.currentCamera.position) < 0.6):
		setup = false
		isSetup = true
	print(startPoint.distance_to(GameManager.currentCamera.position))

func behave():
	GameManager.currentCamera.look_at(GameManager.player.position)
