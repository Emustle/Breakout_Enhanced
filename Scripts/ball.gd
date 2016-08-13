extends RigidBody2D

var speedup = 10
const MAXSPEED = 500


func _ready():
	set_fixed_process(true)
	var children_count = get_node("/root/World/Bricks").get_child_count()

	Globals.set("BRICK_COUNT",0)
	Globals.set("BRICK_MAX", children_count)
	
func _fixed_process(delta):
	
	var bodies = get_colliding_bodies()
	var score_gain = get_node("/root/World").gain
	var score_loss = get_node("/root/World").loss
	var brick_count = Globals.get("BRICK_COUNT")
	var brick_max = Globals.get("BRICK_MAX") 
	
	for body in bodies:
		if body.is_in_group("Bricks"):
			get_node("/root/World").score += score_gain
			body.queue_free()
			get_node("/root/World/BrickDestroyed").play("BrickDestroyed")
			print("Ball touched Brick")
			
			brick_count += 1
			Globals.set("BRICK_COUNT",brick_count)
			print(brick_count)
			
		if body.get_name() == "Paddle":
			var speed = get_linear_velocity().length()
			var direction = get_pos() - body.get_node("Anchor").get_global_pos()
			var velocity = direction.normalized()*min(speed+speedup, MAXSPEED)
			set_linear_velocity(velocity)
			get_node("/root/World/PaddleTouched").play("PaddleTouched")
			print("Ball touched Paddle")
			print(speed+speedup)
			
	if get_pos().y > get_viewport_rect().end.y :
		get_node("/root/World").score -= score_loss
		queue_free()
		print("End Ball.")
		get_node("/root/World").MenuReturn = true
		
	if(brick_count == brick_max):
		get_node("/root/World").score -= score_gain
		queue_free()
		print("Win")
		get_node("/root/World").Win = true