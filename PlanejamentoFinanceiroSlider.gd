extends VBoxContainer

var category
var previous_value
var slider_step = 5000
var min_recomended_value = slider_step
var max_recomended_value = slider_step*3




func _ready():
	pass

func set_slider(priority):
	set_label_name(priority.key)
	set_label_priority(priority.value)

func set_label_name(labelName):
	category = labelName
	get_node("HBoxContainer/Label").text = labelName+":"

func set_max_value(value):
	var hslider = get_node("HSlider")
	hslider.max_value = value
	hslider.step = slider_step

func _process(delta):
	if Global.planejamento_financeiro.remaining_value < 0:
		get_node("HSlider").value = previous_value
	var label_text = str(get_node("HSlider").value)
	get_node("HBoxContainer/Label2").text = label_text
	Global.orcamento[category] = get_node("HSlider").value
	previous_value = get_node("HSlider").value
	set_slider_icon()

func get_slider_value():
	return get_node("HSlider").value
	
func set_label_priority(priority):
	get_node("HBoxContainer/Label4").text = "Baixa"
	get_node("HBoxContainer/Label4").set("custom_colors/font_color", Color(0,0.8,0))

	if priority == 2:
		get_node("HBoxContainer/Label4").text = "Média"
		get_node("HBoxContainer/Label4").set("custom_colors/font_color", Color(0.8,0.8,0))
		min_recomended_value = slider_step *3
		max_recomended_value = slider_step *5

		
	if priority == 3:
		get_node("HBoxContainer/Label4").text = "Alta"
		get_node("HBoxContainer/Label4").set("custom_colors/font_color", Color(1,0,0))
		min_recomended_value = slider_step *5
		max_recomended_value = slider_step *8

func set_slider_icon():
	if get_node("HSlider").value < min_recomended_value || get_node("HSlider").value > max_recomended_value:
		set_grabber(load("res://images/Interface/DESLIKE.png"))
	else:
		set_grabber(load("res://images/Interface/LIKE.png"))
		
func set_grabber(texture):
		get_node("HSlider").add_icon_override("grabber", texture)
		get_node("HSlider").add_icon_override("grabber_disabled", texture)
		get_node("HSlider").add_icon_override("grabber_highlight", texture)
		get_node("HSlider").add_icon_override("tick", texture)

