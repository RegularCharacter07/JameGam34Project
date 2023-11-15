extends AudioStreamPlayer

func _process(_delta):
	if !playing:
		play()
