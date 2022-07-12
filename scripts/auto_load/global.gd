extends Node

var lives: int = 3
var score: int = 0

func _ready():
	Input.set_custom_mouse_cursor(load("res://assets/sprites/mouse_temp.png"))

static func get_delta(delta: float) -> float:
	return 60 / (1 / (delta if not delta == 0 else 0.0001))

static func get_vector_delta(delta: float) -> Vector3:
	return Vector3(get_delta(delta), get_delta(delta), get_delta(delta))

func _input(ev: InputEvent) -> void:
	if ev.is_action_pressed('ui_fullscreen'):
		OS.window_fullscreen = !OS.window_fullscreen
