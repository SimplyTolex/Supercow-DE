extends PopupPanel
signal return_to_menu(focus_to)


func _on_QuitButton_pressed() -> void:
	get_tree().quit()


func _on_ReturnButton_pressed() -> void:
	emit_signal("return_to_menu", "MenuSelection/MarginContainer/VBoxContainer/MarginContainer3/QuitButton")
	DarkBg.hide()
	self.hide()


func _on_QuitPrompt_about_to_show() -> void:
	$VBoxContainer/HBoxContainer/QuitButton.grab_focus()
