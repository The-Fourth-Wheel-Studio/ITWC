@icon("res://editor/assets/component/pnj.png")
extends Node3D
class_name pnj

@export_category("dialogue")
@export var isPlayerIsNearby : Area3D

@export_category("speechBubble")
@export var speech : speechBubble
@export var distanceFromHead : Marker3D
@export var distanceFromBase : Marker3D

@export_category("other thing idk")
@export var active : bool = false

func _ready() -> void:
	if isPlayerIsNearby:
		isPlayerIsNearby.body_entered.connect(playerDetected)

func _process(_delta : float):
	if active:
		isActive()
	return
	
func playerDetected(body: Node3D):
	GlobalDialogueManager.emit_signal("triggerDialogue", GlobalDialogueManager.senderType.PNJ, self)

func isActive():
	if speech:
		setBubblePosition(GameManager.currentCamera)

func setBubblePosition(camera : theBestCameraEver):
	var offsetXZ : Vector3 = -Vector2(distanceFromHead.position.x,distanceFromHead.position.z).length() * Common.getPerpendicularVector(camera.getVectorToPoint(self.global_position))
	var offsetY : Vector3 = Vector3(0, distanceFromHead.position.y, 0)
	var baseVec : Vector3 = distanceFromBase.position - distanceFromHead.position
	var baseOffset : Vector2 = Vector2(Vector2(baseVec.x,baseVec.z).length(),-baseVec.y)
	speech.setGlobalPosition(speech.getPositionOnScreen(self.global_position + offsetXZ + offsetY,camera))
	speech.setSpeechBalloonPos(baseOffset * 100)
	speech.setApparence()
