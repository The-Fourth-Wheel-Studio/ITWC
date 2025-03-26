extends CharacterBody3D
class_name Player


@export_category("Component")
@export var velocityHandler : velocityComponent
@export var inputhandler : inputHandler
@export var isOnFloor : isOneFloorComponent
@export var repulseHandlerComponent : repulseHandler
@export var camera : theBestCameraEver
@export var abilitieManager : abilitiesManager
@export_category("player Attributes")
@export var model : Node3D
@export var playerAttributeVar : playerAttribute
@export_category("player Variables")
@export var isAbleToMove : bool = true
@export var gravityAccelerator : bool = false

func execute(_delta):
	pass
