extends Node2D

@onready var label: Label = $Label
var pluh = 0
var ball = preload("res://rigid_body_2d.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Label.text=str("%.2f" % $Timer.time_left)
	if Input.is_action_just_pressed("click") and $Timer.time_left==0 and pluh == 0:
		add_child(ball.instantiate())
		$Timer.start()
	else:
		return

func _on_area_2d_mouse_entered() -> void:
	pluh = 1

func _on_area_2d_mouse_exited() -> void:
	pluh = 0
