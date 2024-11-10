@tool
extends MeshInstance3D

# Met à jour le paramètre dans le shader
func _process(delta: float) -> void:
	if self.mesh and self.mesh.get_surface_count() > 0:
		var material = self.mesh.surface_get_material(0)
		if material is ShaderMaterial:
			# Mettez à jour le paramètre du shader
			material.set("shader_parameter/pos", self.position)


# Notification quand le nœud entre dans l'arbre de la scène (éditeur)
func _notification(what: int) -> void:
	if what == NOTIFICATION_ENTER_TREE:
		update_shader_uniforms()


func update_shader_uniforms():
	if self.mesh and self.mesh.get_surface_count() > 0:
		var material = self.mesh.surface_get_material(0)
		if material is ShaderMaterial:
			material.set("shader_parameter/pos", self.position)
