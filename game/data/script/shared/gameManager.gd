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



	
	
#physics
@export var invDelta : float = 1.0
