extends KinematicBody2D

var velocity : Vector2 = Vector2()

func handle_input():
	velocity = Vector2.ZERO
	
	if(Input.is_action_pressed("player_north")):
		velocity.y -= 1
	if(Input.is_action_pressed("player_east")):
		velocity.x += 1
	if(Input.is_action_pressed("player_south")):
		velocity.y += 1
	if(Input.is_action_pressed("player_west")):
		velocity.x -= 1
		
	velocity = velocity.normalized()
	velocity = move_and_slide(velocity * 100)

func look_at_mouse():
	look_at(get_global_mouse_position())
	rotation_degrees = rotation_degrees + 90

func _physics_process(delta):
	handle_input()
	look_at_mouse()
