extends StaticBody2D

var canattack = false
var attackactive = false
var attackactive2 = false
var open = false
var played = false
var doorcount = 0

func _process(_delta):
	
	if open == true:
		get_node("/root/Test/Player").canmove = false
		doorcount += 1
		if doorcount > 60:
			get_tree().change_scene_to_file("res://scenes/win.tscn")
		if played == false:
			$doorsprite.frame = 1
			$destroy.play()
			played = true
	
	if attackactive2 == true:
		attackactive = true
	
	if canattack == true:
		if get_node("/root/Test/Player").canmove == true:
			if Input.is_action_just_pressed("a"):
				if get_node("/root/Test/Player/Inv/Craft").getkey == true:
					open = true
				else:
					$Nopesound.play()

func _on_area_2d_body_entered(_body):
		attackactive2 = true
		if attackactive == true:
			var bodies = get_node("/root/Test/Player/Area2D").get_overlapping_bodies()
			if  bodies[1] == self:
				canattack = true

func _on_area_2d_body_exited(_body):
	canattack = false
