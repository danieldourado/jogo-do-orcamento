extends Control

var new_building = null;
var texture_rect = null;
var can_build = true;
var built = false;
var building_name
var not_buildable_this_frame
var construction_texture_name

func _ready():
	$"StaticConstruction/TileShape".connect("area_entered", self, "_area_entered")
	$"StaticConstruction/TileShape".connect("area_exited", self, "_area_exited")
	$"StaticConstruction".set_not_random()
	get_node("TextureButton").connect("pressed", self, "_pressed")

func _area_entered (body):
	modulate = Color(1, 0, 0)
	can_build = false
	
func _area_exited (body):
	modulate = Color(1, 1, 1)
	can_build = true
	
func get_y_offset():
	var ct = get_node("/root/Node2D/ConstructionTiles")
	return ct.cell_size.y - $"StaticConstruction".rect_size.y
	

func _process(delta):
	if built: return
	var ct = get_node("/root/Node2D/ConstructionTiles")
	var cell_index = ct.world_to_map(ct.get_local_mouse_position())
	var _position = ct.map_to_world(cell_index)
	_position.y = _position.y + ct.cell_size.y
	rect_position = _position
	var cell_id = ct.get_cell(cell_index.x, cell_index.y)
	if cell_id != 15 || $"StaticConstruction/TileShape".get_overlapping_areas().size() != 0:
		set_not_buildable()
	else:
		set_buildable()
	get_node("StaticConstruction").arrange_z_index()

func set_ghost_texture(texture):
	$"StaticConstruction".texture = texture
	$"StaticConstruction".position.y = texture.get_height()/2*-1
	#if texture.get_height() > 96*2-10 && texture.get_height() < 96*2+10: 
	if texture.get_height() > 96*2-10: 
		$"StaticConstruction".get_node("TileShape").scale = Vector2(3,2)
		$"StaticConstruction".get_node("TileShape").position = Vector2(-266,-89)

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
	