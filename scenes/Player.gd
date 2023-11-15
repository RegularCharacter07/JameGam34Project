extends CharacterBody2D

@export var speed = 0.5
var move1 = Vector2(-1,0)
var move2 = Vector2(1,0)
var move3 = Vector2(0,-1)
var move4 = Vector2(0,1)
@export var canmove = true

func _process(_delta):
		
	if canmove == true:
		if Input.is_action_pressed("up"):
			var collide = move_and_collide(move3)
			if !collide:
				position.y -= speed

	if canmove == true:
		if Input.is_action_pressed("down"):
			var collide = move_and_collide(move4)
			if !collide:
				position.y += speed

	if canmove == true:
		if Input.is_action_pressed("left"):
			var collide = move_and_collide(move1)
			if !collide:
				position.x -= speed

	if canmove == true:
		if Input.is_action_pressed("right"):
			var collide = move_and_collide(move2)
			if !collide:
				position.x += speed
					
	if canmove == true:
		if Input.is_action_pressed("b"):
			speed = 1.5
		else:
			speed = 0.5

	if canmove == false:
		$PlayerSprite.canplay = false
	else:
		$PlayerSprite.canplay = true
