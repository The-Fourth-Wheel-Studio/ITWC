class_name Plan


var x : Vector3
var y : Vector3

var normal : Vector3
var parametricEquation : Array
var pos : Vector3

func _init(x : Vector3, y : Vector3, a : Vector3):
	self.x = x
	self.y = y
	self.normal = Common.getNormalVectorOfAPlane(x, y)
	self.pos = a
	var d = -self.normal.dot(a)
	self.parametricEquation = [self.normal.x, self.normal.y, self.normal.z, d]

func getOrthogonalProjection(point: Vector3) -> Vector3:
	return getProjection(point, self.normal)
	
func getProjection(point: Vector3, projection_vector: Vector3) -> Vector3:
	var lambda = getLambda(point, projection_vector)
	return point - lambda * projection_vector
	
func getLambda(point: Vector3, projection_vector: Vector3) -> float:
	var a = self.parametricEquation[0]
	var b = self.parametricEquation[1]
	var c = self.parametricEquation[2]
	var d = self.parametricEquation[3]
	var numerator = a * point.x + b * point.y + c * point.z + d
	var denominator = a * projection_vector.x + b * projection_vector.y + c * projection_vector.z
	if abs(denominator) < 1e-6:
		return 0.0
	return numerator / denominator
