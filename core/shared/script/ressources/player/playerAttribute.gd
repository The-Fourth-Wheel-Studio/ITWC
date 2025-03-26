extends Resource
class_name playerAttribute

@export_category("walking and running (and crouch)")
@export var WALK_SPEED : float = 5.0
@export var SPRINT_SPEED : float = 7.5
@export var CROUCH_SPEED : float = 2.5
@export var SPEED_VARIATION :  float = 0.5

@export_category("jump related stuff")
@export var JUMP_VELOCITY : float = 4.5
@export var COYOTE_TIME : float = 0.01

@export_category("stairs stuff (goofy i know)")
@export var MAX_STAIR_SIZE : float = -0.5

@export_category("newton")
@export var GRAVITY : float = 9.81
@export var ACCELERATION_FACTOR : float = 2.5
