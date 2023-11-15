extends StaticBody2D

var health = 6
var death = false
var xran = randi_range(-176,448)
var yran = randi_range(-144,352)
var power = 1
var canattack = false
var attackactive = false
var attackactive2 = false
var materials = ["stone"]
var materialselected = materials.pick_random()

func _ready():
	position.x = xran
	position.y = yran
	match materialselected:
		"stone":
			$rocksprite.play("stone")
			health = 6
		"iron":
			$rocksprite.play("iron")
			health = 7
		"gold":
			$rocksprite.play("gold")
			health = 8
#materials = ["stone","iron","gold"]
func _process(_delta):
	
	power = get_node("/root/Test/Player/Inv/Craft").power
	
	if attackactive2 == true:
		attackactive = true
	
	if canattack == true:
		if get_node("/root/Test/Player").canmove == true:
			if Input.is_action_just_pressed("a"):
				match materialselected:
					"stone":
						if get_node("/root/Test/Player/Inv/Craft").canstone == true:
							$hitsound.play()
							health -= power
					"iron":
						if get_node("/root/Test/Player/Inv/Craft").caniron == true:
							$hitsound.play()
							health -= power
					"gold":
						if get_node("/root/Test/Player/Inv/Craft").cangold == true:
							$hitsound.play()
							health -= power
	
	if health < 0:
		death = true
		$destroy.play()
	if death == true:
		match materialselected:
			"stone":
				get_node("/root/Test/Player/Inv").stone += randi_range(1,3)
			"iron":
				get_node("/root/Test/Player/Inv").iron += randi_range(1,3)
			"gold":
				get_node("/root/Test/Player/Inv").gold += randi_range(1,3)
		xran = randi_range(-176,448)
		yran = randi_range(-144,352)
		position.x = xran
		position.y = yran
		if get_node("/root/Test/Player/Inv/Craft").caniron == true:
			if get_node("/root/Test/Player/Inv/Craft").cangold == false: 
				materials = ["iron"]
		if get_node("/root/Test/Player/Inv/Craft").cangold == true:
			materials = ["gold"]
		materialselected = materials.pick_random()
		match materialselected:
			"stone":
				$rocksprite.play("stone")
				health = 6
			"iron":
				$rocksprite.play("iron")
				health = 7
			"gold":
				$rocksprite.play("gold")
				health = 8
		death = false


func _on_area_2d_body_entered(_body):
		attackactive2 = true
		if attackactive == true:
			var bodies = get_node("/root/Test/Player/Area2D").get_overlapping_bodies()
			if bodies[1] == self:
				canattack = true

func _on_area_2d_body_exited(_body):
	canattack = false
