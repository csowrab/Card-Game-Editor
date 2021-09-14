extends Node2D

onready var Text1 = get_node("Display1").get_node("Label")
onready var Text2 = get_node("Display2").get_node("Label")
onready var Text3 = get_node("Display3").get_node("Label")
onready var Text4 = get_node("Display4").get_node("Label")

var _timer = null

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Text1.text = '0';
	Text2.text = "0";
	Text3.text = "10";
	Text4.text = "10";
	
	_timer = Timer.new()
	add_child(_timer)

	_timer.connect("timeout", self, "_on_Timer_timeout")
	_timer.set_wait_time(10)
	_timer.set_one_shot(false) # Make sure it loops
	_timer.start()
	
	set_physics_process(true)
	

func _physics_process(delta):	
	Text3.text = str(int(_timer.get_time_left()))
	Text4.text = str(int(_timer.get_time_left()))
	
	
func _input(ev):
	
	if ev is InputEventKey and ev.scancode == KEY_K:
		Text1.text = str(int(Text1.text) + 1)
		 
	if ev is InputEventKey and ev.scancode == KEY_L:
		Text2.text = str(int(Text2.text) + 1)


	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
