extends "res://Barras.gd"


func _ready():
	Global.barras_de_orcamento = self
	
func create_barras_de_necessidade(categories):
	.create_barras_de_necessidade(categories)
	for barra in barras:
		var value = Global.orcamento[barra.type.key]
		var category = barra.type.key
		barra.ProgressBar.max_value = Global.orcamento[category]
		barra.set_value(value)
		