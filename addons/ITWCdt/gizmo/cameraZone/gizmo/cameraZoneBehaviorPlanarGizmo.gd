@tool
extends EditorNode3DGizmo

const cameraZoneBehaviorPlanarComponent = preload("res://editor/component/cameraComponent/cameraZoneBehavior/camera_zone_behavior_planar.tscn")

var node:cameraZoneBehaviorPlanar = null
var redMat : StandardMaterial3D = StandardMaterial3D.new()
var greenMat : StandardMaterial3D = StandardMaterial3D.new()

func _init(node:cameraZoneBehaviorPlanar):
	var plugin = get_plugin();
	self.node = node
	redMat.albedo_color = Color(1.0,0.0,0.0,1.0)
	redMat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	greenMat.albedo_color = Color(0.0,1.0,0.0,1.0)
	greenMat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	
func _redraw():
	clear()
	add_lines(PackedVector3Array([Vector3(0.0,0.0,0.0),Vector3(self.node.point1.position.x,self.node.point1.position.y,0)]),redMat)
	add_lines(PackedVector3Array([Vector3(0,0,self.node.point1.position.z),Vector3(self.node.point1.position.x,self.node.point1.position.y,self.node.point1.position.z)]),redMat)
	add_lines(PackedVector3Array([Vector3(0.0,0.0,0.0),Vector3(0,0,self.node.point2.position.z)]),greenMat)
	add_lines(PackedVector3Array([Vector3(self.node.point2.position.x,self.node.point2.position.y,0),Vector3(self.node.point2.position.x,self.node.point2.position.y,self.node.point2.position.z)]),greenMat)
	
	#var boxmesh : BoxMesh = BoxMesh.new()
	#boxmesh.size = self.node.shape.size
	#var surface : SurfaceTool = SurfaceTool.new()
	#surface.create_from(boxmesh,0)
	#add_mesh(surface.commit(),mat)
