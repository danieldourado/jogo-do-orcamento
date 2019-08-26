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
	
	Global.create_generic_dialog("Prefeita de Plenarópolis", 
	"Texto narrativo explicando que a etapa de planejamento acabou, que a etapa de decisões está prestes a começar e como ela funciona", "prefeito", load("res://audios/Feedback Positivo.ogg"), self, "go_to_gameplay", planejamento_parent)
	
	
func go_to_gameplay():
	get_tree().change_scene("res://Gameplay.tscn")
