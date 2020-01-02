extends "../SpriteZIndexOrdered.gd"

var to_get_removed
var random = true

var one_by_one_size = 192
var two_by_two_size = 192*2
var three_by_two_size = 192*3

var one_by_one_size_height = one_by_one_size/2
var two_by_two_size_height = one_by_one_size



func _ready():
	get_random_texture()
	
func get_random_texture():
	if Global.get_random(10) == 9:
		to_get_removed = true
		return
		
	if texture.get_height() == three_by_two_size:
		var index = Global.get_random(Global.random_textures2x2.size())
		texture = load("res://images/"+Global.random_textures2x2[index]+".png")
		position.y = position.y + texture.get_height()/2*-1
		position.y = position.y +96
	if texture.get_width() == two_by_two_size:
		var index = Global.get_random(Global.random_textures2x2.size())
		texture = load("res://images/"+Global.random_textures2x2[index]+".png")
		position.y = position.y + texture.get_height()/2*-1
		position.y = position.y +96
		
	elif texture.get_width() == one_by_one_size:
		var index = Global.get_random(Global.random_textures1x1.size())
		texture = load("res://images/"+Global.random_textures1x1[index]+".png")
		position.y = position.y + texture.get_height()/2*-1
		position.y = position.y +96-31
	 
	adjust_tileshape_position(texture.get_height(), get_node("TileShape"))
		
func _process(delta):
	if random == false:
		return
	if to_get_removed:
		get_parent().remove_child(self)
		to_get_removed = false
		
func set_not_random():
	random = false
	
func adjust_tileshape_position(texture_height, tile_shape):
	if texture_height < Global.two_by_two_size_height && texture_height > Global.one_by_one_size_height: 
		var tile_shape_y = (texture_height-Global.one_by_one_size_height)/2
		tile_shape.position = Vector2(0,tile_shape_y)
		tile_shape.scale = Vector2(4,2)	
	
	if texture_height > Global.two_by_two_size_height: 
		var tile_shape_y = (texture_height-Global.two_by_two_size_height)/2
		tile_shape.position = Vector2(0,tile_shape_y)
		tile_shape.scale = Vector2(10,6)	