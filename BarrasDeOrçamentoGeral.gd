extends "res://Barras.gd"

var category = {"key":"OrcamentoGeral"}

func _ready():
	Global.barras_de_orcamento_geral = self

func create_barras_de_necessidade(categories):
	var temp_barra = load("res://BarraDeNecessidade.tscn").instance()
	get_node("HBox").add_child(temp_barra)
	barras.append(temp_barra)
	temp_barra.set_type(category)
	temp_barra.ProgressBar.max_value = Global.max_value
	set_satisfacao(category.key, Global.max_value)