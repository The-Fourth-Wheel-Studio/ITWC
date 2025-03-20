class_name Common
#Welcome in Titruc's hell !


static func banUnallowedChar(unAllowedChar : Array[String], string : String):
	var newString : String = ""
	for i in string:
		if i not in unAllowedChar:
			newString += i
	return newString

static func xor(bool1 : bool, bool2 : bool):
	if bool1 and bool2:
		return false
	elif not bool1 and not bool2:
		return false
	return true

static func convertCylindricalToCartisia(r, teta, z) -> Vector3:
	return Vector3(r * cos(teta), z, r * sin(teta))

static func pythagore(a, b):
	return sqrt(a**2+b**2)
	
static func getComplexArgument(a, b):
	var module = pythagore(a,b)
	if module == 0:
		return 0.0
	if b >= 0:
		return acos(a/module)
	else:
		return PI + PI - acos(a/module)

static func vectorialProduct(u : Vector3, v : Vector3):
	return Vector3(u[1]*v[2]-u[2]*v[1],u[2]*v[0]-u[0]*v[2],u[0]*v[1]-u[1]*v[0])

static func getNormalVectorOfAPlane(u : Vector3, v : Vector3):
	return vectorialProduct(u,v)

static func getVector3Rotation(u: Vector3) -> Vector3:
	if u.length() == 0:
		return Vector3.ZERO  # Pas de direction, pas de rotation.
	return Vector3(atan2(u.y, u.z), atan2(u.z, u.x), atan2(u.x, u.y))
	
static func getSign(i : int) -> int:
	if i<0:
		return -1
	else:
		return 1

static func lerpRotation(from : Vector3, to : Vector3, weigth : float):
	return Vector3(lerp_angle(from.x,to.x,weigth),lerp_angle(from.y,to.y,weigth),lerp_angle(from.z,to.z,weigth))
	
static func lerpVector3(from : Vector3, to : Vector3, weigth : float):
	return Vector3(lerp(from.x,to.x,weigth),lerp(from.y,to.y,weigth),lerp(from.z,to.z,weigth))
	
static func get_rotation_towards(from_position: Vector3, to_position: Vector3, up: Vector3 = Vector3.UP) -> Vector3:
	var direction = (to_position - from_position).normalized()
	if direction == Vector3.ZERO:
		return Vector3.ZERO

	var right = up.cross(direction).normalized()
	var recalculated_up = direction.cross(right).normalized()
	var basis = Basis(right, recalculated_up, -direction)
	return basis.get_euler()

static func getPerpendicularVector(vec1 : Vector3) -> Vector3:
	return vec1.cross(Vector3(0, 1, 0)).normalized()

#adam-bruno can't kill me for this one
static func biggestClosestValueInArray(value :int, array:Array)->int:
	var closestNum:int
	var n : int = array.size() - 1
	var ok : bool = true
	while(ok and n >=0):
		if value <= array[n]:
			closestNum = array[n]
		else:
			ok = false
		n -= 1
	return closestNum
