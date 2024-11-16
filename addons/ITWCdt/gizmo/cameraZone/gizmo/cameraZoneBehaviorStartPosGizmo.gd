@tool
extends EditorNode3DGizmo

var node:cameraZoneBehaviorStartPos = null
var mat : StandardMaterial3D = StandardMaterial3D.new()

func _init(node:cameraZoneBehaviorStartPos):
	var plugin = get_plugin();
	self.node = node
	mat.albedo_color = self.node.get_parent().get_parent().color
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	
func _redraw():
	clear()
	#add_lines(PackedVector3Array([Vector3(0.0,0.0,0.0),Vector3(10.0,0.0,0.0)]),mat)
	mat.albedo_color = self.node.get_parent().get_parent().color
	mat.albedo_color.a = 0.4
	var spheremesh : SphereMesh = SphereMesh.new()
	spheremesh.radius = 0.3
	spheremesh.height = 0.6
	var surface : SurfaceTool = SurfaceTool.new()
	surface.create_from(spheremesh,0)
	add_mesh(surface.commit(),mat)
