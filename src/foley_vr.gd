extends Node

# Reference to introduction packed scene as an instantiatated control node.
var intro : AspectRatioContainer

var xr_interface : XRInterface

# Called when the node enters the scene tree for the first time.
func _ready():
	setup_xr()
	
	# Manually listen for when introduction video has finished.
	intro = $XROrigin3D/XRCamera3D/IntroControl.intro
	intro.finished.connect(_on_intro_finished)

	# Disable visibility to make room for 2D introduction GUI.
	# Visibility is re-enabled once intro is finished.
	$Pantheon.visible = false

# Perform all necessary setup to use OpenXR in Godot.
func setup_xr() -> void:
	xr_interface = XRServer.find_interface("OpenXR")
	if xr_interface and xr_interface.is_initialized():
		print("OpenXR: XR Successfully initialized")
		
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
		
		Engine.physics_ticks_per_second = 90
		get_viewport().use_xr = true
		
	else:
		printerr("OpenXR: XR Failed to initialize.")

# Called when introduction video finishes playing.
func _on_intro_finished() -> void:
	$Pantheon.visible = true
