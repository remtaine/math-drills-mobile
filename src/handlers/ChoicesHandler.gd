class_name ChoicesHandler
extends Control

var spacing = 5

var answer := -1
var operation := "+"

signal next_equation
signal wrong_answer


func handle_click(value : int) -> void:
	if answer == value:
		emit_signal("next_equation")
	else:
		emit_signal("wrong_answer")

func _on_Choice1_pressed() -> void:
	handle_click(int($Choice1.text))


func _on_Choice2_pressed() -> void:
	handle_click(int($Choice2.text))


func _on_Choice3_pressed() -> void:
	handle_click(int($Choice3.text))


func _on_Choice4_pressed() -> void:
	handle_click(int($Choice4.text))


#where choices are created
func _on_EquationHandler_equation_set(a, o) -> void:
#	answer = a
#	operation = o
	change_choices_text(generate_choices(a, o))


func generate_choices(ans, o) -> Array:
	answer = ans
	randomize()
	var a = 0
	var b = []
	spacing = int(answer/5)
	if spacing <= 0:
		spacing = 2
#	match 3:
	match randi() % 4:
		0: # 1st is right
			b.append(answer)
			for i in 3:
				while true:
					a = answer + (randi() % ((i + 1) * spacing)) + 1
					if not a in b:
						b.append(a)
						break
		1:	#2nd is right
			b.append(answer - (randi() % spacing) - 1)
			b.append(answer)
			for i in 2:
				while true:
					a = answer + (randi() % ((i + 1) * spacing)) + 1
					if not a in b:
						b.append(a)
						break
		2: #3rd is right
			for i in 2:
				while true:
					a = answer - (randi() % ((i + 1) * spacing)) - 1
					if not a in b:
						b.append(a)
						break
			b.append(answer)
			b.append(answer + (randi() % spacing) + 1)
		3: #4th is right
			for i in 3:
				while true:
					a = answer - (randi() % ((i + 1) * spacing)) - 1
					if not a in b:
						b.append(a)
						break
			b.append(answer)
	return b

func change_choices_text(a: Array) -> void:
	var b = shuffle_list(a)
	$Choice1.text = String(b[0])
	$Choice2.text = String(b[1])
	$Choice3.text = String(b[2])
	$Choice4.text = String(b[3])


func shuffle_list(list) -> Array:
	var shuffled_list = [] 
	var index_list = range(list.size())
	for i in range(list.size()):
		var x = randi() % index_list.size()
		shuffled_list.append(list[index_list[x]])
		index_list.remove(x)
	return shuffled_list
