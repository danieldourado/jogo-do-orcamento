extends Control

var type
onready var ProgressBar = $ProgressBar

func set_type(type):
	self.type = type
	set_value(3)
	
func set_value(value):
	ProgressBar.value = value
	
func get_value():
	return ProgressBar.value