extends Node

# Reference to introductory video upon entering world.
@onready var video : VideoStreamPlayer = $Arch/Intro.scene_node.get_node("Video")

var intro_has_played : bool = false
var xr_interface : XRInterface

# Called when the node enters the scene tree for the first time.
func _ready():
	xr_interface = XRServer.find_interface("OpenXR")
	if xr_interface and xr_interface.is_initialized():
		print("OpenXR: XR Success")
		
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
		
		Engine.physics_ticks_per_second = 90
		get_viewport().use_xr = true
	else:
		print("OpenXR: XR Failed")


func _on_right_controller_button_pressed(button_name: String):
	# print("Button pressed: ", button_name)
	if button_name == "ax_button" and not intro_has_played:
		video.play()
		intro_has_played = true
