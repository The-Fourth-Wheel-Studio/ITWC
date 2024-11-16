@tool
extends EditorNode3DGizmoPlugin

const cameraZoneColliderGizmo = preload("res://addons/ITWCdt/gizmo/cameraZone/gizmo/cameraZoneColliderGizmo.gd")
const cameraZoneBehaviorStartPosGizmo = preload("res://addons/ITWCdt/gizmo/cameraZone/gizmo/cameraZoneBehaviorStartPosGizmo.gd")

const cameraZoneColliderType = preload("res://game/data/script/component/camera_zone_collider.gd")
const cameraZoneBehaviorStartPosType = preload("res://game/data/script/component/cameraComponent/point/camera_zone_behavior_start_pos_component.gd")


func _init():
	pass
func _get_gizmo_name():
	return "ITWC Gizmos - CameraZone"

func _create_gizmo(node):
	if node is cameraZoneColliderType:
		return cameraZoneColliderGizmo.new(node)
	elif node is cameraZoneBehaviorStartPosType:
		return cameraZoneBehaviorStartPosGizmo.new(node)
	else:
		return null
