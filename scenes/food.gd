extends Sprite2D

var food = 100
var count = 0

func _process(_delta):
	$foodtext.text = str(food)
	count += 1
	if count > 30:
		count = 0
		food -= 1
	if food > 100:
		food = 100
	if food < 0:
		get_tree().change_scene_to_file("res://scenes/lose.tscn")
