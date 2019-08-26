extends Control

var type
onready var ProgressBar = $ProgressBar

func set_type(type):
	self.type = type
	set_value(3)
	get_node("TextureRect").texture = load("res://images/Interface/"+type.key+"-icone.png")
	
func set_value(value):
	ProgressBar.value = value
	if value <= 0 && type.key == Global.OrcamentoGeral:
		Global.create_generic_dialog("Você perdeu", 
		"Texto explicando que o jogador conseguiu falir a cidade","prefeito",load("res://audios/Pegar Item - Animacao Comemoracao.ogg"),  Global, "game_over")
	
	var my_parent = get_parent().get_parent()
	if value <= 1 && my_parent == Global.barras_de_necessidade:
		Global.create_generic_dialog("Você perdeu", 
		"Texto explicando que o jogador sofreu um impeachment por insatisfação em "+type.key,"prefeito", load("res://audios/Pegar Item - Animacao Comemoracao.ogg"), Global, "game_over")
		
func get_value():
	return ProgressBar.value