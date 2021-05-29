class_name GameOverMenu
extends Control

func _ready() -> void:
#	yield(get_node("Main/1stLayer/Buttons"), "ready")
	var scores : Array = HighScores.high_scores
	for i in scores.size():
		print(Global.current_score, " vs ", scores[i]["score"])
		if Global.current_score > scores[i]["score"]:
			if i == 0: #meaning high score
				$Main/HighScore.visible = true
				$Main/NormalScore.visible = false
			else:
				$Main/HighScore.visible = false
				$Main/NormalScore.visible = true
			var temp = {"name" : "XYZ", "score" : Global.current_score}
			scores.insert(i, temp)
			scores.pop_back()
			break
			
	HighScores.high_scores = scores
	HighScores.save_scores()
	HighScores.emit_signal("scores_updated")
