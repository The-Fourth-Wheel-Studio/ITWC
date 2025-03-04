@icon("res://editor/assets/component/cameraZoneComponent.png")
extends Area3D
class_name cameraZone

@export_category("Camera Zone Component")
@export var collider : cameraZoneCollider
@export var behavior : cameraZoneBehavior
@export var transition : cameraZoneTransition
@export var reference : cameraZoneReference
@export var cameraTurner : cameraRotation

@export_category("Gizmo stuff")
@export var color : Color = Color(1.0,1.0,0.3,1.0)

var setup : bool = false
var isSetup : bool = false
var haveToMove : bool = false

func run(delta):
	if setup:
		if not isSetup:
			setupBehavior()
			setupReference()
			setupCameraRotation()
			isSetup = false
		if transitioned(delta):
			GameManager.currentCamera.getNewReference()
			setup = false
	else:
		if not GameManager.currentCamera.ifObjectIsInDeadZone(GameManager.player):
			haveToMove = true
		
		if haveToMove:
			behaveBehavior(delta)
			referenceBehave()
			cameraRotationBehave(delta)

func behaveBehavior(delta : float):
	GameManager.currentCamera.moveToPos(behavior.getCameraPosition(),3 * delta)
	
func transitioned(delta):
	return transition.transition(delta)

func execute():
	if GameManager.currentCamera.currentCameraZone != self:
		isSetup = false
		setup = true
		GameManager.currentCamera.currentCameraZone = self
		MKUtil.print("Change camera angles to : " + str(self.name))

func setupBehavior():
	behavior.setup()

func setupReference():
	reference.setup()

func setupCameraRotation():
	cameraTurner.setup()

func referenceBehave():
	reference.changeReference()

func cameraRotationBehave(delta : float):
	GameManager.currentCamera.rotateToRotation(cameraTurner.getCameraRotation(),3 * delta)
	
func _on_body_entered(_body):
	execute()
