extends GPUParticles3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# If the bottle is pressed while being held, display particles.
func _on_pickable_object_action_pressed(pickable):
	if not emitting:
		emitting = true
