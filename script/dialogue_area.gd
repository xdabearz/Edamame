extends Area2D

@export var text_key: String = ""
var area_active: bool = false

func _input(event):
	if area_active and event.is_action_pressed("ui_accept"):
		SignalBus.emit_signal("display_dialogue", text_key)

func _on_area_entered(area):
	print("area entered!")
	area_active = true


func _on_area_exited(area):
	print("area exited")
	area_active = false
