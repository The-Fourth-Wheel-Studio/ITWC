@icon("res://editor/assets/component/cameraComponent.png")
extends Camera3D
class_name theBestCameraEver

var cameraRot : float
var references : Vector4 = Vector4.ZERO
@export var currentCameraZone : cameraZone
func _process(delta):
	GameManager.invDelta = (1-delta)
	cameraRot = self.rotation_degrees.y
	if currentCameraZone:
		currentCameraZone.run()
	GameManager.player.execute(delta)


func getNewReference():
	cameraRot = self.rotation_degrees.y
	references = getNewreference(cameraRot)

func _enter_tree():
	GameManager.setCurrentCamera(self)

func _ready():
	cameraRot = self.rotation_degrees.y
	references = getNewreference(cameraRot)
	
func getProjectionVector(curVec : Vector2, angle : float) -> Vector2:
	var angleRad = deg_to_rad(angle)

	var x : float = curVec.x * cos(angleRad) + curVec.y * sin(angleRad)
	var y : float = - curVec.x * sin(angleRad) + curVec.y * cos(angleRad)
	return Vector2(x, y)

func getNewreference(angle : float) -> Vector4:
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

func rotateFromDegrees(deg : Vector3):
	self.rotation += deg

func getVectorToPoint(pos : Vector3) -> Vector3:
	return self.global_position - pos
