extends Button

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _on_tick():    
	print("Buttons: _on_tick (start): minutes: ",Global.minutes);
	Global.status = 0; 
	TimerApp.update_minutes(); 
	TimerApp.switch_GameMenu();  
	TimerApp._Start_Timer();
	pass;
 
func _on_Minutes_5_Button_pressed(): 
	print("Buttons: _on_Minutes_5_Button_pressed (start): minutes: ",Global.minutes);
	Global.minutes = 5; 
	_on_tick(); 
	pass;
	
func _on_Minutes_10_Button_pressed():
	Global.minutes = 10;      
	_on_tick(); 
	pass;
	
func _on_Minutes_15_Button_pressed():
	Global.minutes = 15;     
	_on_tick(); 
	pass;
	
func _on_Minutes_20_Button_pressed():
	Global.minutes = 20;      
	_on_tick(); 
	pass;
	
func _on_Minutes_30_Button_pressed():
	Global.minutes = 30;    
	_on_tick(); 
	pass;
	
func _on_Minutes_45_Button_pressed():
	Global.minutes = 45;    
	_on_tick(); 
	pass;
	
func _on_Minutes_60_Button_pressed():
	Global.minutes = 60;    
	_on_tick(); 
	pass; 
 

func _on_QuitButton_pressed():
	get_tree().quit();
	pass # Replace with function body.
