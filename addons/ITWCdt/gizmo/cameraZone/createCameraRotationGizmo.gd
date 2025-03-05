@tool
extends EditorNode3DGizmoPlugin


const cameraRotationGizmo = preload("res://addons/ITWCdt/gizmo/cameraZone/gizmo/cameraZoneRotationMoaisGizmo.gd")
const cameraRotationType = preload("res://core/shared/script/component/cameraComponent/cameraRotation/camera_zone_rotation_moais.gd")


func _init():
	pass
func _get_gizmo_name():
	return "- ITWC Gizmos - CameraRotation"

func _create_gizmo(node):
	if node is cameraRotationType:
		return cameraRotationGizmo.new(node)


	else:
		return null
