@tool
class_name ArchVideo
extends StaticBody3D

## Class to enable playing a 2D video inside an arch.

# Video to play inside of arch. Must be of .ogv (Ogg Theora) extension.
@export var stream : VideoStreamTheora: set = set_arch_video

## Set the video to play inside the arch.
func set_arch_video(new_stream: VideoStreamTheora) -> void:
	stream = new_stream
	$BaseVideo.set_video(new_stream)
	$VideoViewport.scene_node = $BaseVideo

## Play arch video.
func play() -> void:
	$BaseVideo.play()
