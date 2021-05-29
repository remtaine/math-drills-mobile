extends HBoxContainer


func _ready() -> void:
	pass

func get_checked_count() -> int:
	var num = 0
	for button in get_children():
		if button.text == "[|]":
			num += 1
	return num
