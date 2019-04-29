extends TileMap

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _get_tile_position():
	var mouse_pos = get_viewport().get_mouse_position()
	var loc = world_to_map(mouse_pos)
	return map_to_world(loc)