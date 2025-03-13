@tool
extends EditorNode3DGizmoPlugin


const pnjDialogueManagerGizmo = preload("res://addons/ITWCdt/gizmo/pnj/gizmo/pnjDialogueManagerGizmo.gd")
const pnjDialogueManagerType = preload("res://core/shared/script/component/pnj.gd")


func _init():
	pass
func _get_gizmo_name():
	return "- ITWC Gizmos - pnjDialogueManagerGizmo"

func _create_gizmo(node):
	if node is pnjDialogueManagerType:
		return pnjDialogueManagerGizmo.new(node)

	else:
		return null
