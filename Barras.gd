extends Control

var barras = []

func _ready():
	create_barras_de_necessidade(Global.categories)
	get_node("HBox").add_constant_override("separation", 45)
	
	
func create_barras_de_necessidade(categories):
	for category in categories:
		var temp_barra = load("res://BarraDeNecessidade.tscn").instance()
		get_node("HBox").add_child(temp_barra)
		#temp_barra.change_label_name(category)
		barras.append(temp_barra)
		temp_barra.set_type(category)
		
func set_satisfacao(type, ammount):
	for barra in barras:
		if str(barra.type.key) == str(type):
			var barra_value = barra.get_value()
			barra.set_value(barra_value + ammount)