extends Area2D

var a = 1
var b = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var bullet_sprite = get_node("CardCover")


# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(true)

func _physics_process(delta):
	dragCard()
	
func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_RIGHT \
	and event.is_pressed():
		toggleTexture()
		
	elif event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
	and event.is_pressed():
		toggleDrag()
		

func toggleTexture():
	if (a == 1):
		bullet_sprite.set_texture(preload("res://Textures/Square.png"))
		a = 2
	else:
		bullet_sprite.set_texture(preload("res://Textures/CardCover.png"))
		a = 1

func toggleDrag():
	b = !b
	
func dragCard():
	if (b == true):
		var mouse_x = get_viewport().get_mouse_position().x
		var mouse_y = get_viewport().get_mouse_position().y
		position = Vector2(mouse_x,mouse_y)
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
