extends Sprite

onready var TweenNode = get_node("Tween")
export var time = 5

func _ready():
	TweenNode.interpolate_property(self, "modulate", Color(1,1,1), Color(0.42,0.81,0.88), Global.get_random(time), Tween.TRANS_LINEAR, Tween.TRANS_LINEAR)
	TweenNode.repeat = true
	TweenNode.start()
