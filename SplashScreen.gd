extends Control

signal splash_screen_closed

func _on_TextureButton_pressed():
	emit_signal("splash_screen_closed")
	get_parent().remove_child(self)
