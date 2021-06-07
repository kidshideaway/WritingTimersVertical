extends Node

var minutes = 00;
var seconds = 27;
const TIME_PERIOD = 1; # 500ms
var time = 0;
var status = 0;
var timesup = 0;
var debug =0;

#autoload 
onready var Buttons = get_node("/root/Buttons");
onready var GameMenu = get_node("/root/GameMenu");
onready var TimerApp = get_node("/root/TimerApp");  

#Viewport_Container
onready var GetBackgroundImage =  get_node("/root/TimerNode/Viewport_Container/Viewport_Main/BG_Image");
onready var GetViewportNode = get_node("/root/TimerNode/Viewport_Container/Viewport_Main");

#TimerNode
onready var GetGameMenuControl =  get_node("/root/TimerNode/GameMenu_Control");
onready var GetTimerFrameImage =  get_node("/root/TimerNode/TimerFrame_Image");

#TimerFrame_Image
onready var GetRTLMINUTES = get_node("/root/TimerNode/TimerFrame_Image/HBoxContainer/RTL_MINUTES");
onready var GetRTLSECONDS = get_node("/root/TimerNode/TimerFrame_Image/HBoxContainer/RTL_SECONDS");
onready var new_minutes = 0; 
 
var start_x = 0;
var start_y = 0;
var Positional_Vector = Vector2(start_x,start_y);
var animation_speed = 1;
var end_buffer = 30;

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
 
# Called when the node enters the scene tree for the first time.
func _ready():
	
	if debug > 0:
		print("Global: _ready (start): minutes: ", minutes);
		print("Global: _ready (start): Bg_Timer_Size: ", Bg_Timer_Size);
		print("Global: _ready (start): Bg_Timer_Position: ", Bg_Timer_Position); 
		print("Global: _ready (start): Bg_Timer_start_x: ", Bg_Timer_start_x); 
		print("Global: _ready (start): Bg_Timer_start_y: ", Bg_Timer_start_y); 	 
		print("Global: _ready (start): Bg_Timer_size_x: ", Bg_Timer_size_x); 
		print("Global: _ready (start): Bg_Timer_size_y: ", Bg_Timer_size_y);  	 
		print("Global: _ready (start): Bg_Timer_middlepoint_x: ", Bg_Timer_middlepoint_x); 
		print("Global: _ready (start): Bg_Timer_middlepoint_y: ", Bg_Timer_middlepoint_y);  	 
		print("Global: _ready (start): Background_Image_Min_Size: ", Background_Image_Min_Size); 
		print("Global: _ready (start): Background_Image_Position: ", Background_Image_Position);  	 
		print("Global: _ready (start): BG_Image_start_x: ", BG_Image_start_x); 
		print("Global: _ready (start): BG_Image_start_y: ", BG_Image_start_y);  	 
		print("Global: _ready (start): BG_Image_size_x: ", BG_Image_size_x); 
		print("Global: _ready (start): BG_Image_size_y: ", BG_Image_size_y); 	 
		print("Global: _ready (start): Bg_Timer_start_x: ", BG_Image_middlepoint_x); 
		print("Global: _ready (start): Bg_Timer_start_y: ", BG_Image_middlepoint_y); 	 
		print("Global: _ready (start): viewport_rect2: ", viewport_rect2); 
		print("Global: _ready (start): viewport_position: ", viewport_position); 
		print("Global: _ready (start): viewport_size: ", viewport_size); 	 
		print("Global: _ready (start): viewport_start_x: ", viewport_start_x); 
		print("Global: _ready (start): viewport_start_y: ", viewport_start_y); 	 
		print("Global: _ready (start): viewport_size_x: ", viewport_size_x); 
		print("Global: _ready (start): viewport_size_y: ", viewport_size_y); 	 
		print("Global: _ready (start): viewport_middlepoint_x: ", viewport_middlepoint_x); 
		print("Global: _ready (start): viewport_middlepoint_y: ", viewport_middlepoint_y); 	 
		print("Global: _ready (start): minutes: ", minutes); 
		print("Global: _ready (start): seconds: ", seconds); 
		print("Global: _ready (start): TIME_PERIOD: ", TIME_PERIOD); 
		print("Global: _ready (start): time: ", time); 
		print("Global: _ready (start): status: ", status); 
		print("Global: _ready (start): timesup: ", timesup); 	 
		print("Global: _ready (start): Buttons: ", Buttons); 
		print("Global: _ready (start): GameMenu: ", GameMenu); 
		print("Global: _ready (start): TimerApp: ", TimerApp); 	 
		print("Global: _ready (start): GetBackgroundImage: ", GetBackgroundImage); 
		print("Global: _ready (start): GetViewportNode: ", GetViewportNode); 	 
		print("Global: _ready (start): GetGameMenuControl: ", GetGameMenuControl); 
		print("Global: _ready (start): GetTimerFrameImage: ", GetTimerFrameImage); 	 
		print("Global: _ready (start): GetRTLMINUTES: ", GetRTLMINUTES); 
		print("Global: _ready (start): GetRTLSECONDS: ", GetRTLSECONDS); 
		print("Global: _ready (start): new_minutes: ", new_minutes); 	 
		print("Global: _ready (start): start_x: ", start_x); 
		print("Global: _ready (start): start_y: ", start_y); 
		print("Global: _ready (start): Positional_Vector: ", Positional_Vector); 
		print("Global: _ready (start): animation_speed: ", animation_speed); 
		print("Global: _ready (start): end_buffer: ", end_buffer);  

	pass # Replace with function body.

