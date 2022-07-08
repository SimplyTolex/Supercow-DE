class_name PlayerCamera extends Camera

var zoom: float = 12.0
var offset: Vector2
var scroll_y: float

func _ready() -> void:
	translation.x = -zoom
	scroll_y = References.player.translation.y + 1.5

func _process(delta: float) -> void:
	# смотрим вверх или вниз
	offset.y = 0
	offset.y += -3 if Input.is_action_pressed('p_down') else 0
	offset.y += 3 if Input.is_action_pressed('p_up') else 0
	
	# считаем Y
	if scroll_y < References.player.translation.y - 2.5:
		scroll_y = References.player.translation.y - 2.5
	if scroll_y > References.player.translation.y + 2.5:
		scroll_y = References.player.translation.y + 2.5
	
	translation.x = lerp(translation.x, -zoom, 0.05)
	translation.y = lerp(translation.y, scroll_y + offset.y, 0.02)
	translation.z = lerp(translation.z, References.player.translation.z + offset.x, 0.15)
