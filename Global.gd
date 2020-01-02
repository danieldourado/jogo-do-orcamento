extends Node

var categories = ['Saúde','Segurança','Educação','Mobilidade','Lazer']
var OrcamentoGeral = "OrcamentoGeral"

var random_textures1x1 = ["Camada 12","Camada 13","Camada 20","Camada 49","Camada 55","Camada 56" ]
var random_textures2x2 = ["Camada 6 copiar","Camada 7","Camada 18","Camada 25","Camada 26",
"Camada 27","Camada 28","Camada 29","Camada 30","Camada 45","Camada 46","Camada 27",
"Camada 48","Camada 52","Camada 53","Camada 27","Camada 57","Camada 58","Camada 59",
"Camada 60","Camada 61","Camada 66","Camada 27","PREDINHO_01","PREDINHO_02","PREDIO_03" ]
var random_textures3x3 = ["PREFEITURA_PLENAROPOLIS","LOJA"]


var max_rounds = 4
var decisions_per_round = 4

var game_data = {}
var dialogs = {}
var barras_de_necessidade
var barras_de_orcamento
var barras_de_orcamento_geral
var construction_menu
var gameplay
var orcamento = {}
var planejamento_financeiro
var max_value = 130000

var one_by_one_size = 192
var two_by_two_size = 192*2
var three_by_two_size = 192*3

var one_by_one_size_height = 192/2
var two_by_two_size_height = 192

func _ready():
	var json_file_adress = "res://Dialogs/dialogs.json"
	var file = File.new();
	var DADOS = ""

	file.open(json_file_adress, File.READ)

	var temp_data
	while(!file.eof_reached()):
		temp_data = file.get_line()
		if temp_data != null:
			DADOS = DADOS + temp_data
        
	game_data = parse_json(DADOS)[0]

	file.close();
	
func reset():
	categories = ['Saúde','Segurança','Educação','Mobilidade','Lazer']

func game_over():
	get_tree().change_scene("res://MainMenu.tscn")
	reset()


func create_generic_dialog(title, text, image, sound, caller_node = null, callback_function = null, parent = null):
	Global.play_sound(sound)
	var new_dialog = load("res://DialogNewBuilding.tscn").instance()
	new_dialog.set_dialog(title, title,text,image,caller_node,callback_function)
	if parent:
		parent.add_child(new_dialog)
	else:
		gameplay.get_parent().get_node("CanvasLayer").add_child(new_dialog)
		
func get_json(file_address):
	var file = File.new()
	file.open(file_address, file.READ)
	var text = file.get_as_text()
	file.close()
	return parse_json(text)[0]
func get_random(to):
	randomize()
	return randi()%to
	
func play_sound(stream, volume = 0):
	var new_audio_stream = AudioStreamPlayer.new()
	add_child(new_audio_stream)
	new_audio_stream.volume_db = volume
	new_audio_stream.stream = stream
	new_audio_stream.play()