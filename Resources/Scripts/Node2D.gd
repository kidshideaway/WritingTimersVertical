extends Node2D

var minutes = 20;
var seconds = 03;
const TIME_PERIOD = 1; # 500ms
var time = 0;
var status = 0;
var timesup = 0;

onready var RTL_MINUTES = get_node("TextureRect/HBoxContainer/RTL_MINUTES");
onready var RTL_SECONDS = get_node("TextureRect/HBoxContainer/RTL_SECONDS");
onready var Background_Image = get_node("Background_Image");
onready var Background_to_timer = get_node("TextureRect");
var start_x = 0;
var start_y = 0;
var Positional_Vector = Vector2(start_x,start_y);
 
var animation_speed = 1;
var end_buffer = 30;
var user_bg_file_name = "";

################## Audio Files ##########################
onready var AlarmBell = preload("res://Resources/audio/alarm-bell.wav")
onready var Player = get_node("AudioStreamPlayer2D");
#onready var sample_player = $AudioStreamPlayer

################# Position Data Collection Variables ##############
#################  Viewport ##############
var viewport_rect2 = 0;
var viewport_position = 0;
var viewport_size = 0;
var viewport_start_x = 0;
var viewport_start_y = 0;
var viewport_size_x = 0;
var viewport_size_y = 0;
var viewport_middlepoint_x = 0;
var viewport_middlepoint_y = 0;

#################  Background Image  ##############
var Background_Image_Min_Size = 0;
var Background_Image_Position = 0;
var BG_Image_start_x = 0;
var BG_Image_start_y = 0;
var BG_Image_size_x = 0;
var BG_Image_size_y	= 0;
var BG_Image_middlepoint_x = 0;
var BG_Image_middlepoint_y = 0;

#################  Timer Background Image  ##############
var Bg_Timer_Size = 0;
var Bg_Timer_Position = 0;
var Bg_Timer_start_x = 0;
var Bg_Timer_start_y = 0;
var Bg_Timer_size_x  = 0;
var Bg_Timer_size_y  = 0;
var Bg_Timer_middlepoint_x = 0;
var Bg_Timer_middlepoint_y = 0;

func _ready():
	#get the viewport data
	get_viewport_data();  
	#get the background image data
	get_bg_image_data();
	
	#Force image to bottom of screen.
	if(BG_Image_size_y > viewport_size_y):
		BG_Image_start_y = -BG_Image_size_y + viewport_size_y;
	else:
		BG_Image_start_y = 0;
	
	if(BG_Image_size_x > viewport_size_x):
		BG_Image_start_x = BG_Image_start_x-(BG_Image_size_x - viewport_size_x)/2; 
	else:
		BG_Image_start_x = 0;
	
	Background_Image.set_position((Vector2(BG_Image_start_x,BG_Image_start_y)));
	print("Background Image Auto Adjusted (Y-axis) ", BG_Image_start_y) 
	print("Background Image Auto Adjusted (X-axis) ", BG_Image_start_x) 
	
	### resync your data after moving the background
	get_bg_image_data();
	# this sets up the variables for the image to scroll
	start_x = BG_Image_start_x;
	start_y = BG_Image_start_y;
	
	#get the background of the timer which is also the container for the timer.
	get_timer_bg_image_data();
	
	# Center the timer background image to the viewport. 
	Bg_Timer_start_x = 0;
	Bg_Timer_start_y = 0;
	#Bg_Timer_start_x = Bg_Timer_start_x + viewport_size_x - Bg_Timer_size_x;
	#Bg_Timer_start_y = Bg_Timer_start_y - viewport_size_y + Bg_Timer_size_y;
	Background_to_timer.set_position((Vector2(Bg_Timer_start_x, Bg_Timer_start_y)));
	print("Timer Background Auto Adjusted (X-axis) ", Bg_Timer_start_x)  
	print("Timer Background Auto Adjusted (Y-axis) ", Bg_Timer_start_y)  
	
	get_timer_bg_image_data();
		
	var temp = (minutes*60) + end_buffer ;
	animation_speed = (BG_Image_size_y - viewport_size_y) / temp;
	#print(temp);
	#print(BG_Image_size_y);
	#print(animation_speed);
	
	pass # Replace with function body.

func get_viewport_data():
	#get the viewport data
	viewport_rect2 = get_viewport().get_visible_rect();
	viewport_start_x = viewport_rect2.position.x;
	#print("viewport x:" , viewport_start_x);
	viewport_start_y = viewport_rect2.position.y;
	#print("viewport y:" , viewport_start_y);
	viewport_size_x = viewport_rect2.size.x;
	#print("viewport size x:" , viewport_size_x);
	viewport_size_y = viewport_rect2.size.y;
	#print("viewport size y:" , viewport_size_y);
	viewport_middlepoint_x = viewport_size_x/2;	
	#print("Mid Point x:" , viewport_middlepoint_x);
	viewport_middlepoint_y = viewport_size_y/2;
	#print("Mid Point y:" , viewport_middlepoint_y);
	#print("#########################")
	pass;

func get_bg_image_data():
	#get the background image data
	Background_Image_Min_Size = Background_Image.get_size();
	Background_Image_Position = Background_Image.get_position();
	BG_Image_start_x = Background_Image_Position.x;
	#print("BG Image x:" , BG_Image_start_x);
	BG_Image_start_y = Background_Image_Position.y;
	#print("BG Image y:" , BG_Image_start_y);
	BG_Image_size_x = Background_Image_Min_Size.x;
	#print("BG Image size x:" , BG_Image_size_x);
	BG_Image_size_y	= Background_Image_Min_Size.y;
	#print("BG Image size y:" , BG_Image_size_y);
	BG_Image_middlepoint_x = BG_Image_size_x/2;
	#print("Mid Point x:" , BG_Image_middlepoint_x);
	BG_Image_middlepoint_y = BG_Image_size_y/2;
	#print("Mid Point y:" , BG_Image_middlepoint_y);
	#print("#########################") 
	pass;

func get_timer_bg_image_data():
	# get the background of the timer which is also the container for the timer.
	Bg_Timer_Size = Background_to_timer.get_minimum_size();
	Bg_Timer_Position = Background_to_timer.get_position();
	Bg_Timer_start_x =  Bg_Timer_Position.x;
	#print("BG of Timer x:" , Bg_Timer_start_x); 
	Bg_Timer_start_y = Bg_Timer_Position.y;
	#print("BG of Timer y:" , Bg_Timer_start_y); 
	Bg_Timer_size_x  = Bg_Timer_Size.x;
	#print("BG of Timer size x:" , Bg_Timer_size_x); 
	Bg_Timer_size_y  = Bg_Timer_Size.y;
	#print("BG of Timer size y:" , Bg_Timer_size_y); 
	Bg_Timer_middlepoint_x = Bg_Timer_size_x/2;
	#print("Mid Point x:" , Bg_Timer_middlepoint_x); 
	Bg_Timer_middlepoint_y = Bg_Timer_size_y/2;
	#print("Mid Point y:" , Bg_Timer_middlepoint_y);
	#print("#########################") 
	pass;

func update_timer(): 
	if timesup == 0:
		if seconds < 1:
			minutes = minutes - 1;
			seconds = 59;
		else:
			seconds = seconds -1;
	else:
		seconds = seconds + 1;
		
	RTL_MINUTES.set_text(str(minutes).pad_zeros(2));
	RTL_SECONDS.set_text(str(seconds).pad_zeros(2));
	
	start_y = start_y + animation_speed;
	Positional_Vector = Vector2(start_x,start_y);
	Background_Image.set_global_position(Positional_Vector) 

	if(seconds <= 00):
		if(minutes <= 00):
			play_alarm_bell();
			timesup = 1;
			
	if(minutes <=0):
		if(timesup == 1):
			if(seconds >= end_buffer):
				get_tree().quit();
	

func _process(delta):
	time += delta
	if time > TIME_PERIOD: 
		update_timer();
		time = 0;
	pass

func _input(event):
	if event is InputEventKey and event.pressed:
		if event.scancode == KEY_Q:
			get_tree().quit();

func play_alarm_bell(): 
	Player.stream = AlarmBell
	Player.play()			
