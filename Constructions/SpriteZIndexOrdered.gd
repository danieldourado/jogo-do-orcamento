extends Sprite

func _ready():
	arrange_z_index()
	
func arrange_z_index():
	z_index = int(get_global_transform().origin.y/10)+1000
	print(z_index)