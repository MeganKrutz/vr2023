extends StaticBody3D


# Upon picking up a pedestal object, play its spinning animation and turn off
# its collision.
# Stop the animation when the object is no longer on the pedestal.
func _on_snap_zone_has_picked_up(what: Node3D):
	what.get_node("AnimationPlayer").play("spin")
	what.get_node("CollisionShape3D").set_disabled(true)

func _on_snap_zone_has_dropped(what: Node3D):
	what.get_node("AnimationPlayer").stop()
	what.get_node("CollisionShape3D").set_disabled(false)
