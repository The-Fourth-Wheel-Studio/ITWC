extends Node3D
class_name abilities

@export var active : bool = false
var player : CharacterBody3D

func setActive(b : bool):
	self.active = b

func doWhatever(delta):
	pass

func execute(delta):
	if self.active and player:
		self.doWhatever(delta)
	
func load():
	self.player = GameManager.player
	
