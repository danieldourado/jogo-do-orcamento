extends Node2D


onready var TweenNode = get_node("Tween")
onready var SpriteNode = get_node("Sprite")
export var final_pos = Vector2()
export var time = 1.0

func set_vehicle(final_pos, time, texture = null):
	self.time = time
	self.final_pos = final_pos
	if texture:
		SpriteNode.texture = texture
	start_tween()

func start_tween():
	TweenNode.interpolate_property(self, "position", position, final_pos, time, Tween.TRANS_LINEAR, Tween.TRANS_LINEAR)
	TweenNode.repeat = true
	TweenNode.start()
	
func flip_h():
	SpriteNode.flip_h = true