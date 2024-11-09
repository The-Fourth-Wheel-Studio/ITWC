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
	self.parametricEquation = [self.normal.x,self.normal.y,self.normal.z,-1 * (self.normal.x*self.pos.x + self.normal.y*self.pos.y + self.normal.z*self.pos.z)]

func getOrthogonalProjection(point):
	var lambda = self.getLambda(point)
	return Vector3(point.x - (lambda * self.parametricEquation[0]),point.y - (lambda * self.parametricEquation[1]),point.z - (lambda * self.parametricEquation[2]))
	
func getLambda(point : Vector3):
	return (self.parametricEquation[0] * point.x + self.parametricEquation[1] * point.y + self.parametricEquation[2] * point.z + self.parametricEquation[3])/((self.parametricEquation[0]**2)+(self.parametricEquation[1]**2)+(self.parametricEquation[2]**2))
	
