@icon("res://editor/assets/component/cameraZoneTransitionComponent.png")
extends Node3D
class_name cameraZoneTransition
static var _scriptName : String = "camera_zone_transition_component"

@export_category("transition attribute")
@export var speed : float = 0.3
@export var rotationSpeed : float = 0.1
@export_category("Transition behave")
@export var rotationTransition : cameraZoneRotationTransition
@export var positionTransition : cameraZonePositionTransition

var asTransitionnedOnRotation : bool = false
var asTransitionnedOnPosition : bool = false

func transition(delta):
	asTransitionnedOnPosition = positionTransition.doSomething(delta,speed)
	asTransitionnedOnRotation = rotationTransition.doSomething(delta,rotationSpeed)
	if (asTransitionnedOnPosition and asTransitionnedOnRotation):
		return true
	else:
		return false
