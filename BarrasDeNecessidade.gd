extends HBoxContainer

var barras = []

func _ready():
	pass # Replace with function body.
	var categories = load("res://Main.tscn").instance().get_categories()
	create_barras_de_necessidade(categories)
	add_constant_override("separation", 50)
	
	
func create_barras_de_necessidade(categories):
	for category in categories:
		var temp_barra = load("res://BarraDeNecessidade.tscn").instance()
		add_child(temp_barra)
		#temp_barra.change_label_name(category)
		barras.append(temp_barra)
		temp_barra.set_value(rand_range(1,101))