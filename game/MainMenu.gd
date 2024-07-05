extends Node2D

func _ready():
	pass

func _process(delta):
	pass

func _on_play_button_down():
	get_tree().change_scene_to_file("res://game/Reel.tscn")
	Utilities.MONEY = 200
	Utilities.SCORE = 0
	Utilities.symbols.clear()
	Utilities.symbols.append(preload("res://graphics/symbols/bell.png"))
	Utilities.symbols.append(preload("res://graphics/symbols/coin.png"))
	Utilities.symbols.append(preload("res://graphics/symbols/grape.png"))


func _on_quit_button_down():
	get_tree().quit()
