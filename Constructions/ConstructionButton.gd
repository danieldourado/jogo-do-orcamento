extends VBoxContainer


func set_construction_button(construction_name):
	get_node("Texture").texture_normal = load("res://images/"+construction_name+".png")
	get_node("BuildingName").text = construction_name

func _on_Texture_pressed():
	var construction_ghost = load("res://Constructions/Construction.tscn").instance()
	get_node("/root").add_child(construction_ghost)
	construction_ghost.set_ghost_texture(get_node("Texture").texture_normal)
	construction_ghost.set_name(get_name())

func get_name():
	return get_node("BuildingName").text