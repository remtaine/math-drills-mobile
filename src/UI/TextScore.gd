extends Label

export var score := 0

signal level_up


func _ready() -> void:
	set_score_text()

func set_score_text() -> void:
	text = "Score: \n " + String(score)
	
	
func _on_Choices_next_equation() -> void:
	score += 1
	Global.current_score = score
	
	if score % 10 == 0:
		emit_signal("level_up")
	set_score_text()
