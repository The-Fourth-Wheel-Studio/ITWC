@icon("res://editor/assets/component/cameraZoneBehaviorComponent.png")
extends cameraZoneBehavior
class_name cameraZoneBehaviorCylinder

@export var radius : float = 1.0
@export var yOffset : float = 1.0
@export var height : float = 1.0

var teta : float = 0.0

func getCameraPosition():
	teta = (Common.getComplexArgument(GameManager.player.global_position.x - self.global_position.x, GameManager.player.global_position.z - self.global_position.z))
	return (self.global_position + Common.convertCylindricalToCartisia(radius,teta,GameManager.player.global_position.y + yOffset))
	
