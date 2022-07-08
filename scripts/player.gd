class_name Player extends KinematicBody

var speed: float = 13.0
var jump_force: float = 6.0

var jump_counter: float = 5.0
var jumping: bool = false

var air_resist: float = 0.08

var gravity: float = 0.7 #ProjectSettings.get_setting('physics/3d/default_gravity')

var velocity: Vector3

func _process(delta: float) -> void:
	controls(Global.get_delta(delta))
	
	var gravity_resistance = get_floor_normal() if is_on_floor() else Vector3.UP
	velocity -= gravity * gravity_resistance * Global.get_vector_delta(delta)
	velocity.x = 0
	velocity = move_and_slide(velocity, Vector3.UP)
	
	if jump_counter < 0 or velocity.y < 0: jumping = false

func controls(delta: float) -> void:
	var dir: float = Input.get_axis('p_left','p_right')
	
	if is_on_floor():
		velocity.z = lerp(velocity.z, dir * speed, air_resist)
	else:
		velocity.z = lerp(velocity.z, dir * speed, air_resist / 3.3)
	
	if Input.is_action_pressed('p_jump') and is_on_floor():
		velocity.y = jump_force
		jump_counter = 5.0
		jumping = true
	
	if Input.is_action_pressed('p_jump') and jumping:
		velocity.y += jump_force * (jump_counter / 5.0) * delta
		jump_counter -= 1 * delta
	
	if Input.is_action_just_released('p_jump') and velocity.y > 0.0:
		velocity.y /= 2 * delta


func _to_string() -> String:
	return 'vel: %s\non floor: %s\njumping: %s\njump counter: %s' % [velocity, is_on_floor(), jumping, jump_counter]
