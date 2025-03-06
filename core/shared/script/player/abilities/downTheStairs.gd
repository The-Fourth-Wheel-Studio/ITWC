extends abilitiesAfterPhysics

@export var stairsRaycast : RayCast3D

func load():
	self.player = GameManager.player
	stairsRaycast.target_position.y = player.playerAttributeVar.MAX_STAIR_SIZE
	stairsRaycast.add_exception(player)
	stairsRaycast.add_exception(player)
#fall stairs by Majikayo Games (https://www.youtube.com/watch?v=-WjM1uksPIk) 
func doWhatever(delta):
	if(player.isOnFloor.wasOnFloor and not player.isOnFloor.isOnFloorImprove() and player.velocity.y <= 0):
		print("step")
		if stairsRaycast.get_collider():
			player.position.y = stairsRaycast.get_collision_point().y
			player.apply_floor_snap()
