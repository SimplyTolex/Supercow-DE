class_name Level extends Spatial

func _ready():
	var start = get_node_or_null('StartPos')
	
	if start is Position3D:
		add_child(References.player)
		References.player.owner = self
		# Да, ты можешь вращать стартувую позицию и игрок начнет с такимже углом вращения
		# Также работает и с размером, будет полезно для пользовательских уровней
		References.player.global_transform = start.transform
	else:
		push_warning('[LEVEL]:IN %s STARTPOST IS %s, STARTING WITH OUT PLAYER!' % [self,start])
	
