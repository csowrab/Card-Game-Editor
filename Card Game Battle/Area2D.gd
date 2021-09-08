extends Area2D

var a = 1
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var bullet_sprite = get_node("CardCover")


# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(true)

func _physics_process(delta):
	pass
	
func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
	and event.is_pressed():
		toggleTexture()
		

func toggleTexture():
	if (a == 1):
		bullet_sprite.set_texture(preload("res://Textures/Square.png"))
		a = 2
	else:
		bullet_sprite.set_texture(preload("res://Textures/CardCover.png"))
		a = 1
		
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
