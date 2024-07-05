extends ColorRect

@onready var main = $"../../"

func _process(delta):
	pass

func _on_resume_pressed():
	main.pauseMenu()

func _on_quit_pressed():
	main.pauseMenu()
	get_tree().quit()

func _on_main_menu_pressed():
	main.pauseMenu()
	get_tree().change_scene_to_file("res://game/MainMenu.tscn")
