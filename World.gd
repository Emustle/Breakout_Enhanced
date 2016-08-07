extends Node2D

var score = 0 setget set_score
const MIN_SCORE = 0
export var gain = 100
export var loss = 250


func set_score(value):
	if(score < MIN_SCORE):
		score = MIN_SCORE
	elif (score == MIN_SCORE and value > 1 or score > MIN_SCORE):
		score = value
	get_node("Score").set_text("Score: "+str(score))
	
