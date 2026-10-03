extends Node2D

@onready var label: Label = $Label
var pluh = 0
var ball = preload("res://Ball/ball.tscn")
var cannonscene = preload("res://cannon.tscn")
@export var money = 1
@onready var cannon = null
signal pleh
@onready var Marker: Marker2D = null
@export var impulse_size = 20

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	cannonspawn(1)
	

func ballspawn():
	var instant = ball.instantiate()
	instant.global_position = Marker.global_position
	self.add_child(instant)
	#the impulse that you are looking for is along the angle from the cannon origin
	#to the marker2d with a given magnitude
	#to find the angle use cannon position . angle to (marker2d position) normalized and 
	#then apply magnitude. This is useful as its then easier to change the impulse with level ups
	var impulse_angle = cannon.global_position.direction_to(Marker.global_position)
	instant.apply_impulse(impulse_angle*impulse_size)

func cannonspawn(numby):
	while numby > 0:
		add_child(cannonscene.instantiate())
		Marker = $Cannon/Sprite2D/Marker2D
		cannon = $Cannon
		cannon.makeball.connect(ballspawn)
		cannon.global_position = Vector2(1000,75)
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
