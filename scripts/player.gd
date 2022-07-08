class_name Player extends KinematicBody

var speed: float = 13.0
var jump_force: float = 20.0

var air_resist: float = 0.2

var gravity: float = 0.7 #ProjectSettings.get_setting('physics/3d/default_gravity')

var _velocity: Vector3

func _process(delta: float) -> void:
	controls(Global.get_delta(delta))
	
	if !is_on_floor():
		_velocity.y -= gravity * Global.get_delta(delta)
	_velocity.x = 0
	_velocity = move_and_slide_with_snap(_velocity,Vector3.DOWN / 4,Vector3.UP,true,4,1)


func controls(delta: float) -> void:
	var dir: float = Input.get_axis('p_left','p_right')
	
	if is_on_floor():
		_velocity.z = lerp(_velocity.z,dir * speed,air_resist)
	else:
		_velocity.z = lerp(_velocity.z,dir * speed,air_resist / 3.3)
	
	if Input.is_action_pressed("p_jump") and is_on_floor():
		_velocity.y = jump_force * delta
	
	if Input.is_action_just_released("p_jump") and _velocity.y > 0.0:
		_velocity.y /= 2 * delta


func _to_string() -> String:
	return 'vel: %s, on floor: %s' % [_velocity, is_on_floor()]
