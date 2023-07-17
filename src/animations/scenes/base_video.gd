@tool
class_name BaseVideo
extends AspectRatioContainer

## Class to load any Ogg Theora video stream that will automatically fill to the
## screen resolution size of the user.

## Video stream to load to fill entire screen resolution upon being played.
@export var video : VideoStreamTheora: set = set_video

## Set video stream to be played.
func set_video(new_video: VideoStreamTheora) -> void:
	# Upon setting video stream in editor, also update resource for the video player.
	video = new_video
	$Video.set_stream(new_video)

## Play the loaded video stream from the beginning.
func play() -> void:
	$Video.play()
