extends Control


func _ready() -> void:
	pass


func _on_PlayButton_pressed() -> void:
	get_tree().change_scene("res://levels/test.tscn")


func _on_SettingsButton_pressed() -> void:
	pass


func _on_InfoButton_pressed() -> void:
	pass # Replace with function body.


func _on_QuitButton_pressed() -> void:
	get_tree().change_scene("res://other_scenes/QuitPrompt.tscn")
