extends Sprite

var to_get_removed
var random = true

func _ready():
	arrange_z_index()
	get_random_texture()
	
func arrange_z_index():
	z_index = int(get_global_transform().origin.y/10)+1000
	print(z_index)
	
func get_random_texture():
	if Global.get_random(10) == 9:
		to_get_removed = true
		return
		
	if texture.get_height() > 96*2-10:
		var index = Global.get_random(Global.random_textures2x2.size())
		texture = load("res://images/"+Global.random_textures2x2[index]+".png")
		position.y = position.y + texture.get_height()/2*-1
		position.y = position.y +96
	else:
		var index = Global.get_random(Global.random_textures1x1.size())
		texture = load("res://images/"+Global.random_textures1x1[index]+".png")
		position.y = position.y + texture.get_height()/2*-1
		position.y = position.y +96-31
func _process(delta):
	if random == false:
		return
	if to_get_removed:
		get_parent().remove_child(self)
		to_get_removed = false
		
func set_not_random():
	random = false