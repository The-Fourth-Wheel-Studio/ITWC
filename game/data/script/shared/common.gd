class_name Common

const vectorReferenceX = Vector3(1.0,0.0,0.0)

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
	if b >= 0:
		return acos(a/module)
	else:
		return PI + PI - acos(a/module)
