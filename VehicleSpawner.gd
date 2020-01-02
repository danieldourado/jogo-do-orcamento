extends "res://BaseSpawner.gd"

var textures_right_top = ["Camada 282","Camada 286","Camada 292","Camada 294","Camada 297","Camada 299","Camada 302","Camada 304","Camada 307","Camada 309","Camada 312","Camada 314","Camada 317","Camada 319","Onibus_01","Camada 322"]
var textures_right_bottom = ["Camada 281","Camada 285","Camada 291","Camada 293","Camada 296","Camada 298","Camada 301","Camada 303","Camada 306","Camada 308","Camada 311","Camada 313","Camada 316","Camada 318","Camada 321","Onibus_02","Camada 321"]
		
func _on_Timer_timeout():
	TimerNode.stop()
	var end_position = get_node("Position2D").position
	var textures = get_textures(end_position)
	var newVehicle = Vehicle.instance()
	add_child(newVehicle)
	mirror_texture(newVehicle, end_position)
	var index = Global.get_random(textures.size())
	var texture = load("res://images/vehicles/"+textures[index]+".png")
	newVehicle.set_vehicle(end_position, time_for_each_car_to_complete, texture)
	vehicles.append(newVehicle)
	if vehicles.size() < time_for_each_car_to_complete/time_between_car_spawn:
		start_timer()

func get_textures(end_position):
	if end_position.x > 0 && end_position.y < 0:
		return textures_right_top
	if end_position.x > 0  && end_position.y > 0:
		return textures_right_bottom
	if end_position.x < 0 && end_position.y > 0:
		return textures_right_bottom
	if end_position.x < 0  && end_position.y < 0:
		return textures_right_top
	
func mirror_texture(newVehicle, end_position):
	if end_position.x < 0 && end_position.y > 0:
		newVehicle.flip_h()
	if end_position.x < 0  && end_position.y < 0:
		newVehicle.flip_h()
	