extends Control

# warning-ignore:unused_class_variable
var new_building = null;
# warning-ignore:unused_class_variable
var texture_rect = null;
var can_build = true;
var built = false;
var building_name
# warning-ignore:unused_class_variable
var not_buildable_this_frame
var construction_texture_name
var texture_cell_size = 1

func _ready():
# warning-ignore:return_value_discarded
	$"StaticConstruction/TileShape".connect("area_entered", self, "_area_entered")
# warning-ignore:return_value_discarded
	$"StaticConstruction/TileShape".connect("area_exited", self, "_area_exited")
	$"StaticConstruction".set_not_random()
# warning-ignore:return_value_discarded
	get_node("TextureButton").connect("pressed", self, "_pressed")

# warning-ignore:unused_argument
func _area_entered (body):
	modulate = Color(1, 0, 0)
	can_build = false
	
# warning-ignore:unused_argument
func _area_exited (body):
	modulate = Color(1, 1, 1)
	can_build = true
	
func get_y_offset():
	var ct = get_node("/root/Node2D/ConstructionTiles")
	return ct.cell_size.y - $"StaticConstruction".rect_size.y
	

# warning-ignore:unused_argument
func _process(delta):
	if built: return
	
	
	var ct = get_node("/root/Node2D/ConstructionTiles")
	var cell_index = ct.world_to_map(ct.get_local_mouse_position())
	var _position = ct.map_to_world(cell_index)
	_position.y = _position.y + ct.cell_size.y
	rect_position = _position
	
	if is_texture_is_over_not_buildable_tile(cell_index, ct) || $"StaticConstruction/TileShape".get_overlapping_areas().size() != 0:
		set_not_buildable()
	else:
		set_buildable()
	get_node("StaticConstruction").arrange_z_index()

func set_ghost_texture(texture):
	var texture_height = texture.get_height()
	
	$"StaticConstruction".texture = texture
	$"StaticConstruction".position.y = texture_height/2*-1
	$"StaticConstruction".adjust_tileshape_position(texture.get_height(), $"StaticConstruction".get_node("TileShape"))

func _pressed():
	if !can_build: return
	built = true
	Global.play_sound(load("res://audios/Construindo.ogg"))
	get_node("TextureButton").disconnect("pressed", self, "_pressed")
	Global.construction_menu.remove_building(construction_texture_name)
	
func set_name(new_name):
	building_name = new_name
	
func set_not_buildable():
	$"StaticConstruction".modulate = Color(1, 0, 0)
	can_build = false
	
func set_buildable():
	$"StaticConstruction".modulate = Color(1, 1, 1)
	can_build = true

func is_texture_is_over_not_buildable_tile(cell_index, ct):
	if get_texture_cell_size() == 1:
		var cell_id = ct.get_cell(cell_index.x, cell_index.y)
		return (cell_id != 15) and (cell_id != 36)
		
	if get_texture_cell_size() == 2:
		var cell_ids = []
		cell_ids.append(ct.get_cell(cell_index.x, cell_index.y))
		cell_ids.append(ct.get_cell(cell_index.x-1, cell_index.y))
		cell_ids.append(ct.get_cell(cell_index.x, cell_index.y-1))
		cell_ids.append(ct.get_cell(cell_index.x-1, cell_index.y-1))
		
		for temp_cell_id in cell_ids:
			if (temp_cell_id != 15) and (temp_cell_id != 36):
				return true
		return false
		
func get_texture_cell_size():
	return $"StaticConstruction".texture.get_width() / Global.one_by_one_size
	

	