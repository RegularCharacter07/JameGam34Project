extends AnimatedSprite2D

var anim = "idle"
@export var canplay = true

func _process(_delta):
	
	play(anim)
	
	if canplay == true:
		if Input.is_action_pressed("down"):
			anim = "walkdown"
	if canplay == true:
		if Input.is_action_pressed("left"):
			anim = "walkleft"
	if canplay == true:
		if Input.is_action_pressed("right"):
			anim = "walkright"
	if canplay == true:
		if !Input.is_action_pressed("up") and !Input.is_action_pressed("down") and !Input.is_action_pressed("left") and !Input.is_action_pressed("right"):
			anim = "idle"
	if canplay == true:
		if Input.is_action_pressed("up"):
			anim = "walkup"
	if canplay == true:
		if Input.is_action_pressed("b"):
			speed_scale = 2
		else:
			speed_scale = 1
	if canplay == false:
		anim = "idle"
		speed_scale = 1
