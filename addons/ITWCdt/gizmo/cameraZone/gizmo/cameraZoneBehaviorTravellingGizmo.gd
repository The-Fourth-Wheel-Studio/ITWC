@tool
extends EditorNode3DGizmo


var node:cameraZoneBehaviorTravelling = null
var greenMat : StandardMaterial3D = StandardMaterial3D.new()

func _init(node:cameraZoneBehaviorTravelling):
	var plugin = get_plugin();
	self.node = node
	
	greenMat.albedo_color = Color(0.0,1.0,0.0,1.0)
	greenMat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA

	
func _redraw():
	clear()
	add_lines(PackedVector3Array([Vector3(0.0,0.0,0.0),self.node.point.position]),greenMat)

	for i in range(int(self.node.point.position.length())):
		var pos = self.node.point.position.normalized() * (i+1)
		var direction = self.node.point.position.normalized()
		add_lines(PackedVector3Array([pos,(pos-direction.normalized()/2 + Vector3(0.5,0,0))]),greenMat)
		add_lines(PackedVector3Array([pos,(pos-direction.normalized()/2 - Vector3(0.5,0,0))]),greenMat)
	var pos = self.node.point.position
	var direction = self.node.point.position.normalized()
	add_lines(PackedVector3Array([pos,(pos-direction.normalized()/2 + Vector3(0.5,0,0))]),greenMat)
	add_lines(PackedVector3Array([pos,(pos-direction.normalized()/2 - Vector3(0.5,0,0))]),greenMat)
