@tool
extends EditorNode3DGizmo

const cameraZoneColliderComponent = preload("res://editor/component/camera_zone_collider_component.tscn")

var node:cameraZoneCollider = null
var mat : StandardMaterial3D = StandardMaterial3D.new()

func _init(node:cameraZoneCollider):
	var plugin = get_plugin();
	self.node = node
	mat.albedo_color = Color(1.0,1.0,0.0,0.5)
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	
func _redraw():
	clear()
	add_lines(PackedVector3Array([Vector3(0.0,0.0,0.0),Vector3(10.0,0.0,0.0)]),mat)
	var boxmesh : BoxMesh = BoxMesh.new()
	boxmesh.size = self.node.shape.size
	var surface : SurfaceTool = SurfaceTool.new()
	surface.create_from(boxmesh,0)
	add_mesh(surface.commit(),mat)
