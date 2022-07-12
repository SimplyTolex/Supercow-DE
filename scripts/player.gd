class_name Player extends KinematicBody

var speed: float = 13.0

var jump_force: float = 22.0
var air_resist: float = 0.08
var on_floor: bool = false
var in_explore: bool

var gravity: float = 0.7 #ProjectSettings.get_setting('physics/3d/default_gravity')

var _velocity: Vector3

func _process(delta: float) -> void:
	if is_on_floor() and !on_floor:
		on_floor = true
		Audio.play_random_sound(Sounds.get_SFX(Sounds.TYPE.PLAYER,Sounds.PLAYER_S.LAND), translation)
	
	if !in_explore:
		controls(Global.get_delta(delta))
	else:
		_velocity.z = lerp(_velocity.z,0,0.3)
	
	var gravity_resistance = get_floor_normal() if is_on_floor() else Vector3.UP
	_velocity -= gravity * gravity_resistance * Global.get_vector_delta(delta)
	_velocity.x = 0
	
	_velocity = move_and_slide(_velocity, Vector3.UP)

func controls(delta: float) -> void:
	var dir: float = Input.get_axis('p_left','p_right')
	
	if is_on_floor():
		_velocity.z = lerp(_velocity.z, dir * speed, air_resist)
	else:
		_velocity.z = lerp(_velocity.z, dir * speed, air_resist / 3.3)
	
	if Input.is_action_pressed('p_jump') and is_on_floor():
		jump()
	
	if Input.is_action_just_released('p_jump') and _velocity.y > 0:
		# Сглаживает прыжок, чем меньше значение тем плавнее.
		_velocity.y /= 1.7 # Сглаживает прыжок без КАУНТЕРОВ с этого момента я запрещаю использовать КАУНТЕРЫ (Исключение: Использовать их как ВРЕМЕННОЕ РЕШЕНИЕ)

func jump() -> void:
	Audio.play_random_sound(Sounds.get_SFX(Sounds.TYPE.PLAYER,Sounds.PLAYER_S.JUMPS), translation)
	_velocity.y = jump_force
	on_floor = false


func _to_string() -> String:
	return 'vel: %s\non floor: %s' % [_velocity, is_on_floor()]

