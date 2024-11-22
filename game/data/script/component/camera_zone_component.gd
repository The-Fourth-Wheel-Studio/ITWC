@icon("res://editor/assets/component/cameraZoneComponent.png")
extends Area3D
class_name cameraZone

@export var collider : cameraZoneCollider
@export var behavior : cameraZoneBehavior
@export var transition : cameraZoneTransition
@export var color : Color = Color(1.0,1.0,0.3,1.0)

var setup : bool = false
var isSetup : bool = false

func run():
	if setup:
		if not isSetup:
			setup = transitioned()
		else:
			GameManager.currentCamera.getNewReference()
			setup = true
	else:
		behave()

func transitioned():
	return transition.transition()

func execute():
	if GameManager.currentCamera.currentCameraZone != self:
		isSetup = false
		setup = true
		GameManager.currentCamera.currentCameraZone = self
		MKUtil.print("Change camera angles to : " + str(self.name))

func behave():
	behavior.behave()
	
func _on_body_entered(body):
	execute()
