extends Control

@onready var resolution_option_button = $Res_OptionButton
@onready var full_screen_check_box = $FullScreen_CheckBox


var Resolutions: Dictionary = {
	"3840x2160":Vector2i(3840,2160),
	"2560x1440":Vector2i(2560,1040),
	"1920x1080":Vector2i(1920,1080),
	"1366x768":Vector2i(1366,768),
	"1536x864":Vector2i(1536,864),
	"1280x720":Vector2i(1280,720),
	"1440x900":Vector2i(1440,900),
	"1600x900":Vector2i(1600,900),
	"1024x600":Vector2i(1024,600),
	"800x600":Vector2i(800,600),	
	}
	
func _ready():
	Add_Resolutions()
	Check_Variables()

func Add_Resolutions():
	var Current_Resolution = get_window().get_size()
	var ID = 0
	for i in Resolutions:
		resolution_option_button.add_item(i)
		if Resolutions[i] == Current_Resolution:
			resolution_option_button.select(ID)
		ID += 1	
		
func Check_Variables():
	var _window = get_window()
	var mode = _window.get_mode()
	if mode == Window.MODE_FULLSCREEN:
		full_screen_check_box.set_pressed_no_signal(true)

func Set_Resolution_text():
	var Resolution_Text = str(get_window().get_size().x) +"x"+str(get_window().get_size().y)
	resolution_option_button.set_text(Resolution_Text)


func _on_option_button_item_selected(index):
	get_window().set_mode(Window.MODE_WINDOWED)
	full_screen_check_box.button_pressed = false
	var ID = resolution_option_button.get_item_text(index)
	get_window().set_size(Resolutions[ID])
	Centre_Window()
	
func Centre_Window():
	var Centre_Screen = DisplayServer.screen_get_position()+DisplayServer.screen_get_size()/2
	var Window_Size = get_window().get_size_with_decorations()
	get_window().set_position(Centre_Screen-Window_Size/2)


func _on_full_screen_check_box_toggled(button_pressed):
	if button_pressed:
		get_window().set_mode(Window.MODE_FULLSCREEN)
		
	else:
		get_window().set_mode(Window.MODE_WINDOWED)
		resolution_option_button.select(5)
		Centre_Window()
	get_tree().create_timer(10).timeout.connect(Set_Resolution_text)





