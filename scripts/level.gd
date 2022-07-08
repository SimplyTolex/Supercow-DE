class_name Level extends Spatial

export var music = []

func _ready():
	var start = get_node_or_null('StartPos')
	
	if start is Position3D:
		add_child(References.player)
		References.player.owner = self
		# Да, ты можешь вращать стартувую позицию и игрок начнет с такимже углом вращения
		# Также работает и с размером, будет полезно для пользовательских уровней
		References.player.global_transform = start.transform
		
		add_child(References.camera)
		References.camera.owner = self
		References.camera.translation = References.player.translation
		
		add_child(References.hud)
		References.hud.owner = self
	else:
		push_warning('[LEVEL]: IN %s STARTPOS IS %s, STARTING WITHOUT PLAYER!' % [self,start])
	
	MusicPlayer.play_random(music, 0)
	
