extends Node


#player and camera stuff
@export var currentCamera : theBestCameraEver
@export var player : Player

#global game stuff
@export var head : gameHead
@export var loadedScene : Dictionary = {}

#build relatead stuff
@export var lang : Dictionary
@export var gamePath : String
@export var modsPath : String
@export var savePath : String


func setCurrentCamera(cam : theBestCameraEver):
	currentCamera = cam
	
func setCurrentPlayer(play : CharacterBody3D):
	player = play
