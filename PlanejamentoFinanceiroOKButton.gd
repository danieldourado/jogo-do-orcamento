extends TextureButton


func _ready():
	connect("toggled", self, "_on_Button_pressed")

func _process(delta):
	if get_parent().get_parent().can_change_scene():
    	disabled = false
	else:
		disabled = true

func _on_OKButton_pressed():
	if get_parent().get_parent().can_change_scene() == false:
		return
	
	var planejamento_root = get_parent().get_parent()
	var planejamento_parent = planejamento_root.get_parent()
	planejamento_root.hide()
	
	#Global.create_generic_dialog("Prefeita de Plenarópolis", 
	#"Texto narrativo explicando que a etapa de planejamento acabou, que a etapa de decisões está prestes a começar e como ela funciona", "prefeito", load("res://audios/Feedback Positivo.ogg"), self, "go_to_gameplay", planejamento_parent)
	
	var tutorial1 = load("res://CutScene.tscn").instance()
	tutorial1.set_cutscene(["Tutorial-11.jpg","Tutorial-12.jpg","Tutorial-13.jpg",
							"Tutorial-14.jpg","Tutorial-15.jpg","Tutorial-16.jpg", 
							"Tutorial-17.jpg","Tutorial-18.jpg","Tutorial-19.jpg",
							"Tutorial-20.jpg","Tutorial-21.jpg","Tutorial-22.jpg"], self, "go_to_gameplay")
	get_tree().get_root().add_child(tutorial1)
	
func go_to_gameplay():
	get_tree().change_scene("res://Gameplay.tscn")
