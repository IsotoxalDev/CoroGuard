extends Node2D

var cloudscn = preload('res://Scenes/Cloud.tscn')
var direction = 0
var pos = 40
var dir

func _ready():
	randomize()
	dir = rand_range(-1, 1)
	if dir < 0:
		direction = -1
	else:
		direction = 1
	spawn(pos)
	#pos = 0
	#spawn(pos)
	#pos = -40
	#spawn(pos)
	pos = -80
	spawn(pos)
	#pos = -120
	#spawn(pos)
	pos = 80
	spawn(pos)
	#pos = 120
	#spawn(pos)
	pos = 160
	spawn(pos)
	#pos = 200
	#spawn(pos)
	pos = 240
	spawn(pos)
	#pos = 280
	#spawn(pos)
	pass

func spawn(posit):
	var new_cloud = cloudscn.instance()
	add_child(new_cloud)
	new_cloud.set_position(Vector2(posit, 30))
	new_cloud.connect("tree_exited", self, "spawn_new")
	new_cloud.direction = direction

func spawn_new():
	if direction == 1:
		pos = -150
	else:
		pos = 280
	spawn(pos)
