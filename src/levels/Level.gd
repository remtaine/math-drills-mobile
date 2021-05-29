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
	var _error = get_tree().change_scene(game_over_path)


func _on_PauseButton_pressed() -> void:
	$Audio/Theme.stream_paused = true
	$Main/Question/TimerBar.set_process(false)
	$Blackboard/AnimationPlayer.play("1to2")


func _on_Back_pressed() -> void:
	$Audio/Theme.stream_paused = false
	$Blackboard/AnimationPlayer.play("2to1")


func _on_Menu_pressed() -> void:
	var _status = get_tree().change_scene(menu_path)


func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	if anim_name == "2to1":
		$Main/Question/TimerBar.set_process(true)
