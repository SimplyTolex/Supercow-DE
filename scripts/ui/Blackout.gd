extends CanvasLayer

var is_music_muffled: bool = false
var caller: Node
# Когда нода просит показать тёмный фон, этот скрипт запоминает название той ноды. Теперь только эта нода, что вызвала фон может его закрыть.
# Но это недоделано.


func appear():
	$BlackoutPanel.show()


func disappear():
	$BlackoutPanel.hide()
