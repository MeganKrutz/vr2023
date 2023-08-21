@tool
extends Node3D

## Scene of pickable object to load with pedestal.
@export var object_scene : PackedScene: set = _set_scene

## Signal emitted when object atop pedestal changes.
signal object_changed

# Object that will be transitioned to the next time the pedestal switches object
var next_object_scene : PackedScene

var is_ready : bool = false

# Instantiation of the loaded scene.
var object_node : Node

# Constants representing the ranged grab methods of pickable objects, as defined
# in the RangedMethod enum of the XRToolsPickable class.
const SNAP : int = 1
const LERP : int = 2

func _ready():
	is_ready = true
	_update_scene()

## Smoothly Transition from one pickable object scene to another with a shining
## animation.
func transition_scene(new_object_scene: PackedScene) -> void:
	next_object_scene = new_object_scene
	$AnimationPlayer.play("object_transition")

# Called inside object_transition animation to cause change in object.
# Changes object scene to the next object scene queued.
func _transition_to_next_scene() -> void:
	# If there is no object queued for changing, do nothing.
	if not next_object_scene:
		return

	# Change scene and prevent unnecessary reloads on repeat playback.
	_set_scene(next_object_scene)
	next_object_scene = null

# Directly change scene to load as pickable object atop pedestal.
func _set_scene(new_object_scene: PackedScene) -> void:
	object_scene = new_object_scene
	if is_ready:
		_update_scene()

# Update scene to sync together node and scene references.
func _update_scene() -> void:
	# If the instantiated node is not null, refresh it.
	if object_node:
		remove_child(object_node)
		object_node.queue_free()

	if object_scene:
		object_node = object_scene.instantiate()
		
		# If the loaded scene is NOT a pedestal object, do not instantiate it.
		if not object_node.is_in_group("pedestal_object"):
			printerr("object_pedestal: Cannot load node that is not apart of pedestal_object group.")
			return
		
		# After adding the pickable object, snap it to pedestal.
		# Pickable objects in this project animate to the hand by using
		# interpolation.
		#
		# This animation happens when snapping to a snapzone, so we temporarily
		# disable LERP-ing and set the ranged grab method to SNAP instead.
		# We set the ranged grab method back after the snapping has finised.
		add_child(object_node)
		object_node._set_ranged_grab_method(SNAP)
		$Pedestal/SnapZone.pick_up_object(object_node)
		object_node._set_ranged_grab_method(LERP)

		emit_signal("object_changed")
