@tool
class_name ArchVideo
extends StaticBody3D

## Class to enable playing a 2D video inside an arch, and syncing the video
## playback to a pedestal's held object.

## Scene containing unique video to play inside of arch.
## Use BaseVideo class to generate additional video scenes.
@export var video_scene : PackedScene: set = set_video_scene

## Array of time in seconds for an object switch to occur in the video playback.
## The object switched to will be the one located at the same index in
## object_values.
@export var time_keys : Array[int]

## Array of pickable object scenes to switch to when the time in time_keys is
## reached. Times associate to object scenes index-wise.
@export var object_values : Array[PackedScene]

## Mapping of playback seconds to object scenes. When playback reaches a time
## key, the scene's pedestal object will switch to the corresponding object.
# Godot has no support for typed dictionary exports, so time_keys and
# object_values are zipped together index-wise to form a dictionary mapping.
# Due to this, time_keys and object_values MUST be of the same length,
# otherwise time_mapping will be an empty dictionary.
var time_mapping : Dictionary = {}

# Instantiation of the selected view scene.
@onready var video_node : BaseVideo = $VideoViewport.scene_node

func _ready() -> void:
	# Time mapping can't be initialized if there aren't as many keys as values.
	if time_keys.size() == object_values.size():
		# Zip together times and scenes as key-value pairs.
		for index in range(time_keys.size()):
			var time: int = time_keys[index]
			var object_scene: PackedScene = object_values[index]
			
			time_mapping[time] = object_scene


# Monitor for if it is time to switch object according to video playback.
func _process(_delta) -> void:
	if Engine.is_editor_hint() or video_node == null:
		return
	
	var current_time: int = video_node.get_video_time() as int
	
	if time_mapping.has(current_time):
		var next_object: PackedScene = time_mapping[current_time]
		$ObjectPedestal.transition_scene(next_object)


## Set the video scene to play inside the arch.
func set_video_scene(new_scene: PackedScene) -> void:
	video_scene = new_scene
	$VideoViewport.set_scene(new_scene)


## Play arch video.
func play() -> void:
	$VideoViewport.scene_node.play()
