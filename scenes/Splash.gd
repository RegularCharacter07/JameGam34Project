extends Node2D

var count = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	count += 1
	if count > 125:
		get_tree().change_scene_to_file("res://scenes/logo.tscn")
