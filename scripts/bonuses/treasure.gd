extends Area

export var treasure_res: Resource

func _on_body_entered(body) -> void:
	treasure_res.collect(translation)
	queue_free()
