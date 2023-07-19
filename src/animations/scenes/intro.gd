extends AspectRatioContainer

# Whether intro has finished playing out.
var has_finished : bool = false

# Intro will remove its own visibility after video is finished playing.
func play_intro() -> void:
	$GUI.visible = false
	$IntroVideo.play()

func _on_intro_video_finished():
	remove_intro()

func remove_intro() -> void:
	# Make white or black box appear to match end of video.
	$Rectangle.visible = true
	has_finished = true
	$AnimationPlayer.play("gui_fade")
