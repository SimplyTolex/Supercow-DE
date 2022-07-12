extends Node

func _ready() -> void:
	randomize()

func get_channel(id: int) -> AudioStreamPlayer:
	var name = 'Channel%s' % [id]
	var node = get_node_or_null(name)
	if !is_instance_valid(node):
		var instance = AudioStreamPlayer.new()
		instance.name = name
		add_child(instance)
		return instance
	else:
		return node

func play(stream, id: int, force_repeat: bool = false) -> void:
	var player = get_channel(id)
	if !player.playing or force_repeat:
		player.stream = stream
		player.bus = 'Music'
		player.play()

func play_random(streams, id: int, force_repeat: bool = false) -> void:
	if !len(streams):
		print('[MusicPlayer] Был передан пустой массив музыки, играть нечего.')
		return
	var stream = streams[randi() % len(streams) - 1]
	play(stream, id, force_repeat)

func play_sound(stream, pos: Vector3) -> void:
	var player = AudioStreamPlayer3D.new()
	References.camera.add_child(player)
	player.translation = pos - References.camera.translation - Vector3(References.camera.zoom, 0, 0)
	player.attenuation_model = 3
	player.stream = stream
	player.stream.loop = false
	player.bus = 'Sounds'
	player.play()
	player.connect('finished', player, 'queue_free')

func play_random_sound(streams, pos: Vector3) -> void:
	if !len(streams):
		print('[MusicPlayer] Был передан пустой массив звуков, играть нечего.')
		return
	var stream = streams[randi() % len(streams) - 1]
	play_sound(stream, pos)
