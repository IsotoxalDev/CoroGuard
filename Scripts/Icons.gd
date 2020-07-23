extends Node2D

var sprite = ""
var infected = false
onready var anim = $Sprite/AnimationPlayer
onready var ground = get_tree().get_root().get_node("World").Ground

func set_rot(x):
	set_rotation(deg2rad(x/ground*360))

func _process(_delta):
	ground = get_tree().get_root().get_node("World").Ground
	if infected:
		sprite = "Infected"
	anim.play(sprite)
