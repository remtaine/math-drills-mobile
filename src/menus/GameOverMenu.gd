class_name GameOverMenu
extends Control

var is_high_score = false

func _ready() -> void:
	var scores : Array = HighScores.high_scores
	for i in scores.size():
		print(Global.current_score, " vs ", scores[i]["score"])
		if Global.current_score > scores[i]["score"]:
			if i == 0: #meaning high score
				is_high_score = true
			var temp = {"name" : "XYZ", "score" : Global.current_score}
			scores.insert(i, temp)
			scores.pop_back()
			break
	
	if is_high_score:
		$Main/HighScore.visible = true
		$Main/NormalScore.visible = false
	else:
		$Main/HighScore.visible = false
		$Main/NormalScore.visible = true

	HighScores.high_scores = scores
	HighScores.save_scores()
	HighScores.emit_signal("scores_updated")
