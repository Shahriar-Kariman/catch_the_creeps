extends Label

@export var winScreen : AcceptDialog
@export var loseScreen: ConfirmationDialog

var score = 0
@export var MAX_SCORE = 4

func _on_mob_caught():
	score += 1
	text = "Score: %s" % score
	
	if score == MAX_SCORE:
		winScreen.visible = true

func _on_player_lose():
	if loseScreen != null:
		loseScreen.visible = true

func _on_win_screen_confirmed():
	get_tree().reload_current_scene()

func _on_lose_screen_confirmed():
	get_tree().reload_current_scene()
