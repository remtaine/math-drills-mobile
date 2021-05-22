class_name EquationHandler
extends HBoxContainer

signal equation_set(answer, operation)

var answer := 144
var operation := "x"
var num_ceil := 9
var num_flr := 2

func _ready() -> void:
	setup_equation()


func setup_equation(make_new_equation := true) -> void:
	#TODO add #s and shiz
	if make_new_equation:
		randomize()
		var a = answer
		var b = 1
		var times = 0
		while answer == a * b or times > 3:
			a = randi() % (num_ceil-num_flr) + num_flr
			b = randi() % (num_ceil-num_flr) + num_flr
			
			times += 1
			
		$Num1.text = String(a)
		$Symbol.text = operation
		$Num2.text = String(b)
		answer = a * b
		
	emit_signal("equation_set", answer, operation)


func _on_Choices_next_equation() -> void:
	setup_equation()


func _on_Score_level_up() -> void:
#	num_flr += 1
	num_ceil += 1
	if num_ceil % 3 == 0:
		num_flr += 1
	print("nums go from ", num_flr, " to ", num_ceil, " now")
