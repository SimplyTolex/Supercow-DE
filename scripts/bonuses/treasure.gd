extends Area

export var score: int = 20
export var sounds: String = 'COINS'

func _on_body_entered(body) -> void:
	MusicPlayer.play_random_sound(Sounds.BONUS[sounds], self)
	Global.score += score
	queue_free()
