extends PopupPanel
signal return_to_menu(focus_to)

var caller: Node


func _on_AcceptButton_pressed() -> void:
	pass # Replace with function body.


func _on_RefuseButton_pressed() -> void:
	self.hide()
	emit_signal("return_to_menu", caller.get_path())
	self.queue_free()


func _on_BasePrompt_about_to_show() -> void:
	$VBoxContainer/MarginContainer2/GridContainer/AcceptButton.grab_focus()
#	print("set caller to ", caller)
