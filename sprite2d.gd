extends Node2D

@onready var loop = 0
@onready var angulation = 0
@onready var stopped = 0
@onready var main = get_node("..")
var ball = preload("res://Ball/ball.tscn")


func _ready() -> void:
	main.pleh.connect(skibble)

func skibble(variable):
	stopped = variable

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Sprite2D.rotation_degrees = angulation-90
	if angulation >= 45:
		loop = 1
	elif angulation <= -45:
		loop = 0
	if loop == 0:
		angulation+=0.8
	elif loop == 1:
		angulation-=0.8
	
	if Input.is_action_just_pressed("click") and $Timer.time_left==0 and stopped == 0:
		$Sprite2D/Marker2D.add_child(ball.instantiate())
		$Timer.start()
