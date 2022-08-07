class_name HUD extends CanvasLayer

var display_score: float = Global.score
var is_paused = false setget set_is_paused

func _physics_process(_delta: float) -> void:
	display_score = lerp(display_score, Global.score, 0.05)
	
	$Control/HP/HpLabel.text = 'x%s' % [Global.lives]
	$Control/Score/ScoreLabel.text = String(ceil(display_score))


func _ready() -> void:
	get_node("Control/Level/LevelLabel").text = get_tree().get_current_scene().get_name() # Меняет название в лейбле на название главной ноды сцены (что-бы постоянно не менять это в ручную)


# Pausing
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_pause"):
		pause_unpause()


func set_is_paused(value):
	is_paused = value
	get_tree().paused = is_paused
#	$PauseSelection.visible = is_paused


func pause_unpause():
	if !is_paused:
		$PauseSelection.show()
		Blackout.appear(get_node("."))
		self.is_paused = !is_paused
	else:
		$PauseSelection.hide()
		Blackout.disappear(get_node("."))
		self.is_paused = !is_paused


func _on_PauseSelection_unpause() -> void:
	pause_unpause()
