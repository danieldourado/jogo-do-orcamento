extends Node2D

export (PackedScene) var Vehicle
onready var TimerNode = get_node("Timer")
export var time_for_each_car_to_complete = 10
export var time_between_car_spawn = 2
var textures_left_bottom = ["Camada 293", "Camada 298", "Camada 285", "Camada 303", "Camada 308", "Camada 313", "Camada 318"]
var textures_left_top = ["Camada 285", "Camada 293", "Camada 298", "Camada 285", "Camada 303", "Camada 285", "Camada 308", "Camada 285", "Camada 313", "Camada 285", "Camada 318"]
var textures_right_top = ["Camada 282", "Camada 292", "Camada 297", "Camada 302", "Camada 307", "Camada 312", "Camada 317"]
var textures_right_bottom = ["Camada 285", "Camada 293", "Camada 298", "Camada 285", "Camada 303", "Camada 285", "Camada 308", "Camada 285", "Camada 313", "Camada 285", "Camada 318"]

var vehicles = []

func _ready():
	TimerNode.start(time_between_car_spawn)


func _on_Timer_timeout():
	var end_position = get_node("Position2D").position
	var textures = get_textures(end_position)
	var newVehicle = Vehicle.instance()
	add_child(newVehicle)
	var index = Global.get_random(textures.size())
	var texture = load("res://images/vehicles/"+textures[index]+".png")
	newVehicle.set_vehicle(texture, end_position, time_for_each_car_to_complete)
	newVehicle.time = time_for_each_car_to_complete
	vehicles.append(newVehicle)
	if vehicles.size() < time_for_each_car_to_complete/2:
		_ready()

func get_textures(end_position):
	if end_position.x > position.x && end_position.y < position.y:
		return textures_right_top
	if end_position.x < position.x && end_position.y > position.y:
		return textures_left_bottom
	