
extends KinematicBody2D

const ball_scene = preload("res://Scenes/Ball.scn")
var isBallCreated = false

func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	var y = get_pos().y
	var mouse_x = get_viewport().get_mouse_pos().x
	
	set_pos(Vector2(mouse_x,y))
	
	if (Input.is_mouse_button_pressed(BUTTON_LEFT) and isBallCreated == false):
		var ball = ball_scene.instance()
		ball.set_pos(get_pos() - Vector2(0,16))
		get_tree().get_root().add_child(ball)
		isBallCreated = true
		
		


