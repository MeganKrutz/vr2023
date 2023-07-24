extends AspectRatioContainer

# Whether intro has finished playing out.
signal finished

# Intro will remove its own visibility after video is finished playing.
func play_intro() -> void:
	$GUI.visible = false
	$IntroVideo.play()

func _on_intro_video_finished():
	remove_intro()

func remove_intro() -> void:
	# Make white or black box appear to match fadeout of end of video.
	$FadeRectangle.visible = true
	$AnimationPlayer.play("gui_fade")
	emit_signal("finished")
