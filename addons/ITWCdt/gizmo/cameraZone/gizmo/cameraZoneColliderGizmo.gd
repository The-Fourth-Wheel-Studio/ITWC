@tool
extends EditorNode3DGizmo

const cameraZoneColliderComponent = preload("res://editor/component/camera_zone_collider_component.tscn")

var node:cameraZoneCollider = null
var mat : StandardMaterial3D = StandardMaterial3D.new()

func _init(node:cameraZoneCollider):
	var plugin = get_plugin();
	self.node = node
	mat.albedo_color = self.node.get_parent().color
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	
func _redraw():
	clear()
	mat.albedo_color = self.node.get_parent().color
	mat.albedo_color.a = 0.3
	add_lines(PackedVector3Array([Vector3(0.0,0.0,0.0),Vector3(10.0,0.0,0.0)]),mat)
	var boxmesh : BoxMesh = BoxMesh.new()
	boxmesh.size = self.node.shape.size
	add_mesh(boxmesh,mat)
