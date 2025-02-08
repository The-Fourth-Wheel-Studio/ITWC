extends Node

#player and camera stuff
@export var currentCamera : theBestCameraEver
@export var player : CharacterBody3D
@export var lang : Dictionary
@export var head : gameHead

func setCurrentCamera(cam : theBestCameraEver):
	currentCamera = cam
	
func setCurrentPlayer(play : CharacterBody3D):
	player = play

func switchScene(scene:String, loadingScene = null):
	#MKhomer code thanks yoshman
	if loadingScene != null:
		loadingScene.visible = true
	#MultiplayerAPI.get_default_interface().
	if head != null:
		remove_child(head)
		head.queue_free()

	MKUtil.print(str("Switching scene to ", scene))
	head = ResourceLoader.load(scene).instantiate()
	head.name = "Scene"
	call_deferred("add_child", head)
	if loadingScene != null:
		loadingScene.visible = false

	
	
#physics
@export var invDelta : float = 1.0
