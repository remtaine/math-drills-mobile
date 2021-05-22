class_name Level
extends Node

export var menu_path := "res://src/menus/MainMenu.tscn"
export var game_over_path := "res://src/menus/GameOverMenu.tscn"


func _ready():
	Global.current_score = 0

func _unhandled_input(event):
	if event.is_action_pressed("reset"):
		var _status = get_tree().reload_current_scene()
	elif event.is_action_pressed("menu") and menu_path != "":
		var _status = get_tree().change_scene(menu_path)


func _on_TimerBar_times_up() -> void:
	get_tree().change_scene(game_over_path)
