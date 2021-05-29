class_name HighScoresMenu
extends VBoxContainer


onready var row_names = $Row/Names
onready var row_scores = $Row/Scores


func _ready() -> void:
#	yield(get_tree().root, "ready")
	update_scores()
	var _error = HighScores.connect("scores_updated", self, "update_scores")

func update_scores() -> void:
	var scores = HighScores.high_scores
	
	for i in range (scores.size()):
		row_names.get_node("Name" + String(i + 1)).text = scores[i]["name"]
		row_scores.get_node("Score" + String(i + 1)).text = String(scores[i]["score"])
