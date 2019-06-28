extends Node

var categories = ['Saúde','Segurança','Educação','Mobilidade','Lazer']

# Called when the node enters the scene tree for the first time.
func _ready():
	add_planejamento_financeiro()

func get_categories():
	return categories
	
func add_planejamento_financeiro():
	var planejamentoScene = load("res://PlanejamentoFinanceiro.tscn").instance()
	add_child(planejamentoScene)
	planejamentoScene.start(get_categories())