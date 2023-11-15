extends AnimatedSprite2D

var counted = 0
var anim2 = "wood"
var selected = false
var canstone = false
var caniron = false
var cangold = false
var getkey = false
var power = 1

func _process(_delta):
	
	frame = counted
	play(anim2)
	
	if Input.is_action_just_pressed("select"):
		if selected == false:
			selected = true
		else:
			selected = false
	if selected == true:
		if Input.is_action_just_pressed("down"):
			counted += 1
		if Input.is_action_just_pressed("up"):
			counted -= 1
	if counted > 1:
		counted = 0
	if counted < 0:
		counted = 1
	if selected == true:
		if Input.is_action_just_pressed("a"):
			match anim2:
				"wood":
					match counted:
						0:
							$Nopesound.play()
						1:
							if get_parent().wood >= 10:
								get_parent().wood -= 10
								anim2 = "stone"
								canstone = true
								power = 1.3
								$Donesound.play()
							else:
								$Nopesound.play()
				"stone":
					match counted:
						0:
							$Nopesound.play()
						1:
							if get_parent().wood >= 25 and get_parent().stone >= 25 :
								get_parent().wood -= 25
								get_parent().stone -= 25
								anim2 = "iron"
								caniron = true
								power = 1.6
								$Donesound.play()
							else:
								$Nopesound.play()
				"iron":
					match counted:
						0:
							$Nopesound.play()
						1:
							if get_parent().wood >= 50 and get_parent().iron >= 25 :
								get_parent().wood -= 50
								get_parent().iron -= 25 
								anim2 = "nopickaxe"
								cangold = true
								power = 1.9
								$Donesound.play()
							else:
								$Nopesound.play()
				"nopickaxe":
					match counted:
						0:
							if get_parent().gold >= 50:
								get_parent().gold -= 50
								anim2 = "none"
								getkey = true
								$Donesound.play()
							else:
								$Nopesound.play()
						1:
							if get_parent().gold >= 50:
								get_parent().gold -= 50
								anim2 = "none"
								getkey = true
								$Donesound.play()
							else:
								$Nopesound.play()
