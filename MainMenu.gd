extends Control
onready var SplashScreen = get_node("SplashScreen")
func _ready():
	SplashScreen.connect("splash_screen_closed", self, "on_splash_screen_closed")
	
func on_splash_screen_closed():
	var MainMenuMenu = load("res://MainMenuMenu.tscn").instance()
	MainMenuMenu.connect("new_game_pressed", self, "on_new_game_pressed")
	add_child(MainMenuMenu)
	
func on_new_game_pressed():
	Global.create_generic_dialog("Prefeita de Plenarópolis", 
	"Texto narrativo explicando a história do jogo e o objetivo do jogador ", "prefeito", load("res://audios/Feedback Positivo.ogg"), self, "add_planejamento", self)
	
func add_planejamento():
	var planejamentoScene = load("res://PlanejamentoFinanceiro.tscn").instance()
	add_child(planejamentoScene)