extends Button

func _input(event):
    if event is InputEventMouseButton:
        if event.is_pressed():  # Mouse button down.
            emit_signal("button_down")
        elif not event.is_pressed():  # Mouse button released.
            emit_signal("button_up")
