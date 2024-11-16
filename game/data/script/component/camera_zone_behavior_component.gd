@icon("res://editor/assets/component/cameraZoneBehaviorComponent.png")
extends Node
class_name cameraZoneBehavior



@export var speed : float = 1.0

@onready var startPoint : Vector3 = $startPos.position

var setup : bool = false
var isSetup : bool = false

func execute():
	isSetup = false
	setup = true
	GameManager.currentCamera.currentBehavior = self
	MKUtil.print("Change camera angles to : " + str(self.get_parent().name))

func run():
	if setup:
		if not isSetup:
			transition()
		else:
			GameManager.currentCamera.getNewReference()
			isSetup = true
	else:
		behave()

func transition():
	if (startPoint.distance_to(GameManager.currentCamera.position) < 0.6):
		setup = false
	else:
		GameManager.currentCamera.moveFromVect3((startPoint - GameManager.currentCamera.position).normalized() * speed)
		GameManager.currentCamera.look_at(GameManager.player.position)
	

func behave():
	GameManager.currentCamera.getNewReference()
	GameManager.currentCamera.look_at(GameManager.player.position)
