@tool
extends EditorNode3DGizmo


var node:pnj = null
var greenMat : StandardMaterial3D = StandardMaterial3D.new()

func _init(node:pnj):
	var plugin = get_plugin();
	self.node = node
	
	greenMat.albedo_color = Color(0.6,0.3,0.2,1)
	greenMat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA

	
func _redraw():
	clear()
	if node.speech:
		var cylinder : TorusMesh = TorusMesh.new()
		var distanceFromHead : float = Vector2(node.distanceFromHead.position.x,node.distanceFromHead.position.z).length()
		var distanceFromBase : float = Vector2(node.distanceFromBase.position.x ,node.distanceFromBase.position.z).length()
		cylinder.inner_radius= distanceFromHead
		cylinder.outer_radius= distanceFromBase
		cylinder.material = greenMat
		var offset_transform = Transform3D(Basis(), Vector3(0, node.distanceFromBase.position.y, 0))

		add_mesh(cylinder, greenMat,offset_transform)
