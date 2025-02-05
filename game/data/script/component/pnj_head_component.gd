extends Node3D
class_name pnjHead

@export_category("dialogue")
@export var speech : speechBubble

@export_category("Head")
@export var distanceFromHead : Marker3D
@export var distanceFromBase : Marker3D

func isActive():
	pass

func setBubblePosition(camera : theBestCameraEver):
	speech.setGlobalPosition(speech.getPositionOnScreen(self.position,camera) + Vector2(Vector2(distanceFromHead.x,distanceFromHead.y).length(),distanceFromHead.y))
