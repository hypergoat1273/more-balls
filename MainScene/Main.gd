extends Node2D

@onready var label: Label = $Label
var pluh = 0
var ball = preload("res://Ball/ball.tscn")
var cannon = preload("res://cannon.tscn")
@export var money = 1

signal pleh

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	cannonspawn(1)

func cannonspawn(numby):
	while numby > 0:
		add_child(cannon.instantiate())
		$Cannon.global_position = Vector2(1000,0)
		numby -= 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Label.text=str("%.2f" % $Timer.time_left)
	if Input.is_action_just_pressed("click") and $Timer.time_left==0 and pluh == 0:
		$Timer.start()
	else:
		return

func _on_area_2d_mouse_entered() -> void:
	var variable = 1
	pleh.emit(variable)

func _on_area_2d_mouse_exited() -> void:
	var variable = 0
	pleh.emit(variable)
