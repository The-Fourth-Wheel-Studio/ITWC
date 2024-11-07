extends CharacterBody3D
class_name Player

#var for movement
var speed : float = 0.0
@export var playerAttributeVar : playerAttribute
@export var isAbleToMove : bool = true

@export var velocityHandler : velocityComponent
@export var inputhandler : inputHandler
@export var isOnFloor : isOneFloorComponent
@export var repulseHandler : repulseHandler
@export var camera : theBestCameraEver
@export var abilitieManager : abilitiesManager
