extends Control

signal new_game_pressed

func _on_NewGame_pressed():
	emit_signal("new_game_pressed")
	get_parent().remove_child(self)


func _on_Crditos_pressed():
	add_child(load("res://Credits.tscn").instance())
