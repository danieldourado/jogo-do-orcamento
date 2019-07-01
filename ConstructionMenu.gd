extends HBoxContainer

export(Array, PackedScene) var construction_buttons

var buildings = [];

func _ready():
	Global.construction_menu = self
		
func add_building(building_name):
	var new_building = load("res://Constructions/ConstructionButton.tscn").instance()
	new_building.set_construction_button(building_name)
	add_child(new_building)
	buildings.append(new_building)

func remove_building(building_name):
	for building in buildings:
		if building.get_name() == building_name:
			remove_child(building)
			buildings.remove(buildings.find(building))
	if(buildings.size() == 0):
		Global.gameplay.advance_round()