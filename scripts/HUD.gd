class_name HUD extends CanvasLayer

var display_score: float = Global.score

func _physics_process(_delta: float) -> void:
	display_score = lerp(display_score, Global.score, 0.05)
	
	$Control/HP/HpLabel.text = 'x%s' % [Global.lives]
	$Control/Score/ScoreLabel.text = String(ceil(display_score))


func _ready() -> void:
	get_node("Control/Level/LevelLabel").text = get_tree().get_current_scene().get_name() # Меняет название в лейбле на название главной ноды сцены (что-бы постоянно не менять это в ручную)
