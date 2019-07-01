extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	add_planejamento_financeiro()

	
func add_planejamento_financeiro():
	var planejamentoScene = load("res://PlanejamentoFinanceiro.tscn").instance()
	add_child(planejamentoScene)
	planejamentoScene.start(Global.categories)