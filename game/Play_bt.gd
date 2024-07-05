extends Button

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var r1 = $"../../Control".is_animation_playing
	var r2 = $"../../Control2".is_animation_playing
	var r3 = $"../../Control3".is_animation_playing
	if r1 == false and r2 == false and r3 == false and Utilities.bet != 0:
		self.disabled = false
	else:
		self.disabled = true
