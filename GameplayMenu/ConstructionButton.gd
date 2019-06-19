extends TextureButton

export(PackedScene) var construction

func _pressed():
	var construction_ghost = construction.instance()
	get_node("/root").add_child(construction_ghost)
	construction_ghost.set_ghost_texture(texture_normal)
	#var new_building = construction.instance()
	#get_node("/root").add_child(new_building)