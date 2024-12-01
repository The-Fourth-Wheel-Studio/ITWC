@icon("res://editor/assets/component/cameraZoneTransitionComponent.png")
extends Node3D
class_name cameraZoneTransition

@export var rotationTransition : cameraZoneRotationTransition
@export var positionTransition : cameraZonePositionTransition

var asTransitionnedOnRotation : bool = false
var asTransitionnedOnPosition : bool = false

func transition():
	asTransitionnedOnRotation = rotationTransition.doSomething()
	asTransitionnedOnPosition = positionTransition.doSomething()
	print(asTransitionnedOnPosition)
	if (asTransitionnedOnPosition and asTransitionnedOnRotation):
		return false
	else:
		return true
