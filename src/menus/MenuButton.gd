extends Button

var default_scale

func _ready() -> void:
	default_scale = rect_scale
	var _error = self.connect("mouse_entered", self, "_on_mouse_entered")
	_error = self.connect("mouse_exited", self, "_on_mouse_exited")
	rect_pivot_offset = (rect_size/2)# * rect_scale

func _on_mouse_entered() -> void:
	rect_scale = Vector2.ONE * 1.2
 

func _on_mouse_exited() -> void:
	rect_scale = default_scale
