extends KinematicBody2D
class_name InteractiveBody

export var modules: Array
export var gravity: float = 35

var velocity: Vector2
var loaded_modules: Array

func _ready() -> void:
  for module in modules:
    var loaded_module = module.new()
    if loaded_module.has_method('setup'):
      loaded_module.setup(self)
    loaded_modules.append(loaded_module)

func _process(delta) -> void:
  for module in loaded_modules:
    if module.has_method('exec'):
      module.exec(delta, self)

  velocity -= Vector3(0, gravity, 0) * Global.get_vector_delta(delta)
  velocity = move_and_slide(velocity, Vector2.UP)
