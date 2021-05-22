class_name TimerBar
extends TextureProgress

export var added_value := 10

signal times_up


func _ready() -> void:
	value = max_value


#func _physics_process(delta: float) -> void:
	
func reduce_time(v : int) -> void:
	if value <= 0:
		emit_signal("times_up")
	else:
		value -= v

func _on_Timer_timeout() -> void:
	reduce_time(1)


func _on_EquationHandler_equation_set(answer, operation) -> void:
	$Timer.start()
	value += added_value


func _on_Score_level_up() -> void:
	if $Timer.wait_time > 0.12:
		$Timer.wait_time -= 0.006
	elif $Timer.wait_time > 0.09:
		$Timer.wait_time -= 0.004
	elif $Timer.wait_time > 0.002:
		$Timer.wait_time -= 0.002
		
	print("WAIT TIME IS NOW ", $Timer.wait_time)

func _on_Choices_wrong_answer() -> void:
	reduce_time(10)
