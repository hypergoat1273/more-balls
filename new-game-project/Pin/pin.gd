extends RigidBody2D


func _on_body_entered(body):
	if body.is_in_group("ball"):
		$AnimationPlayer.play("Collide")
		var anglewangle = self.global_position.direction_to(body.global_position)
		body.apply_impulse(anglewangle*1000)
