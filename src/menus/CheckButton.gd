class_name CheckMenuButton
extends "res://src/menus/MenuButton.gd"


func _ready() -> void:
#	self.text = "[  ]"
	var _error = self.connect("toggled", self, "check")
	if pressed:
		self.text = "[|]"
	print(self.name.right(self.name.length() - 1))

func check(_val) -> void:
	if self.text == "[ ]":
		self.text = "[|]"
		
	elif self.text == "[|]":
		if get_parent().has_method("get_checked_count") and get_parent().get_checked_count() <= 1:
			return
		self.text = "[ ]"
