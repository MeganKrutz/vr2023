@tool
class_name ArchVideo
extends StaticBody3D

## Class to enable playing a 2D video inside an arch.

## Scene containing unique video to play inside of arch.
## Use BaseVideo class to generate additional video scenes.
@export var video_scene : PackedScene: set = set_video_scene

## Set the video scene to play inside the arch.
func set_video_scene(new_scene: PackedScene) -> void:
	video_scene = new_scene
	$VideoViewport.set_scene(new_scene)

## Play arch video.
func play() -> void:
	$VideoViewport.scene_node.play()
