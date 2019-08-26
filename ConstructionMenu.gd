extends Control

export(Array, PackedScene) var construction_buttons

var buildings = [];

func _ready():
	Global.construction_menu = self
		
func add_building(building_name, building_texture_name):	
	if has_building(building_texture_name):
		add_building_counter(building_texture_name)
		return
		
	var new_building = load("res://Constructions/ConstructionButton.tscn").instance()
	new_building.set_construction_button(building_name, building_texture_name)
	get_node("HBoxContainer").add_child(new_building)
	buildings.append(new_building)

func remove_building(building_name):
	for building in buildings:
		if building.construction_texture_name == building_name:
			building.decrease_counter()
			if building.amount <= 0:
				get_node("HBoxContainer").remove_child(building)
				buildings.remove(buildings.find(building))
				break
			
	if(buildings.size() == 0):
		Global.gameplay.fim_etapa_construcao()

func add_building_counter(building_texture_name):
	for building in buildings:
		if building.construction_texture_name == building_texture_name:
			building.add_to_counter()
	return false
	
func has_building(building_texture_name):
	for building in buildings:
		if building.construction_texture_name == building_texture_name:
			return true
	return false