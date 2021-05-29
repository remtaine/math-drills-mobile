class_name SecondLayerMenu
extends Control

signal move_board(v)

func _ready() -> void:
	pass


func _on_Buttons_button_pressed(name) -> void:
	for menu in get_children():
		menu.visible = false
	get_node(name).visible = true
#	if name == "Instructions":
#		$Instructions.visible = true
##		$Credits.visible = false
#	elif name == "Credits":
##		$Instructions.visible = false
#		$Credits.visible = true
#	elif name == "HighScores":
#		$HighScores.visible = true
		

func _on_Back_pressed() -> void:
	emit_signal("move_board", Vector2.LEFT)
