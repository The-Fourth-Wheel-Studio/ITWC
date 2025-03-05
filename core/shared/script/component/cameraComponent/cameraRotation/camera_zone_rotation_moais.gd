extends cameraRotation
class_name cameraRotationMoais
static var _scriptName : String = "camera_zone_rotation_moais"

func getCameraRotation():
	return rot
	
func setup():
	rot = self.rotation
