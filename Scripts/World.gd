extends Node2D

var score = 0 setget set_score
const MIN_SCORE = 0
export var gain = 100
export var loss = 250

var MenuReturn = false
var Win = false

func _ready():
	set_fixed_process(true)

func set_score(value):
	
	if(score < MIN_SCORE):
		score = MIN_SCORE
	elif (score == MIN_SCORE and value > 1 or score > MIN_SCORE):
		score = value
	get_node("Score").set_text("Score: "+str(score))
	
func _fixed_process(delta):
	if (MenuReturn == true):
		get_node("/root/globals").set_scene("res://Scenes/Menu.scn")
	if (Win == true):
		Win = false
		get_node("LevelWin").show()
		get_tree().set_pause(true)


func _on_LevelWin_confirmed():
	get_tree().set_pause(false)
	get_node("/root/globals").set_scene("res://Scenes/Menu.scn")


	
