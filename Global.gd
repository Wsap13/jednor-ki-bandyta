extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	SilentWolf.configure({
	"api_key": "syLHF7M0ig2k7E6bl4MUslZD9yDqx0c73K2rTMDc",
	"game_id": "slot",
	"log_level": 1
  })
	SilentWolf.configure_scores({
	"open_scene_on_close": "res://scenes/MainPage.tscn"
  })

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
