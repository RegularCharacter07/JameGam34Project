extends Sprite2D

var selected = false
@export var wood = 0
@export var stone = 0
@export var iron = 0
@export var gold = 0

func _process(_delta):
	if Input.is_action_just_pressed("select"):
		if selected == false:
			selected = true
		else:
			selected = false
				
	if selected == false:
		visible = false
		get_node("/root/Test/Player").canmove = true
	else:
		visible = true
		get_node("/root/Test/Player").canmove = false
	
	$wood.text = str(wood)
	$stone.text = str(stone)
	$iron.text = str(iron)
	$gold.text = str(gold)
		
	if $Craft.canstone == true:
		if $Craft.caniron == false:
			if $Craft.cangold == false:
				$Pickaxe.visible = true
				$Pickaxe.play("wood")
				
	if $Craft.caniron == true:
		if $Craft.cangold == false:
			$Pickaxe.play("stone")
			
	if $Craft.cangold == true:
		$Pickaxe.play("iron")
		
	if $Craft.getkey == true:
		$Key.visible = true	
