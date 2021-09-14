extends Node2D

onready var Text1 = get_node("Display1").get_node("Label")
onready var Text2 = get_node("Display2").get_node("Label")
onready var Text3 = get_node("Display3").get_node("Label")
onready var Text4 = get_node("Display4").get_node("Label")

var turn = 1;

var _timer = null

func _ready():
	Text1.text = '0';
	Text2.text = "0";
	Text3.text = "10";
	Text4.text = "<-";
	
	_timer = Timer.new()
	add_child(_timer)

	_timer.connect("timeout", self, "_on_Timer_timeout")
	_timer.set_wait_time(10)
	_timer.set_one_shot(false) # Make sure it loops
	_timer.start()
	
	set_physics_process(true)
	

func _physics_process(delta):	
	Text3.text = str(int(_timer.get_time_left()))

func toggleTurn():
	turn += 1;
	if (turn % 2 == 0):
		Text4.text = "->"
	else:
		Text4.text = "<-"
	
	
func _input(ev):
	
	var changed = false;
	
	if  ev is InputEventKey and ev.scancode == KEY_K and (changed == false):
		Text1.text = str(int(Text1.text) + 1)
		changed = true;
		 
	if ev is InputEventKey and ev.scancode == KEY_L:
		Text2.text = str(int(Text2.text) + 1)
		
	if ev is InputEventKey and ev.scancode == KEY_J:
		toggleTurn();


