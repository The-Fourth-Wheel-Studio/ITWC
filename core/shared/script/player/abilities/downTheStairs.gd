extends abilitiesAfterPhysics

@export var playerFeet : Node3D
@export var isStair : RayCast3D

var wasSnap = false

func load():
	self.player = GameManager.player
	isStair.target_position.y = player.playerAttributeVar.MAX_STAIR_SIZE + player.playerAttributeVar.MAX_STAIR_SIZE/10.0
	isStair.add_exception(player)

#fall stairs by Majikayo Games (https://www.youtube.com/watch?v=-WjM1uksPIk) 
func downStair():
	var ok : bool = false
	if (player.isOnFloor.wasOnFloor or wasSnap) and not player.isOnFloor.isOnFloorImprove() and player.velocity.y <= 0 and isStair.is_colliding():
		var bodyTestResult = PhysicsTestMotionResult3D.new()
		var params = PhysicsTestMotionParameters3D.new()
		var max_step_down = -0.5
		params.from = playerFeet.global_transform
		params.motion = Vector3(0,player.playerAttributeVar.MAX_STAIR_SIZE,0)
		if PhysicsServer3D.body_test_motion(player.get_rid(), params, bodyTestResult):
			var translateY = bodyTestResult.get_travel().y
			player.position.y += -abs(translateY)
			player.apply_floor_snap()
			ok = true
	wasSnap = ok

func doWhatever(delta):
	downStair()
