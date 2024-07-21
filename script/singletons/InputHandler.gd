extends Node

var viewport: Viewport

func _ready() -> void:
	# Get the handle to the viewport for input processing
	viewport = get_viewport()
	
func _unhandled_input(event) -> void:
	if (event.is_action_pressed("ui_accept")):
		SignalBus.emit_signal("interact_with_object")
	
	# Sets this event as handled to prevent further processing
	viewport.set_input_as_handled()
		
