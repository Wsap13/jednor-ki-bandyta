extends Node
var tween : Tween
var clicked = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_2_pressed():
	if clicked:
		tween = create_tween()
		tween.tween_property($"Zakładka", "position:x", 1344, 0.5)
		$"Zakładka/Button".hide()
	else: 
		tween = create_tween()
		tween.tween_property($"Zakładka", "position:x", 998, 0.5)
		$"Zakładka/Button".show()
	clicked = ! clicked


func _on_button_pressed():
	tween = create_tween()
	tween.tween_property($"Zakładka", "position:x", 1344, 0.5)
	$"Zakładka/Button".hide()
	clicked = ! clicked


