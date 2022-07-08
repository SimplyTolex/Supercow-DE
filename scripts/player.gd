class_name Player extends KinematicBody

var speed: float = 13.0
var jump_force: float = 20.0

var air_resist: float = 0.08

var gravity: float = 0.7 #ProjectSettings.get_setting('physics/3d/default_gravity')

var velocity: Vector3

func _process(delta: float) -> void:
	controls(Global.get_delta(delta))
	
	var gravity_resistance = get_floor_normal() if is_on_floor() else Vector3.UP
	velocity -= gravity * gravity_resistance * Global.get_vector_delta(delta)
	velocity.x = 0
	velocity = move_and_slide(velocity, Vector3.UP)


func controls(delta: float) -> void:
	var dir: float = Input.get_axis('p_left','p_right')
	
	if is_on_floor():
		velocity.z = lerp(velocity.z, dir * speed, air_resist)
	else:
		velocity.z = lerp(velocity.z, dir * speed, air_resist / 3.3)
	
	if Input.is_action_pressed('p_jump') and is_on_floor():
		velocity.y = jump_force
	
	if Input.is_action_just_released('p_jump') and velocity.y > 0.0:
		velocity.y /= 2 * delta


func _to_string() -> String:
	return 'vel: %s, on floor: %s' % [velocity, is_on_floor()]
