extends StaticBody2D

var health = 2
var death = false
var xran = randi_range(-176,448)
var yran = randi_range(-144,352)
var power = 1
var canattack = false
var attackactive = false
var attackactive2 = false

func _ready():
	position.x = xran
	position.y = yran

func _process(_delta):
	
	power = get_node("/root/Test/Player/Inv/Craft").power
	
	if attackactive2 == true:
		attackactive = true
	
	if canattack == true:
		if get_node("/root/Test/Player").canmove == true:
			if Input.is_action_just_pressed("a"):
				$hitsound.play()
				health -= power
	
	if health < 0:
		death = true
		$destroy.play()
	if death == true:
		get_node("/root/Test/Player/food").food += 10
		xran = randi_range(-176,448)
		yran = randi_range(-144,352)
		position.x = xran
		position.y = yran
		death = false
		health = 2

func _on_area_2d_body_entered(_body):
		attackactive2 = true
		if attackactive == true:
			var bodies = get_node("/root/Test/Player/Area2D").get_overlapping_bodies()
			if bodies[1] == self:
				canattack = true

func _on_area_2d_body_exited(_body):
	canattack = false
