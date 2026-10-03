extends Node2D

@onready var loop = 0
@onready var angulation = 270
@onready var stopped = 0
@onready var main = get_node("..")

@onready var pivotleft:bool = true
signal makeball
func _ready() -> void:
	main.pleh.connect(skibble)

func skibble(variable):
	stopped = variable

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Sprite2D.rotation_degrees = angulation
	if pivotleft:
		angulation += 0.8
		if angulation > 315:
			pivotleft = false
	else: 
		if not angulation < 215:
			angulation -= 0.8
		else: pivotleft = true
	
	#if loop == 0:
		#angulation+=0.8
	#elif loop == 1:
		#angulation-=0.8
	
	if Input.is_action_just_pressed("click") and $Timer.time_left==0 and stopped == 0:
		#instance them from main. Signal up. Call down.
		makeball.emit()
		$Timer.start()
 
