extends Control


var menu_path := "res://src/menus/MainMenu.tscn"
func _ready() -> void:
	pass


func move_board(v) -> void:
	if v == Vector2.RIGHT:
		$Blackboard/AnimationPlayer.play("1to2")
	else:
		$Blackboard/AnimationPlayer.play_backwards("1to2")
		

func _unhandled_input(event):
	if event.is_action_pressed("reset"):
		var _status = get_tree().reload_current_scene()
	elif event.is_action_pressed("menu") and menu_path != "":
		var _status = get_tree().change_scene(menu_path)
