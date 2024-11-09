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
	self.parametricEquation = [normal.x,normal.y,normal.z,-1 * (normal.x*pos.x + normal.y*pos.y + normal.z*pos.z)]

func getOrthogonalProjection(point):
	var lambda = self.getLambda(point)
	return Vector3(point.x - (lambda * parametricEquation[0]),point.y - (lambda * parametricEquation[1]),point.z - (lambda * parametricEquation[2]))
	
func getLambda(point : Vector3):
	return (parametricEquation[0] * point.x + parametricEquation[1] * point.y + parametricEquation[2] * point.z + parametricEquation[3])/((parametricEquation[0]**2)+(parametricEquation[1]**2)+(parametricEquation[2]**2))
	
