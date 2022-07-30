extends CanvasLayer

export var music := []


func _ready() -> void:
	# Соединяем кнопки (ведь в меню нет скрипта)
	$MenuSelection/MarginContainer/VBoxContainer/MarginContainer/PlayButton.connect("pressed", self, "on_PlayButton_pressed")
	$MenuSelection/MarginContainer/VBoxContainer/MarginContainer2/SettingsButton.connect("pressed", self, "on_SettingsButton_pressed")
	$MenuSelection/MarginContainer/VBoxContainer/MarginContainer4/InfoButton.connect("pressed", self, "on_InfoButton_pressed")
	$MenuSelection/MarginContainer/VBoxContainer/MarginContainer3/QuitButton.connect("pressed", self, "on_QuitButton_pressed")
	$QuitPrompt.connect("return_to_menu", self, "on_return_to_menu")
	Audio.play_random(music, 0)
	$MenuSelection/MarginContainer/VBoxContainer/MarginContainer/PlayButton.grab_focus()


func on_QuitButton_pressed():
	$MenuSelection.hide()
	if !DarkBg.is_visible_in_tree():
		DarkBg.show()
	$QuitPrompt.popup_centered()


func on_return_to_menu(focus_to):
	$MenuSelection.show()
	get_node(focus_to).grab_focus()


func on_PlayButton_pressed():
	get_tree().change_scene("res://levels/test.tscn")
