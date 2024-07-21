extends Area2D

@export var text_key: String = ""
var area_active: bool = false

func _ready():
	# Set to receive interact signals
	SignalBus.connect("interact_with_object", Callable(self, "_on_interact"))

func _on_interact():
	# There's probably a better way to send signals to the specific object you
	# interact with, but for now have to check if this object is active
	if area_active:
		SignalBus.emit_signal("display_dialogue", text_key)

func _on_area_entered(area):
	print("area entered!")
	area_active = true


func _on_area_exited(area):
	print("area exited")
	area_active = false
