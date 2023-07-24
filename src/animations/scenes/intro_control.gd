extends Node3D

# Reference to introduction packed scene as an instantiatated control node.
@onready var intro : AspectRatioContainer = $Intro.scene_node

# Whether the GUI is still interactable with buttons or not.
var gui_has_collapsed : bool = false

func _on_right_controller_button_pressed(button_name: String):
	if gui_has_collapsed:
		return

	# Intro will remove itself after being played.
	if button_name == "ax_button":
		intro.play_intro()
		gui_has_collapsed = true
	
	if button_name == "by_button":
		intro.remove_intro()
		gui_has_collapsed = true
