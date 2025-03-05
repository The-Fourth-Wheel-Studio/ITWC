@icon("res://editor/assets/component/velocityComponent.png")
extends Node
class_name velocityComponent


var Velocity : Vector3 = Vector3(0, 0, 0)

func setCurrentVelocity(velocity):
	'''
	set the Velocity to velocity
	PARAMETER velocity TYPE Vector3
	RETURN None
	'''
	self.Velocity = velocity

func applyGravity(gravityForce : float, delta : float):
	'''
	apply the gravity to the velocity (by default gravity have a force of 9.8)
	PARAMETER velocity TYPE vector3, gravityForce TYPE float, delta TYPE float
	RETURN None
	'''
	self.Velocity.y -= gravityForce * delta
	
func setVelocityX(velocityX : float):
	'''
	set Velocity.x to velocityX
	PARAMETER velocityX TYPE float
	RETURN None
	'''
	self.Velocity.x = velocityX

func setVelocityY(velocityY : float):
	'''
	set Velocity.y to velocityZ
	PARAMETER velocityY TYPE float
	RETURN None
	'''
	self.Velocity.y = velocityY

func setVelocityZ(velocityZ : float):
	'''
	set Velocity.z to velocityZ
	PARAMETER velocityZ TYPE float
	RETURN None
	'''
	self.Velocity.z = velocityZ

func setVelocityXZ(velocityXZ : Vector2):
	'''
	set velocity.x and velocity.z as velocityXZ[0] and velocityXZ[1] (use for movement)
	PARAMETER velocityXZ TYPE Vector2
	RETURN None
	'''
	self.Velocity.x = velocityXZ[0]
	self.Velocity.z = velocityXZ[1]
	
func lerpVelocityXZ(velocityXZ : Vector2, speed : float):
	self.Velocity.x = lerp(self.Velocity.x,velocityXZ[0],speed)
	self.Velocity.z = lerp(self.Velocity.z,velocityXZ[1],speed)

func addVelocityXZ(velocityAdd : Vector2):
	self.Velocity += Vector3(velocityAdd.x,0,velocityAdd.y)

func divideVelocityY(v : float):
	self.Velocity.y /= v

func getFinalVelocity():
	'''
	get Velocity
	PARAMETER none
	RETURN Velocity TYPE Vector3
	'''
	return self.Velocity
