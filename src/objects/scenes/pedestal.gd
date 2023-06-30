extends StaticBody3D

# Upon picking up a pedestal object, play its spinning animation. 
# Stop the animation when the object is no longer on the pedestal.
func _on_snap_zone_has_picked_up(what: Node3D):
	what.get_node("SpinAnimation").play("spin")
	what.set_collision_layer_value(3, false)
	what.set_collision_mask_value(3, false)


func _on_snap_zone_has_dropped(what: Node3D):
	what.get_node("SpinAnimation").stop()
	what.set_collision_layer_value(3, true)
	what.set_collision_mask_value(3, true)
