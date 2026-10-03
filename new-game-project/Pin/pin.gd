extends RigidBody2D

func _ready():
	$AnimationPlayer.play("RESET")


func _on_body_entered(body):
	$AnimationPlayer.play("Collide")
