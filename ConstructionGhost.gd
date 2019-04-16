extends Area2D

var new_building = null;
var texture_rect = null;
var can_build = false;

func _ready():
	$".".connect("area_entered", self, "_area_entered")
	$".".connect("area_exited", self, "_area_exited")
	$"TextureRect".connect("pressed", self, "_pressed")
	texture_rect = get_node("TextureRect")
	
func _area_entered (body):
	texture_rect.modulate = Color(1, 0, 0)
	can_build = false
	
func _area_exited (body):
	texture_rect.modulate = Color(1, 1, 1)
	can_build = true
	
func _process(delta):
	var _position = get_viewport().get_mouse_position()
	$".".position = _position
		

func _pressed():
	if !can_build: return
	new_building = load("res://Construction.tscn").instance()
	get_node("/root").add_child(new_building)
	var position = get_viewport().get_mouse_position()
	new_building.rect_position.x = position.x
	new_building.rect_position.y = position.y
	get_node("/root").remove_child(self)