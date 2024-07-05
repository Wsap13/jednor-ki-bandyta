extends Control
var num_symbols = randi_range(100, 200)
var is_animation_playing = false
var symbol_nodes = [] 
var original_position = Vector2()  
func _ready():

	add_initial_symbols()
	original_position = position  
	
	
func add_initial_symbols():
	var num_initial_symbols = 3
	for i in range(num_initial_symbols):
		var symbol_texture = Utilities.symbols[randi() % Utilities.symbols.size()]
		var symbol_node = TextureRect.new()
		symbol_node.texture = symbol_texture
		symbol_node.size = Vector2(10, 10)
		symbol_node.position.y = -i * 900  
		add_child(symbol_node)

	
	
func add_random_symbols():
	Utilities.rell_1.clear()
	num_symbols = num_symbols + 25
	for symbol_node in symbol_nodes:
		symbol_node.queue_free()
	symbol_nodes.clear()
	Utilities.symbol_nodes1.clear()
	var tween = create_tween()
	var speed = randf_range(Utilities.speed1, Utilities.speed2)
	for i in range(num_symbols):
		var symbol_texture = Utilities.symbols[randi() % Utilities.symbols.size()]
		var symbol_node = TextureRect.new()
		symbol_node.texture = symbol_texture
		symbol_node.size = Vector2(10, 10)
		symbol_node.position.y = -i * 900
		add_child(symbol_node)
		symbol_nodes.append(symbol_node)
		if num_symbols - i <= 3:
			Utilities.symbol_nodes1.append(symbol_node)# z tego wyciagam nody
			Utilities.rell_1.append(symbol_texture.get_path().substr(symbol_texture.get_path().rfind('/')
		 + 1, symbol_texture.get_path().length()))
	is_animation_playing = true
	
	tween.tween_property(self, "position", original_position - Vector2(0,(-90 *(num_symbols-3))), speed)
	#tween.tween_property(self, "scale", Vector2(0.2,0.2), 2.0)
	#tween.tween_property(self, "scale", Vector2(0.1,0.1), 1.0)
	tween.tween_callback(self.set.bind("is_animation_playing",false))
	#print(num_symbols)
	#print("rell1: 0", Utilities.rell_1)
	#print("rell1: 0", Utilities.symbol_nodes1)
	
func _on_button_button_down():
	if is_animation_playing == false:
		Utilities.r1_is_animation_playing = false
	if 	Utilities.r1_is_animation_playing == false:
		add_random_symbols()
		
		
