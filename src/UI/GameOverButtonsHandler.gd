extends "res://src/UI/ButtonsHandler.gd"

export var menu_path = "res://src/menus/MainMenu.tscn"

func _ready() -> void:
	$Score.text = "Score:\n" + String(Global.current_score)

func _on_Menu_pressed() -> void:
	var _error = get_tree().change_scene(menu_path)
