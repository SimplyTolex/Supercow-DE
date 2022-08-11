extends PanelContainer
signal unpause()


func _on_ReturnButton_pressed() -> void:
	emit_signal("unpause")


func _on_RestartButton_pressed() -> void:
#	self.hide()
	var prompt = preload("res://ui/interfaces/restart_prompt.tscn").instance()
	add_child(prompt)
	prompt.caller = $MarginContainer/VBoxContainer/MarginContainer2/RestartButton
	prompt.connect("return_to_menu", self, "on_return_to_menu")
	prompt.popup_centered_minsize()


func _on_SettingsButton_pressed() -> void:
	pass # Replace with function body.


func _on_QuitToTilteButton_pressed() -> void:
	emit_signal("unpause")
	get_tree().change_scene("res://ui/main_menu.tscn")
	References.make_refs()


func on_return_to_menu(focus_to):
	self.show()
	get_node(focus_to).grab_focus()


func _on_PauseSelection_visibility_changed() -> void:
	$MarginContainer/VBoxContainer/MarginContainer/ReturnButton.grab_focus()
