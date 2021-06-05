class_name EquationHandler
extends HBoxContainer

signal equation_set(answer, operation)

const OPERATIONS = {
	"add" : "+",
	"subtract" : "-",
	"mutiply" : "x",
	"divide" : "/",
		
}
var answer := 144
var operation : String = OPERATIONS.mutiply
var num_ceil := [12,12,9,9]
var num_flr := [6,6,2,3]

func _ready() -> void:
	setup_equation()


func setup_equation(make_new_equation := true) -> void:
	#TODO add #s and shiz
	if make_new_equation:
		randomize()
		var a
		var b
		var c
		var times = 0
		
		var chosen_op := randi() % 4
		match chosen_op:
			0: #ie add
				operation = OPERATIONS.add
				a = answer
				b = 0
				while answer == a + b or times > 3:
					a = randi() % (num_ceil[chosen_op]-num_flr[chosen_op]) + num_flr[chosen_op]
					b = randi() % (num_ceil[chosen_op]-num_flr[chosen_op]) + num_flr[chosen_op]
					
					times += 1
					
				answer = a + b
			1: #ie subtract
				operation = OPERATIONS.subtract
				a = answer
				b = 0
				while answer == a + b or times > 3:
					a = randi() % (num_ceil[chosen_op]-num_flr[chosen_op]) + num_flr[chosen_op]
					b = randi() % (num_ceil[chosen_op]-num_flr[chosen_op]) + num_flr[chosen_op]
					
					times += 1
					
				answer = a + b
				c = a
				a = answer
				answer = c
			2: #ie multiply
				operation = OPERATIONS.mutiply
				a = answer
				b = 1
				while answer == a * b or times > 3:
					a = randi() % (num_ceil[chosen_op]-num_flr[chosen_op]) + num_flr[chosen_op]
					b = randi() % (num_ceil[chosen_op]-num_flr[chosen_op]) + num_flr[chosen_op]
					
					times += 1
					
				answer = a * b
			3: #ie divide
				operation = OPERATIONS.divide
				a = answer
				b = 1
				while answer == a * b or times > 3:
					a = randi() % (num_ceil[chosen_op]-num_flr[chosen_op]) + num_flr[chosen_op]
					b = randi() % (num_ceil[chosen_op]-num_flr[chosen_op]) + num_flr[chosen_op]
					
					times += 1
					
				answer = a * b
				c = a
				a = answer
				answer = c
				
		$Num1.text = String(a)
		$Symbol.text = " " + operation + " "
		$Num2.text = String(b)
		
	emit_signal("equation_set", answer, operation)


func _on_Choices_next_equation() -> void:
	setup_equation()


func _on_Score_level_up() -> void:
#	num_flr += 1
	
	#addition
	num_ceil[0] += 5
	if num_ceil[0] % 3 == 0:
		num_flr[0] += 2
		
	#subtraction
	num_ceil[1] += 5
	if num_ceil[1] % 3 == 0:
		num_flr[1] += 2
		
	#multiplication
	num_ceil[2] += 1
	if num_ceil[2] % 3 == 0:
		num_flr[2] += 1

	#division
	num_ceil[3] += 1
	if num_ceil[3] % 3 == 0:
		num_flr[3] += 1
