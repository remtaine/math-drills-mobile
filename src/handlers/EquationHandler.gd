class_name EquationHandler
extends HBoxContainer

signal equation_set(answer, operation)

var answer := 144
var operation := "x"
export var num_ceil := 15
export var num_flr := 5

func _ready() -> void:
	setup_equation()


func setup_equation(make_new_equation := true) -> void:
	#TODO add #s and shiz
	if make_new_equation:
		randomize()
		var a = randi() % (num_ceil-num_flr) + num_flr
		var b = randi() % (num_ceil-num_flr) + num_flr
		$Num1.text = String(a)
		$Symbol.text = operation
		$Num2.text = String(b)
		answer = a * b
		
	emit_signal("equation_set", answer, operation)


func _on_Choices_next_equation() -> void:
	setup_equation()
