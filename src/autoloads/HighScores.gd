extends Node

var file_high_scores = "user://high_scores.txt"
var high_scores setget set_high_scores

signal scores_updated


func _ready() -> void:
	load_scores()
	
	
func save_scores() -> void:
	var file = File.new()
	file.open(file_high_scores, File.WRITE)
	file.store_var(high_scores)
	file.close()
	
	
func load_scores() -> void:
	var file = File.new()
	if file.file_exists(file_high_scores):
		file.open(file_high_scores, File.READ)
		high_scores = file.get_var()
		file.close()
	else:
		high_scores = [
		{"name": "AAA", "score" : 0}, 
		{"name": "BBB", "score" : 0}, 
		{"name": "CCC", "score" : 0}, 
		{"name": "DDD", "score" : 0}, 
		{"name": "EEE", "score" : 0}, ]


func set_high_scores(value) -> void:
	high_scores = value
	
