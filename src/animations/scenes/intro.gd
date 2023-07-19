extends AspectRatioContainer

func _ready():
	play_intro()

# Intro will remove its own visibility after video is finished playing.
func play_intro() -> void:
	$GUI.visible = false
	$IntroVideo.play()

func _on_intro_video_finished():
	$GUI.visible = true
	remove_intro()

func remove_intro() -> void:
	$AnimationPlayer.play("gui_fade")
