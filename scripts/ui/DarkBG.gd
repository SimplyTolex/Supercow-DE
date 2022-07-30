extends Panel

var is_music_muffled: bool = false
var caller: Node
# Когда нода просит показать тёмный фон, этот скрипт запоминает название той ноды. Теперь только эта нода, что вызвала фон может его закрыть.
# Но это недоделано.

func _ready() -> void:
	pass

func show_bg():
	if !DarkBg.is_visible_in_tree():
		DarkBg.show()
