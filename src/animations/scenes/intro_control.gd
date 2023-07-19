extends XRCamera3D

# Signal emitted when introduction has finished playing.
signal finished

# Reference to introduction 2D node.
@onready var intro : AspectRatioContainer = $Intro.scene_node

var intro_has_played : bool = false
var signal_emitted : bool = false

func _on_right_controller_button_pressed(button_name: String):
	if intro_has_played:
		return

	if button_name == "ax_button":
		intro.play_intro()
		intro_has_played = true
	
	if button_name == "by_button":
		intro.remove_intro()
		intro_has_played = true

func _process(delta):
	if intro.has_finished and not signal_emitted:
		emit_signal("finished")
		signal_emitted = true
		
