extends Button

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _on_tick():    
	#print("Buttons: _on_tick (start): minutes: ",Global.minutes);
	Global.status = 0; 
	TimerApp.update_minutes(); 
	TimerApp.switch_GameMenu();  
	TimerApp._Start_Timer();
	pass;
 
func _on_Minutes_5_Button_pressed():  
	Global.timesup = 0;
	Global.minutes = 5; 
	Global.seconds = 00; 
	_on_tick(); 
	pass;
	
func _on_Minutes_10_Button_pressed():
	Global.timesup = 0;
	Global.minutes = 10; 
	Global.seconds = 00;      
	_on_tick(); 
	pass;
	
func _on_Minutes_15_Button_pressed():
	Global.timesup = 0;
	Global.minutes = 15;  
	Global.seconds = 00;    
	_on_tick(); 
	pass;
	
func _on_Minutes_20_Button_pressed():
	Global.timesup = 0;
	Global.minutes = 20; 
	Global.seconds = 00;      
	_on_tick(); 
	pass;
	
func _on_Minutes_30_Button_pressed():
	Global.timesup = 0;
	Global.minutes = 30;    
	Global.seconds = 00; 
	_on_tick(); 
	pass;
	
func _on_Minutes_45_Button_pressed():
	Global.timesup = 0;
	Global.minutes = 45;    
	Global.seconds = 00; 
	_on_tick(); 
	pass;
	
func _on_Minutes_60_Button_pressed():
	Global.timesup = 0;
	Global.minutes = 60;  
	Global.seconds = 00;   
	_on_tick(); 
	pass; 
 

func _on_QuitButton_pressed():
	get_tree().quit();
	pass # Replace with function body.
