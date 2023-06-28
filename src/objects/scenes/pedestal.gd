extends StaticBody3D

# Upon picking up a pedestal object, play its spinning animation. 
# Stop the animation when the object is no longer on the pedestal.
func _on_snap_zone_has_picked_up(what):
	what.get_node("SpinAnimation").play("spin")

func _on_snap_zone_has_dropped(what: Node3D):
	what.get_node("SpinAnimation").stop()
