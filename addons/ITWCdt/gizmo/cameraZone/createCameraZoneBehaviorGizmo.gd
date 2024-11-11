@tool
extends EditorNode3DGizmoPlugin

const cameraZoneBehaviorPlanarGizmo = preload("res://addons/ITWCdt/gizmo/cameraZone/gizmo/cameraZoneBehaviorPlanarGizmo.gd")
const cameraZoneBehaviorPlanarType = preload("res://game/data/script/component/cameraComponent/cameraBehavior/camera_zone_behavior_planar.gd")


func _init():
	pass
func _get_gizmo_name():
	return "- ITWC Gizmos - CameraZoneBehavior"

func _create_gizmo(node):
	if node is cameraZoneBehaviorPlanarType:
		return cameraZoneBehaviorPlanarGizmo.new(node)

	else:
		return null
