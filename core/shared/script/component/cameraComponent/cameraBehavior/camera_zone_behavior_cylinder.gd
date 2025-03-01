@icon("res://editor/assets/component/cameraZoneBehaviorComponent.png")
extends cameraZoneBehavior
class_name cameraZoneBehaviorCylinder

@export var radius : float = 1.0
@export var yOffset : float = 1.0
@export var height : float = 1.0

var teta : float = 0.0

func behave():
	teta = (Common.getComplexArgument(GameManager.player.position.x - self.position.x, GameManager.player.position.z - self.position.z))

func getCameraPosition():
	return (self.position + Common.convertCylindricalToCartisia(radius,teta,GameManager.player.position.y + yOffset))
	
