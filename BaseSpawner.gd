extends Node2D

export (PackedScene) var Vehicle
onready var TimerNode = get_node("Timer")
export var time_for_each_car_to_complete = 10
export var time_between_car_spawn = 2

var vehicles = []

func _ready():
	_on_Timer_timeout()

func start_timer():
	TimerNode.start(time_between_car_spawn)

func _on_Timer_timeout():
	TimerNode.stop()
	var end_position = get_node("Position2D").position
	var newVehicle = Vehicle.instance()
	add_child(newVehicle)
	newVehicle.set_vehicle(end_position, time_for_each_car_to_complete)
	vehicles.append(newVehicle)
	if vehicles.size() < time_for_each_car_to_complete/time_between_car_spawn:
		start_timer()
