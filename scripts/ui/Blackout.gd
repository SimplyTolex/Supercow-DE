extends CanvasLayer

var is_music_muffled: bool = false # TODO: когда тёмный фон виден, музыка должна приглушаться
var caller: Node
# Когда нода просит показать тёмный фон, она передаёт своё имя (`get_node(".")`) в аргументе функции. Теперь только она же сможет закрыть тёмный фон.


func appear(node_name):
	if not $BlackoutPanel.is_visible_in_tree():
		$BlackoutPanel.show()
		print("appearing")
	else:
		print("already appeared")
	if not caller:
		caller = node_name


func disappear(node_name):
	print(node_name)
	print(caller)
	if node_name == caller:
		$BlackoutPanel.hide()
		print("disapperaring")
		caller = null
	else:
		print("not disapperaring")
