extends Node2D

var paused = false
var over = false
@onready var pause_menu = $CanvasLayer/Pause
var won = 0
func unpause():
	get_tree().paused = false
	$CanvasLayer/Pause.show()
	
func pause():
	get_tree().paused = true
	$CanvasLayer/Pause.hide()
	

func checkPaylines():
	won = 0
	var paylines = [
		[Utilities.rell_1[0], Utilities.rell_2[0], Utilities.rell_3[0]],
		[Utilities.rell_1[1], Utilities.rell_2[1], Utilities.rell_3[1]],
		[Utilities.rell_1[2], Utilities.rell_2[2], Utilities.rell_3[2]],
		
		[Utilities.rell_1[0], Utilities.rell_2[1], Utilities.rell_3[2]],
		[Utilities.rell_1[2], Utilities.rell_2[1], Utilities.rell_3[0]],
	]
	var nodes = [
		[Utilities.symbol_nodes1[0], Utilities.symbol_nodes2[0], Utilities.symbol_nodes3[0]],
		[Utilities.symbol_nodes1[1], Utilities.symbol_nodes2[1], Utilities.symbol_nodes3[1]],
		[Utilities.symbol_nodes1[2], Utilities.symbol_nodes2[2], Utilities.symbol_nodes3[2]],
		
		[Utilities.symbol_nodes1[0], Utilities.symbol_nodes2[1], Utilities.symbol_nodes3[2]],
		[Utilities.symbol_nodes1[2], Utilities.symbol_nodes2[1], Utilities.symbol_nodes3[0]]
	]

	for i in range(len(paylines)):
		if checkLine(paylines[i]):
			var lineScore = 100 + Utilities.bet * Utilities.diff
			var symbolMultiplier = 1.0

			for symbol in paylines[i]:
				if symbol in SymbolData.symbolMultipliers:
					symbolMultiplier = SymbolData.symbolMultipliers[symbol]

			lineScore *= symbolMultiplier
			var win = Utilities.bet * symbolMultiplier * Utilities.diff
			print(Utilities.diff)
			Utilities.SCORE += lineScore
			Utilities.MONEY += win
			won += win
			for j in range(len(paylines[i])):
				var tween = create_tween().set_loops(3)
				tween.tween_property(nodes[i][j], "scale", Vector2(1.07, 1.07), 1.0)
				tween.tween_interval(0.5)
				tween.tween_property(nodes[i][j], "scale", Vector2(1., 1.), 1.0)
				tween.tween_interval(0.5)
				$Win.play()
	Utilities.bet = 0
	$CanvasLayer/Wining.text = "You won: " + str(won)
	
func checkLine(line):
	var firstSymbol = line[0]
	for i in range(1, len(line)):
		if line[i] != firstSymbol:
			return false
	return true


func _process(delta):
	if Input.is_action_just_pressed("pause"):
		pauseMenu()
		
	if not Utilities.isCodeExecuted:
		var r1 = $Control.is_animation_playing
		var r2 = $Control2.is_animation_playing
		var r3 = $Control3.is_animation_playing  # Poprawka: zmienione na Control3
		if r1 == false and r2 == false and r3 == false:
			checkPaylines()
			$Spin.stop()
			Utilities.isCodeExecuted = true
			if Utilities.MONEY == 0:
				over = true
				$CanvasLayer/ColorRect.show()
				

func pauseMenu():
	if paused:
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 0
	paused = !paused

func _on_button_button_down():
	Utilities.isCodeExecuted = false
	$Spin.play()
