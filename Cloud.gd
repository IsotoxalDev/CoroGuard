extends Sprite

var motion = 0
var direction = 0
export var speed = 5


func _ready():
	randomize()
	var cloud = rand_range(-1,1)
	if cloud < 0:
		set_frame(0)
	else:
		set_frame(1)
		
func _process(delta):
	motion = direction*delta*speed
	set_position(get_position() + Vector2(motion, 0))
	if get_position().x < -150 or get_position().x > 280:
		queue_free()
