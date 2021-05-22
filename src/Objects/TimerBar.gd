class_name TimerBar
extends TextureProgress

export var added_value := 10

signal times_up


func _ready() -> void:
	value = max_value


#func _physics_process(delta: float) -> void:
	
func reduce_time(v : int) -> void:
	if value - v < 0:
		emit_signal("times_up")
	else:
		value -= v

func _on_Timer_timeout() -> void:
	reduce_time(1)


func _on_EquationHandler_equation_set(answer, operation) -> void:
	$Timer.start()
	value += added_value


func _on_Score_level_up() -> void:
	$Timer.wait_time -= 0.003
	print("WAIT TIME IS NOW ", $Timer.wait_time)

func _on_Choices_wrong_answer() -> void:
	reduce_time(10)
