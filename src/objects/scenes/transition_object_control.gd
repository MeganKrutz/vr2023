extends StaticBody3D

# Setup scenes for object transitioning.
var coin : PackedScene = preload("res://src/objects/scenes/pickables/pickable_coin.tscn")
var bulb : PackedScene = preload("res://src/objects/scenes/pickables/pickable_bulb.tscn")
var brain : PackedScene = preload("res://src/objects/scenes/pickables/pickable_brain.tscn")
var pencil : PackedScene = preload("res://src/objects/scenes/pickables/pickable_pencil.tscn")
var star : PackedScene = preload("res://src/objects/scenes/pickables/pickable_star.tscn")
var hand : PackedScene = preload("res://src/objects/scenes/pickables/pickable_handshake.tscn")

# Prepare for transition object looping functionality.
var object_scenes : Array[PackedScene] = [coin, bulb, brain, pencil, star, hand]
var object_index : int = 0

func _on_right_controller_button_pressed(button_name: String):
	if button_name != "ax_button":
		return
	
	# Increment index of object to be next shown and loop over if index exceeds bounds.
	object_index += 1
	object_index %= object_scenes.size()
	$ArchPedestal.transition_scene(object_scenes[object_index])
