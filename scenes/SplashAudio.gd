extends AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if !playing:
		get_tree().change_scene_to_file("res://scenes/warning.tscn")
