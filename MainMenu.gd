extends Control
onready var SplashScreen = get_node("SplashScreen")
func _ready():
	SplashScreen.connect("splash_screen_closed", self, "on_splash_screen_closed")
	
func on_splash_screen_closed():
	var MainMenuMenu = load("res://MainMenuMenu.tscn").instance()
	MainMenuMenu.connect("new_game_pressed", self, "on_new_game_pressed")
	add_child(MainMenuMenu)
	
func on_new_game_pressed():
	#Global.create_generic_dialog("Prefeita de Plenarópolis", 
	#"Texto narrativo explicando a história do jogo e o objetivo do jogador ", "prefeito", load("res://audios/Feedback Positivo.ogg"), self, "add_planejamento", self)
	add_planejamento()
	var tutorial1 = load("res://CutScene.tscn").instance()
	tutorial1.set_cutscene([	"Tutorial-01.jpg","Tutorial-02.jpg","Tutorial-03.jpg",
							"Tutorial-04.jpg","Tutorial-05.jpg","Tutorial-06.jpg", 
							"Tutorial-07.jpg","Tutorial-08.jpg","Tutorial-09.jpg",
							"Tutorial-10.jpg"])
	add_child(tutorial1)
	
	
	var cutscene = load("res://CutScene.tscn").instance()
	cutscene.set_cutscene([	"HQ-JOGO-ORCAMENTO_PG_01.jpg",
							"HQ-JOGO-ORCAMENTO_PG_02.jpg", 
							"HQ-JOGO-ORCAMENTO_PG_03.jpg"])
	add_child(cutscene)



func add_planejamento():
	var planejamentoScene = load("res://PlanejamentoFinanceiro.tscn").instance()
	add_child(planejamentoScene)