class_name TimerBar
extends TextureProgress

export var added_value := 600
export var minus_per_second := 300
signal times_up


func _ready() -> void:
	value = max_value
	set_process(false)

func _process(delta: float) -> void:
	reduce_time(int(minus_per_second * delta))

	
func reduce_time(v : int) -> void:
	if value <= 0:
		emit_signal("times_up")
	else:
		value -= v


#func _on_Timer_timeout() -> void:
#	reduce_time(1)


func _on_EquationHandler_equation_set(_answer, _operation) -> void:
#	$Timer.start()
	value += added_value


func _on_Score_level_up() -> void:
	minus_per_second *= 1.05
		

func _on_Choices_wrong_answer() -> void:
	reduce_time(minus_per_second * 2)
