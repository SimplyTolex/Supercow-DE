class_name PlayerCamera extends Camera

export var zoom: float = 12.0
export var scroll_y: float

onready var rect: Rect2 = DebugUI.get_node('Control/Rect').get_rect()
onready var target: Spatial = References.player

var _explore_mod: bool
#var _in_rect: bool
#var _trp: Vector2 # Target Relative Position (Относительно центра экрана)
var _final_pos: Vector3

# TODO: Доделать камеру

func _ready() -> void:
	translation = target.translation
	translation.x = -zoom / 2 # Для эффекта
	scroll_y = target.translation.y + 1.5

func _process(_delta: float) -> void:
	var canvas_pos: Vector2 = unproject_position(target.translation + Vector3(0,1.5,0))
	var center: Vector2 = get_viewport().size / 2
	
#	_trp = (canvas_pos - center).sign()
	
	
	_final_pos.x = -zoom
	
	#look_at(target.translation,Vector3.UP) # Прикольный эффект может потом как-то использовать
	
	if !rect.has_point(canvas_pos):
		_final_pos.z = target.translation.z
		_final_pos.y = target.translation.y
	
	References.player.in_explore = _explore_mod
	
	
	move()

func get_offset() -> Vector2:
	var _offset: Vector2
	# Смотрим вверх или вниз
	_offset.y += -3 if Input.is_action_pressed('e_down') else 0
	_offset.y += 3 if Input.is_action_pressed('e_up') else 0
	
	_explore_mod = _offset.y != 0
	
	return _offset

func move() -> void:
	var canvas_pos: Vector2 = unproject_position(target.translation + Vector3(0,1.5,0))
	var center: Vector2 = get_viewport().size / 2
	
	var offset = get_offset()
	translation.x = lerp(translation.x, _final_pos.x, 0.05)
	translation.y = lerp(translation.y, _final_pos.y + offset.y, 0.2 if !_explore_mod else 0.1)
	translation.z = lerp(translation.z, _final_pos.z + offset.x, 0.13)
	

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("zoom_in"):
		zoom -= 1
	if Input.is_action_just_pressed("zoom_out"):
		zoom += 1
	
	rect = DebugUI.get_node('Control/Rect').get_rect()
