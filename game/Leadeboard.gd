extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Game.loadScore()
	var sw_result = await SilentWolf.Scores.get_scores(0).sw_get_scores_complete
	var scores = sw_result.scores
	var i = 1
	var result_text = ""
	
	for score in scores:
		var place = str(i) + ". " + str(score.player_name) + " : " + str(score.score)
		result_text += place + "\n"
		i += 1

	$CenterContainer/ScrollContainer/Label.set_text(result_text)
