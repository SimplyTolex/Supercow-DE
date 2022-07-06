extends Node

const MAX_VELOCITY = 80
const MIN_VELOCITY = -80

func exec(delta: float, player) -> void:
	if Input.is_action_pressed('p_right'):
		if player.velocity.x < 0:
			player.velocity += Vector2(30, 0) * Global.get_vector_delta(delta)
		player.velocity += Vector2(30, 0) * Global.get_vector_delta(delta)
	if Input.is_action_pressed('p_left'):
		player.velocity -= Vector2(30, 0) * Global.get_vector_delta(delta)
		if player.velocity.x > 0:
			player.velocity -= Vector2(30, 0) * Global.get_vector_delta(delta)
	
	if !Input.is_action_pressed('p_right') and !Input.is_action_pressed('p_left'):
		if player.velocity.x > 0:
			player.velocity -= Vector2(80, 0) * Global.get_vector_delta(delta)
			if player.velocity.x < 0:
				player.velocity.x = 0
		elif player.velocity.x < 0:
			player.velocity += Vector2(80, 0) * Global.get_vector_delta(delta)
			if player.velocity.x > 0:
				player.velocity.x = 0
	
	if Input.is_action_pressed('p_jump') and player.is_on_floor():
		player.velocity.y = -900
	
	if player.velocity.x > 380:
		player.velocity.x = 380
	if player.velocity.x < -380:
		player.velocity.x = -380
