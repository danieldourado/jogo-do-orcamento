extends Control

var type 
var dialog_data
var caller_node
var callback_function

func set_dialog(type, title, text, texture, caller_node = null, callback_function = null):
	self.type = type
	self.caller_node = caller_node
	self.callback_function = callback_function
	
	get_node("9SliceBox/VBoxContainer/Label").text = title
	get_node("9SliceBox/VBoxContainer/Label2").text = text
	get_node("9SliceBox/TextureRect2").texture = load("res://images/"+texture+".png")

func remove_me_from_parent():
	if caller_node:
		caller_node.call(callback_function)
	get_parent().remove_child(get_node("."))
	

func _on_OKButton_pressed():
	remove_me_from_parent()
