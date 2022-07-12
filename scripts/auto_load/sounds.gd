extends Node

enum TYPE{
	PLAYER,
	ENEMY,
	BONUS
}

enum PLAYER_S{
	JUMPS,
	LAND,
	LAND_HARD
}

enum BONUS_S{
	COINS,
	TEMP # НЕ УДАЛЯТЬ БУДЕТ ОШИБКА В scripts/treasure.gd 
}

var LIST = {
	# TYPE PLAYER
	TYPE.PLAYER: {
		PLAYER_S.JUMPS: [
			preload('res://assets/sounds/herojump1.ogg'),
			preload('res://assets/sounds/herojump2.ogg'),
			preload('res://assets/sounds/herojump3.ogg')
		],
		PLAYER_S.LAND: [preload('res://assets/sounds/landing.ogg')],
		PLAYER_S.LAND_HARD: [preload('res://assets/sounds/landinghard.ogg')],
	},
	# TYPE BONUS
	TYPE.BONUS: {
		BONUS_S.COINS: [
			preload('res://assets/sounds/bonuscoin1.ogg'),
			preload('res://assets/sounds/bonuscoin2.ogg'),
			preload('res://assets/sounds/bonuscoin3.ogg')
		]
	}
}

func get_SFX(type, id) -> AudioStream:
	return LIST[type][id]
	
