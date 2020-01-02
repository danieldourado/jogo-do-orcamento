extends Control

onready var TextureButtonNode = get_node("TextureButton")

var textures = ["HQ-JOGO-ORCAMENTO_PG_01.jpg", 
				"HQ-JOGO-ORCAMENTO_PG_02.jpg", 
				"HQ-JOGO-ORCAMENTO_PG_03.jpg"]

var callback_obj
var callback_func

func set_cutscene(textures, callback_obj = null, callback_func = null):
	self.textures = textures
	self.callback_obj = callback_obj
	self.callback_func = callback_func
	
func _ready():
	change_texture(textures.pop_front())

func _on_TextureButton_pressed():
	change_texture(textures.pop_front())

func change_texture(texture_name):
	if texture_name == null:
		if callback_obj:
			callback_obj.call(callback_func)
		get_parent().remove_child(self)
	
		return
	TextureButtonNode.texture_normal = load("res://images/CutScene/"+texture_name)