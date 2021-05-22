class_name ButtonsHandler
extends VBoxContainer

signal move_board(v)
signal button_pressed(name)

export var game_path := "res://src/levels/Level.tscn"
func _ready() -> void:
	pass


func _on_Start_pressed() -> void:
	get_tree().change_scene(game_path)


func _on_Instructions_pressed() -> void:
	emit_signal("move_board", Vector2.RIGHT)
	emit_signal("button_pressed", "Instructions")

func _on_Credits_pressed() -> void:
	emit_signal("move_board", Vector2.RIGHT)
	emit_signal("button_pressed", "Credits")
		
