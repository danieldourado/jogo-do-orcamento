extends Node

var categories = []
var game_data = {}
var dialogs = {}

func _ready():
	game_data = get_json("res://Dialogs/dialogs.json")

	
func get_json(file_address):
	var file = File.new()
	file.open(file_address, file.READ)
	var text = file.get_as_text()
	file.close()
	return parse_json(text)[0]
func get_random(to):
	randomize()
	return randi()%to