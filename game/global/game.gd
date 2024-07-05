extends Node


const SAVE_PATH = "res://savegame.bin"
var leader_board = []
var leader_board2 = []
var position = 0
var text
var text2
var continueGame = false
#@onready var leaderboard_scene = preload("res://addons/silent_wolf/Scores/Leaderboard.tscn")
func saveScore():
	await SilentWolf.Scores.save_score(Utilities.NAME, Utilities.SCORE)
	get_tree().create_timer(3).timeout.connect(loadScore)
	get_tree().create_timer(3).timeout.connect(loadPosition)
	

func loadScore():
	var sw_result = await SilentWolf.Scores.get_scores().sw_get_scores_complete
	var scores = sw_result.scores
	var i = 1
	var result_text = ""
	for score in scores:
		var place = str(i) + ". " + str(score.player_name) + " : " + str(score.score)
		result_text += place + "\n"
		i += 1
	text2 = result_text
	
func loadFullScore():
	var sw_result1 = await SilentWolf.Scores.get_scores(0).sw_get_scores_complete
	var scores = sw_result1.scores
	var i = 1
	var result_text = ""
	for score in scores:
		var place = str(i) + ". " + str(score.player_name) + " : " + str(score.score)
		result_text += place + "\n"
		i += 1
	text = result_text
	
	
func loadPosition():
	var sw_result = await SilentWolf.Scores.get_score_position(Utilities.SCORE).sw_get_position_complete
	position = sw_result.position - 1
