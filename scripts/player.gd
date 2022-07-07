extends KinematicBody

var velocity: Vector3

func _process(delta: float) -> void:
	controls(delta)
	
	velocity.y -= 1 * Global.get_delta(delta)
	velocity = move_and_slide(velocity, Vector3.UP)

func controls(delta: float) -> void:
	if Input.is_action_pressed('p_right'):
		if velocity.z < 0:
			velocity += Vector3(3, 0, 0) * Global.get_vector_delta(delta)
		velocity += Vector3(3, 0, 0) * Global.get_vector_delta(delta)
	if Input.is_action_pressed('p_left'):
		velocity -= Vector3(3, 0, 0) * Global.get_vector_delta(delta)
		if velocity.z > 0:
			velocity -= Vector3(3, 0, 0) * Global.get_vector_delta(delta)
	
	if !Input.is_action_pressed('p_right') and !Input.is_action_pressed('p_left'):
		if velocity.z > 0:
			velocity -= Vector3(8, 0, 0) * Global.get_vector_delta(delta)
			if velocity.z < 0:
				velocity.z = 0
		elif velocity.z < 0:
			velocity += Vector3(8, 0, 0) * Global.get_vector_delta(delta)
			if velocity.z > 0:
				velocity.z = 0
	
	if Input.is_action_pressed('p_jump') and is_on_floor():
		velocity.y = 24
	
	if velocity.z > 12:
		velocity.z = 12
	if velocity.z < -12:
		velocity.z = -12
