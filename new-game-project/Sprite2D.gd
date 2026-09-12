extends Sprite2D

@onready var loop = 0
@onready var angulation = 0

func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.rotation_degrees = angulation-90
	print_debug(angulation)
	if angulation >= 45:
		loop = 1
	if angulation <= -45:
		loop = 0
	if loop == 0:
		angulation+=1.5
	if loop == 1:
		angulation-=1.5
