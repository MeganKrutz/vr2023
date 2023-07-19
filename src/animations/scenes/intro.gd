extends AspectRatioContainer


# Intro will remove its own visibility after video is finished playing.
func play_intro() -> void:
	$GUI.visible = false
	$IntroVideo.play()

func _on_intro_video_finished():
	remove_intro()

func remove_intro() -> void:
	$AnimationPlayer.play("gui_fade")
