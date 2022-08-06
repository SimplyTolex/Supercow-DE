extends "res://scripts/ui/BasePrompt.gd"
signal restart_level


func _ready() -> void:
	popup()


func _on_AcceptButton_pressed():
	emit_signal("restart_level")
	print("ye, good luck restarting when there is no levels bruh")
