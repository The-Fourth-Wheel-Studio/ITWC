@tool
extends EditorNode3DGizmo


var node:cameraZoneReference = null
var greenMat : StandardMaterial3D = StandardMaterial3D.new()

func _init(node:cameraZoneReference):
	var plugin = get_plugin();
	self.node = node
	
	greenMat.albedo_color = Color(0.3,0.7,0.5,1)
	greenMat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA

	
func _redraw():
	clear()
	add_lines(PackedVector3Array([Vector3(0.0,0.0,0.0),Vector3(0.0,0.0,-1.0)]),greenMat)
	var pos = Vector3(0.0,0.0,-1.0)
	var direction = Vector3(0.0,0.0,-0.2)
	add_lines(PackedVector3Array([pos,(pos-direction/2 + Vector3(0.0,0.2,0))]),greenMat)
	add_lines(PackedVector3Array([pos,(pos-direction/2 - Vector3(0.0,0.2,0))]),greenMat)
