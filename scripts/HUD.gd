class_name HUD extends CanvasLayer

var display_score: float = Global.score

func _physics_process(_delta: float) -> void:
	display_score = lerp(display_score, Global.score, 0.05)
	
	$LifebarContainer/Label.text = 'x%s' % [Global.lives]
	$ScorebarContainer/Label.text = String(ceil(display_score))
