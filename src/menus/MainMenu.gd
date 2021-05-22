extends Control


func _ready() -> void:
	pass


func move_board(v) -> void:
	if v == Vector2.RIGHT:
		$Blackboard/AnimationPlayer.play("1to2")
	else:
		$Blackboard/AnimationPlayer.play_backwards("1to2")
		
