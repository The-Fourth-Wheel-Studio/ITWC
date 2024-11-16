extends Node3D
class_name abilities

@export var active : bool = false
var player : CharacterBody3D

func setActive(b : bool):
	self.active = b

func doWhatever():
	pass

func execute():
	if self.active and player:
		self.doWhatever()
	
func load():
	self.player = GameManager.player
	
