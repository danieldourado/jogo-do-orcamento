extends Control

var type
onready var ProgressBar = $ProgressBar

func set_type(type):
	self.type = type
	set_value(3)
	get_node("TextureRect").texture = load("res://images/Interface/"+type.key.substr(0,2)+"-icone.png")
	
func set_value(value):
	ProgressBar.value = value
	if value <= 0 && type.key == Global.OrcamentoGeral:
		Global.create_generic_dialog("FIM DE JOGO", 
		"Você estourou o orçamento! Os gastos anuais ultrapassaram o orçamento. A população está insatisfeita e exige explicações!","prefeito",load("res://audios/Pegar Item - Animacao Comemoracao.ogg"),  Global, "game_over")
	
	var my_parent = get_parent().get_parent()
	if value <= 1 && my_parent == Global.barras_de_necessidade:
		Global.create_generic_dialog("FIM DE JOGO", 
		"A falta de investimentos em "+type.key+" deixou a população muito insatisfeita!","prefeito", load("res://audios/Pegar Item - Animacao Comemoracao.ogg"), Global, "game_over")
		
func get_value():
	return ProgressBar.value