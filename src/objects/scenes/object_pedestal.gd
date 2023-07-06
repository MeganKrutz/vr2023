@tool
extends Node3D

# Scene of pickable object to load with pedestal.
@export var object_scene : PackedScene: set = set_scene

# How far elevated on the y-axis the spawned pickable object begin.
@export var elevation : float = 0.5

var is_ready : bool = false
var object_node : Node

func _ready():
	is_ready = true
	_update_scene()

# Upon updating the scene in the editor, update variable references.
func set_scene(new_object_scene: PackedScene) -> void:
	object_scene = new_object_scene
	if is_ready:
		_update_scene()

# Update scene to reflect any changes made.
func _update_scene() -> void:
	# If the instantiated node is not null, immediately refresh it.
	if object_node:
		remove_child(object_node)
		object_node.queue_free()

	if object_scene:
		object_node = object_scene.instantiate()
		
		# If the loaded scene is NOT a pedestal object, do not instantiate it.
		if not object_node.is_in_group("pedestal_object"):
			printerr("object_pedestal: Cannot load node that is not apart of pedestal_object group.")
			return
		
		# After adding the pickable objcet, place it atop pedestal.
		add_child(object_node)
		$PickableObject.translate(Vector3(0, elevation, 0))
