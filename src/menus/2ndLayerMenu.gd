extends Control

signal move_board(v)

func _ready() -> void:
	pass


func _on_Buttons_button_pressed(name) -> void:
	if name == "Instructions":
		$Instructions.visible = true
		$Credits.visible = false
	elif name == "Credits":
		$Instructions.visible = false
		$Credits.visible = true


func _on_Back_pressed() -> void:
	emit_signal("move_board", Vector2.LEFT)
