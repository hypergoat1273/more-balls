extends RigidBody2D

func _ready() -> void:
	self.global_position.x = get_global_mouse_position().x
