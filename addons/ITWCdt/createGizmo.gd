@tool
extends EditorNode3DGizmoPlugin

const cameraZoneColliderGizmo = preload("res://addons/ITWCdt/cameraZoneColliderGizmo.gd")

const cameraZoneCollider = preload("res://game/data/script/component/camera_zone_collider.gd")



func _init():
	pass
func _get_gizmo_name():
	return "- ITWC Gizmos"

func _create_gizmo(node):
	if node is cameraZoneCollider:
		print("aaa")
		return cameraZoneColliderGizmo.new(node)
	else:
		return null
