extends Node

var player: Player
var camera: Camera
var hud: HUD


func _ready() -> void:
	make_refs()


func make_refs():
	player = load('res://objects/player.tscn').instance()
	camera = load('res://objects/camera.tscn').instance()
	hud = load('res://objects/HUD.tscn').instance()
