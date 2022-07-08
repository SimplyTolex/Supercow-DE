class_name PlayerCamera extends Camera

var zoom: float = 12.0
var offset: Vector2
var scroll_y: float

func _ready() -> void:
	translation.x = -zoom
	scroll_y = References.player.translation.y + 1.5

func _process(_delta: float) -> void:
	# смотрим вверх или вниз
	offset.y = 0
	offset.y += -3 if Input.is_action_pressed('p_down') else 0
	offset.y += 3 if Input.is_action_pressed('p_up') else 0
	
	# считаем Y
	var hardscroll: bool = false
	if scroll_y < References.player.translation.y - 2.5:
		scroll_y = References.player.translation.y - 2.5
		hardscroll = true
	if scroll_y > References.player.translation.y + 2.5:
		scroll_y = References.player.translation.y + 2.5
		hardscroll = true
	
	translation.x = lerp(translation.x, -zoom, 0.05)
	translation.y = lerp(translation.y, scroll_y + offset.y, 0.02 if !hardscroll else 0.1)
	translation.z = lerp(translation.z, References.player.translation.z + offset.x, 0.15)
