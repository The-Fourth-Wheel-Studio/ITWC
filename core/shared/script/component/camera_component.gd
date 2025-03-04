@icon("res://editor/assets/component/cameraComponent.png")
extends Camera3D
class_name theBestCameraEver

@export_category("Camera Zone")
@export var currentCameraZone : cameraZone
@export_category("Dead Zone")
@export var deadZoneCoordinates : Vector4
@export var cameraDeadZoneSpeed : float = 10

var cameraRot : float
var references : Vector4 = Vector4.ZERO

func _enter_tree():
	GameManager.setCurrentCamera(self)

func _ready():
	cameraRot = self.rotation_degrees.y
	references = NewReference(cameraRot)

func _process(delta):
	cameraRot = self.rotation_degrees.y
	if currentCameraZone:
		currentCameraZone.run(delta)
	GameManager.player.execute(delta)

func ifObjectIsInDeadZone(object : Node3D):
	var coord : Vector2 = getOnScreenObjectCoord(GameManager.player)/get_viewport().get_visible_rect().size
	return coord.x > deadZoneCoordinates.x and coord.x < deadZoneCoordinates.y and coord.y > deadZoneCoordinates.z and coord.y < deadZoneCoordinates.w
	
func ifObjectIsCentered(object : Node3D):
	var coord : Vector2 = getOnScreenObjectCoord(GameManager.player)/get_viewport().get_visible_rect().size
	return abs(coord.x) < 0.501 and abs(coord.x) > 0.499 and abs(coord.y) < 0.501 and abs(coord.y) < 0.499

func getOnScreenObjectCoord(object : Node3D):
	return self.unproject_position(object.global_position)

func getNewReference():
	cameraRot = self.rotation_degrees.y
	references = NewReference(cameraRot)

func getProjectionVector(curVec : Vector2, angle : float) -> Vector2:
	var angleRad = deg_to_rad(angle)

	var x : float = curVec.x * cos(angleRad) + curVec.y * sin(angleRad)
	var y : float = - curVec.x * sin(angleRad) + curVec.y * cos(angleRad)
	return Vector2(x, y)

func NewReference(angle : float) -> Vector4:
	var vectorX = getProjectionVector(Vector2(1,0),angle)
	var vectorY = getProjectionVector(Vector2(0,1),angle)
	return Vector4(vectorX.x, vectorX.y,vectorY.x, vectorY.y)
	
func getNewDir(curDir : Vector2) -> Vector2:
	var vecX : Vector2 = Vector2((references.x ) * curDir.x, (references.y) * curDir.x)
	var vecY : Vector2 = Vector2((references.z ) * curDir.y, (references.w) * curDir.y)
	
	return Vector2(vecX.x + vecY.x, vecX.y + vecY.y)

func getNewDirY(curDir : Vector2) -> Vector2:
	return Vector2((references.y ) * curDir.y, (references.w) * curDir.y).normalized()	

func moveFromVect3(vec : Vector3):
	self.position += vec

func moveToPos(pos : Vector3, speed):
	self.position = self.position.move_toward(pos, speed)

func rotateToRotation(rot : Vector3, speed):
	Common.rotateToward(self, rot, speed)

func rotateFromDegrees(deg : Vector3):
	self.rotation += deg

func getVectorToPoint(pos : Vector3) -> Vector3:
	return self.global_position - pos
