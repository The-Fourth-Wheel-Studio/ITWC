@icon("res://editor/assets/component/cameraZoneComponent.png")
extends Area3D
class_name cameraZone
static var _scriptName : String = "camera_zone_component"

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
		behaveBehavior(delta)
		referenceBehave()
		cameraRotationBehave()

func behaveBehavior(delta : float):
	behavior.setCameraPosition(behavior.getCameraPosition())
	
func transitioned(delta):
	return transition.transition(delta)

func execute():
	if GameManager.currentCamera.currentCameraZone != self:
		isSetup = false
		setup = true
		GameManager.currentCamera.currentCameraZone = self
		MKUtil.print("Change camera angles to : " + str(self.name), _scriptName)

func setupBehavior():
	behavior.setup()

func setupReference():
	reference.setup()

func setupCameraRotation():
	cameraTurner.setup()

func referenceBehave():
	reference.changeReference()

func cameraRotationBehave():
	cameraTurner.justRotate()
	
func _on_body_entered(_body):
	execute()
