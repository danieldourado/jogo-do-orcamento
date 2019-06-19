extends TextureButton

var new_building = null;
var texture_rect = null;
var can_build = true;
var built = false;

func _ready():
	$"Area2D".connect("area_entered", self, "_area_entered")
	$"Area2D".connect("area_exited", self, "_area_exited")
	get_node("/root/Node2D/Button").connect("pressed", self, "_pressed")
	
	
func _area_entered (body):
	modulate = Color(1, 0, 0)
	can_build = false
	
func _area_exited (body):
	modulate = Color(1, 1, 1)
	can_build = true
	
func _process(delta):
	if built: return
	var ct = get_node("/root/Node2D/ConstructionTiles")
	var _position = ct.get_local_mouse_position()
	_position.x = int(_position.x/ ct.cell_size.x)*ct.cell_size.x - rect_size.x
	_position.y = int(_position.y/ ct.cell_size.y)*ct.cell_size.y - rect_size.y
	
	rect_position = _position
	print(_position)
	
func set_ghost_texture(texture):
	texture_normal = texture

func _pressed():
	if !can_build: return
	built = true
	get_node("/root/Node2D/Button").disconnect("pressed", self, "_pressed")
	