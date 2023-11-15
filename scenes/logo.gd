extends Node2D

var screenfull = false

func _process(_delta):
	if Input.is_action_just_pressed("start"):
		get_tree().change_scene_to_file("res://scenes/test.tscn")
	if Input.is_action_just_pressed("fullscreen"):
		if screenfull == false:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			screenfull = true
		else:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			screenfull = false
