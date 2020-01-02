extends Node

var category
var previous_value
var slider_step = 5000
var min_recomended_value = slider_step
var max_recomended_value = slider_step*3

onready var slider_node = get_node("HSliderContainer/HSlider")
onready var label_tipo_node = get_node("HBoxContainer/HBoxContainer/Label")
onready var label_value_node = get_node("HBoxContainer/HBoxContainer/Label2")
onready var label_priority_value_node = get_node("HBoxContainer/HBoxContainer2/Label4")

func _ready():
	pass

func set_slider(priority):
	set_label_name(priority.key)
	set_label_priority(priority.value)

func set_label_name(labelName):
	category = labelName
	label_tipo_node.text = labelName+":"

func set_max_value(value):
	var hslider = slider_node
	hslider.max_value = value
	hslider.step = slider_step

func _process(delta):
	if Global.planejamento_financeiro.remaining_value < 0:
		slider_node.value = previous_value
	var label_text = str(slider_node.value)
	label_value_node.text = label_text
	Global.orcamento[category] = slider_node.value
	previous_value = slider_node.value
	set_slider_icon()

func get_slider_value():
	return slider_node.value
	
func set_label_priority(priority):
	label_priority_value_node.text = "Baixa"
	label_priority_value_node.set("custom_colors/font_color", Color(0,0.8,0))

	if priority == 2:
		label_priority_value_node.text = "Média"
		label_priority_value_node.set("custom_colors/font_color", Color(0.8,0.8,0))
		min_recomended_value = slider_step *3
		max_recomended_value = slider_step *5

		
	if priority == 3:
		label_priority_value_node.text = "Alta"
		label_priority_value_node.set("custom_colors/font_color", Color(1,0,0))
		min_recomended_value = slider_step *5
		max_recomended_value = slider_step *8

func set_slider_icon():
	if slider_node.value < min_recomended_value || slider_node.value > max_recomended_value:
		set_grabber(load("res://images/Interface/DISLIKE.png"))
	else:
		set_grabber(load("res://images/Interface/LIKE.png"))
		
func set_grabber(texture):
		slider_node.add_icon_override("grabber", texture)
		slider_node.add_icon_override("grabber_disabled", texture)
		slider_node.add_icon_override("grabber_highlight", texture)
		slider_node.add_icon_override("tick", texture)



func _on_DecreaseButton_pressed():
	slider_node.value = slider_node.value - slider_node.step


func _on_IncreaseButton_pressed():
	slider_node.value = slider_node.value + slider_node.step
