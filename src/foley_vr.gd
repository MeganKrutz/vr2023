extends Node

var xr_interface : XRInterface

# Called when the node enters the scene tree for the first time.
func _ready():
	xr_interface = XRServer.find_interface("OpenXR")
	if xr_interface and xr_interface.is_initialized():
		print("OpenXR: XR Success")
		
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
		
		Engine.physics_ticks_per_second = 90
		get_viewport().use_xr = true
		
		# Disable visibility to make room for 2D GUI.
		# Visibility is re-enabled once GUI is finished.
		$Pantheon.visible = false
	else:
		print("OpenXR: XR Failed")

func _on_xr_camera_3d_finished():
	$Pantheon.visible = true
