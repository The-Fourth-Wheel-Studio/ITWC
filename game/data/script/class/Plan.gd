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
	# Calculer lambda à l'aide de la fonction getLambda
	var lambda = getLambda(point)
	
	# Récupérer les coefficients de l'équation cartésienne du plan
	var a = self.parametricEquation[0]
	var b = self.parametricEquation[1]
	var c = self.parametricEquation[2]
	
	# Calculer le point projeté
	var projected_x = point.x + lambda * a
	var projected_y = point.y + lambda * b
	var projected_z = point.z + lambda * c
	
	# Retourner le point projeté
	return Vector3(projected_x, projected_y, projected_z)

func getLambda(point: Vector3) -> float:
	# Récupérer les coefficients de l'équation cartésienne du plan
	var a = self.parametricEquation[0]
	var b = self.parametricEquation[1]
	var c = self.parametricEquation[2]
	var d = self.parametricEquation[3]
	
	# Calculer la valeur de lambda
	var numerator = -(a * point.x + b * point.y + c * point.z + d)
	var denominator = a * a + b * b + c * c
	
	if abs(denominator) < 1e-6:
		# Si le dénominateur est proche de 0, éviter la division par zéro
		return 0.0
	
	return numerator / denominator
