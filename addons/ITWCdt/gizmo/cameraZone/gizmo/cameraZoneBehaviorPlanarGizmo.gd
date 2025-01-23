@tool
extends EditorNode3DGizmo

const cameraZoneBehaviorPlanarComponent = preload("res://editor/component/cameraComponent/cameraZoneBehavior/camera_zone_behavior_planar.tscn")


var node:cameraZoneBehaviorPlanar = null
var mat : StandardMaterial3D = StandardMaterial3D.new()
var redMat : StandardMaterial3D = StandardMaterial3D.new()
var greenMat : StandardMaterial3D = StandardMaterial3D.new()

func _init(node:cameraZoneBehaviorPlanar):
	var plugin = get_plugin();
	self.node = node
	redMat.albedo_color = Color(1.0,0.0,0.0,1.0)
	redMat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	greenMat.albedo_color = Color(0.0,1.0,0.0,1.0)
	greenMat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	mat.albedo_color = Color(0.2,0.2,0.2,0.5)
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	
func _redraw():
	clear()
	add_lines(PackedVector3Array([Vector3(0.0,0.0,0.0),self.node.point1.position]),redMat)
	add_lines(PackedVector3Array([Vector3(0.0,0.0,0.0),self.node.point2.position]),greenMat)
