extends abilitiesAfterPhysics

@export var playerFeet : Node3D

func load():
	self.player = GameManager.player
#fall stairs by Majikayo Games (https://www.youtube.com/watch?v=-WjM1uksPIk) 


var _snapped_to_stairs_last_frame = false
func _snap_down_to_stairs_check():
	var did_snap = false
	if (player.isOnFloor.wasOnFloor or _snapped_to_stairs_last_frame) and not player.isOnFloor.isOnFloorImprove() and player.velocity.y <= 0: #and $StairsBelowRayCast3D.is_colliding():
		var body_test_result = PhysicsTestMotionResult3D.new()
		var params = PhysicsTestMotionParameters3D.new()
		var max_step_down = -0.5
		params.from = playerFeet.global_transform
		params.motion = Vector3(0,max_step_down,0)
		if PhysicsServer3D.body_test_motion(player.get_rid(), params, body_test_result):
			var translate_y = body_test_result.get_travel().y
			player.position.y += -abs(translate_y)
			player.apply_floor_snap()
			did_snap = true
	_snapped_to_stairs_last_frame = did_snap

func doWhatever(delta):
	_snap_down_to_stairs_check()
