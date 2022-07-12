class_name Treasure extends Resource

export var score: int = 20
export(Sounds.BONUS_S) var sound: int = Sounds.BONUS_S.COINS

func collect(pos:Vector3) -> void:
	Audio.play_random_sound(Sounds.get_SFX(Sounds.TYPE.BONUS,sound), pos)
	Global.score += score
