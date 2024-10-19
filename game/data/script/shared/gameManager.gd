extends Node

@export var currentCamera : theBestCameraEver
@export var player : CharacterBody3D

func setCurrentCamera(cam : theBestCameraEver):
	currentCamera = cam
	
func setCurrentPlayer(play : CharacterBody3D):
	player = play
