extends Node2D
 
onready var Global = get_node("/root/Global");  
################## Audio Files ##########################
onready var AlarmBell = preload("res://Resources/audio/alarm-bell.wav");
onready var Player = get_node("/root/TimerNode/AudioStreamPlayer2D");
################# Position Data Collection Variables ##############
 
func _ready(): 
	Global.status = 1; 
	switch_GameMenu(); 
	_Start_Timer();
	pass 
	
func _Start_Timer(): 
	get_viewport_data(); 
	get_bg_image_data();
	 
	if(Global.BG_Image_size_y > Global.viewport_size_y):
		Global.BG_Image_start_y = -Global.BG_Image_size_y + Global.viewport_size_y;
	else:
		Global.BG_Image_start_y = 0;
	
	if(Global.BG_Image_size_x > Global.viewport_size_x):
		var temp = Global.BG_Image_size_x - Global.viewport_size_x;
		Global.BG_Image_start_x = Global.BG_Image_start_x-(temp)/2;
	else:
		Global.BG_Image_start_x = 0;
	 
	Global.GetBackgroundImage.set_position((Vector2(Global.BG_Image_start_x,Global.BG_Image_start_y))); 
	get_bg_image_data();
	Global.start_x = Global.BG_Image_start_x;
	Global.start_y = Global.BG_Image_start_y; 
	get_timer_bg_image_data();
	Global.Bg_Timer_start_x = 0;
	Global.Bg_Timer_start_y = 0;
	Global.GetTimerFrameImage.set_position((Vector2(Global.Bg_Timer_start_x, Global.Bg_Timer_start_y))); 
	get_timer_bg_image_data();
	var temp = (Global.minutes*60) + Global.end_buffer;
	Global.animation_speed = (Global.BG_Image_size_y - Global.viewport_size_y) / temp; 
	pass;

func switch_GameMenu():  
	if Global.status == 1 : 
		GameMenu.make_visible();
	else:  
		GameMenu.make_invisible();
	pass;  

func get_viewport_data():  
	print("TimerApp: get_viewport_data (start): GetViewportNode: ", Global.GetViewportNode);  
	Global.viewport_rect2 = Global.GetViewportNode.get_visible_rect(); 
	Global.viewport_start_x = Global.viewport_rect2.position.x; 
	Global.viewport_start_y = Global.viewport_rect2.position.y; 
	Global.viewport_size_x = Global.viewport_rect2.size.x; 
	Global.viewport_size_y = Global.viewport_rect2.size.y; 
	Global.viewport_middlepoint_x = Global.viewport_size_x/2; 
	Global.viewport_middlepoint_y = Global.viewport_size_y/2; 
	pass;

func get_bg_image_data():   
	Global.Background_Image_Min_Size = Global.GetBackgroundImage.get_size();
	Global.Background_Image_Position = Global.GetBackgroundImage.get_position();
	Global.BG_Image_start_x = Global.Background_Image_Position.x; 
	Global.BG_Image_start_y = Global.Background_Image_Position.y; 
	Global.BG_Image_size_x = Global.Background_Image_Min_Size.x; 
	Global.BG_Image_size_y	= Global.Background_Image_Min_Size.y; 
	Global.BG_Image_middlepoint_x = Global.BG_Image_size_x/2; 
	Global.BG_Image_middlepoint_y = Global.BG_Image_size_y/2;  
	pass;

func get_timer_bg_image_data():   
	Global.Bg_Timer_Size = Global.GetTimerFrameImage.get_minimum_size();
	Global.Bg_Timer_Position = Global.GetTimerFrameImage.get_position();
	Global.Bg_Timer_start_x =  Global.Bg_Timer_Position.x; 
	Global.Bg_Timer_start_y = Global.Bg_Timer_Position.y; 
	Global.Bg_Timer_size_x  = Global.Bg_Timer_Size.x; 
	Global.Bg_Timer_size_y  = Global.Bg_Timer_Size.y; 
	Global.Bg_Timer_middlepoint_x = Global.Bg_Timer_size_x/2; 
	Global.Bg_Timer_middlepoint_y = Global.Bg_Timer_size_y/2;  
	pass;

func update_minutes():   
	update_timer();
	pass;

func update_timer():  
	if Global.timesup == 0:
		if Global.seconds < 1:
			Global.minutes = Global.minutes - 1;
			Global.seconds = 59;
		else:
			Global.seconds = Global.seconds -1;
	else:
		Global.seconds = Global.seconds + 1;
		
	Global.GetRTLMINUTES.set_text(str(Global.minutes).pad_zeros(2));
	Global.GetRTLSECONDS.set_text(str(Global.seconds).pad_zeros(2));
	Global.start_y = Global.start_y + Global.animation_speed;
	Global.Positional_Vector = Vector2(Global.start_x,Global.start_y);
	Global.GetBackgroundImage.set_global_position(Global.Positional_Vector); 

	if(Global.seconds <= 00):
		if(Global.minutes <= 00):
			play_alarm_bell();
			Global.timesup = 1;
			
	if(Global.minutes <=0):
		if(Global.timesup == 1):
			if(Global.seconds >= Global.end_buffer):
				get_tree().quit();
	pass;

func _process(delta): 
	Global.time += delta
	if Global.time > Global.TIME_PERIOD: 
		print("TimerApp: _process (update_timer): minutes: ",Global.minutes);
		update_timer();
		Global.time = 0;
	pass

func _input(event):
	if event is InputEventKey and event.pressed:
		if event.scancode == KEY_Q:
			get_tree().quit();
		if event.scancode == KEY_ESCAPE:
			get_tree().quit();
		if event.scancode == KEY_M:
			Global.status = 1;
			switch_GameMenu();

func play_alarm_bell(): 
	Player.stream = AlarmBell;
	Player.play()			