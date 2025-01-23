class_name Plan

var x : Vector3
var y : Vector3

var normal : Vector3
#parametric Equation : [a,b,c,d] -> ax + by + cz + d = 0
var parametricEquation : Array
var pos : Vector3

func _init(x : Vector3, y : Vector3, a : Vector3):
	self.x = x
	self.y = y
	self.normal = Common.getNormalVectorOfAPlane(x,y)
	self.pos = a
	var d = - self.normal.x * x[0] - self.normal.y * x[1] - self.normal.z * x[2]
	self.parametricEquation = [self.normal.x,self.normal.y,self.normal.z, d]

func getOrthogonalProjection(point: Vector3) -> Vector3:
	var lambda = getLambda(point)

	var a = self.parametricEquation[0]
	var b = self.parametricEquation[1]
	var c = self.parametricEquation[2]
	
	var projected_x = point.x - lambda * a
	var projected_y = point.y - lambda * b
	var projected_z = point.z - lambda * c
	return Vector3(projected_x, -projected_y, projected_z)

func getLambda(point: Vector3) -> float:

	var a = self.parametricEquation[0]
	var b = self.parametricEquation[1]
	var c = self.parametricEquation[2]
	var d = self.parametricEquation[3]
	

	var numerator = (a * point.x + b * point.y + c * point.z + d)
	var denominator = a * a + b * b + c * c
	#divide by 0
	if abs(denominator) < 1e-6:
		return 0.0
	
	return numerator / denominator
