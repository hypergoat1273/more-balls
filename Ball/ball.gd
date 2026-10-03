extends RigidBody2D

func _ready():
	apply_impulse(to_local(Vector2(500,0)))
