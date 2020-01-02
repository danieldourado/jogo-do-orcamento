extends VBoxContainer

var construction_texture_name
var amount = 1

func set_construction_button(construction_name, construction_texture_name):
	self.construction_texture_name = construction_texture_name
	get_node("Texture").texture_normal = load("res://images/"+construction_texture_name+".png")
	get_node("BuildingName").text = construction_name

func _on_Texture_pressed():
	clear_pendin_construction()
	var construction_ghost = load("res://Constructions/NewConstruction.tscn").instance()
	construction_ghost.construction_texture_name = construction_texture_name
	get_node("/root/Node2D/GameplayControl/PlayerConstructions").add_child(construction_ghost)
	construction_ghost.set_ghost_texture(get_node("Texture").texture_normal)
	construction_ghost.set_name(get_name())

func get_name():
	return get_node("BuildingName").text

func add_to_counter():
	var amount = int(get_node("counter/counter-label").text)+1
	self.amount = amount
	get_node("counter/counter-label").text = str(amount)

func decrease_counter():
	var amount = int(get_node("counter/counter-label").text)-1
	self.amount = amount
	get_node("counter/counter-label").text = str(amount)
	
func clear_pendin_construction():
	for construction in get_node("/root/Node2D/GameplayControl/PlayerConstructions").get_children():
		if construction.built == false:
			get_node("/root/Node2D/GameplayControl/PlayerConstructions").remove_child(construction)