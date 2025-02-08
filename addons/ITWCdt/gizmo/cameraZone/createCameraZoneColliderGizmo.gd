@tool
extends EditorNode3DGizmoPlugin

const cameraZoneColliderGizmo = preload("res://addons/ITWCdt/gizmo/cameraZone/gizmo/cameraZoneColliderGizmo.gd")
const cameraZoneColliderType = preload("res://game/data/script/component/camera_zone_collider.gd")


func _init():
	pass
func _get_gizmo_name():
	return "- ITWC Gizmos - CameraZoneCollider"

func _create_gizmo(node):
	if node is cameraZoneColliderType:
		return cameraZoneColliderGizmo.new(node)

	else:
		return null
