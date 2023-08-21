@tool
extends XRController3D


## Prevent player from holding null object in the event they are holding the
## object that is about to be deleted.
func _on_arch_object_changed():
	$Pickup.drop_object()
