@tool
extends EditorNode3DGizmoPlugin

const cameraRotationGizmo = preload("res://addons/ITWCdt/gizmo/cameraZone/gizmo/cameraZoneReferenceMoaisGizmo.gd")
const cameraRotationType = preload("res://core/shared/script/component/cameraComponent/reference/camera_zone_reference_const.gd")


func _init():
	pass
func _get_gizmo_name():
	return "- ITWC Gizmos - CameraReference"

func _create_gizmo(node):
	if node is cameraRotationType:
		return cameraRotationGizmo.new(node)
	else:
		return null
