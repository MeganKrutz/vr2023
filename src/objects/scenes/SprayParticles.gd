extends GPUParticles3D

# If the bottle is pressed while being held, display particles.
func _on_pickable_object_action_pressed(pickable):
	if not emitting:
		emitting = true
