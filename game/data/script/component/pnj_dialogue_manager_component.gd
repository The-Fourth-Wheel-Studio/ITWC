extends Node3D
class_name pnjDialogueManager

@export_category("dialogue")
@export var speech : speechBubble

@export_category("Head")
@export var distanceFromHead : Marker3D
@export var distanceFromBase : Marker3D

@export_category("other thing idk")
@export var active : bool = false

func _process(delta : float):
	if active:
		isActive()
	return

func isActive():
	setBubblePosition(GameManager.currentCamera)

func setBubblePosition(camera : theBestCameraEver):
	var offsetXZ : Vector3 = -Vector2(distanceFromHead.position.x,distanceFromHead.position.z).length() * Common.getPerpendicularVector(camera.getVectorToPoint(self.global_position))
	var offsetY : Vector3 = Vector3(0, distanceFromHead.position.y, 0)
	var baseVec : Vector3 = distanceFromBase.position - distanceFromHead.position
	var baseOffset : Vector2 = Vector2(Vector2(baseVec.x,baseVec.z).length(),-baseVec.y)
	speech.setGlobalPosition(speech.getPositionOnScreen(self.global_position + offsetXZ + offsetY,camera))
	speech.setSpeechBalloonPos(baseOffset * 100)
	speech.setApparence()
