extends KinematicBody2D

var velocity = Vector2()
var temp = 0
const UP = Vector2(0, -1)
export (int) var speed = 200
export (int) var gravity = 8
onready var Ground = get_parent().Ground
onready var anim = $Sprite/AnimationPlayer
onready var left = $Controls/HBox/Left
onready var right = $Controls/HBox/Right


func _physics_process(_delta):
	Ground = get_parent().Ground
	temp = (int(right.is_pressed())-int(left.is_pressed()))
#	var temp = Input.get_action_strength("right")-Input.get_action_strength("left")
#	if not temp:
#		if Input.is_action_pressed("click"):
#			var mousepos = get_viewport().get_mouse_position().x
#			if mousepos > 128:
#				temp = 1
#			else:
#				temp = -1
	
	velocity.y += gravity
	velocity.x = temp*speed
	velocity = move_and_slide(velocity, UP)
	if get_position().x > Ground/2 or get_position().x < -Ground/2:
		set_position(Vector2(-get_position().x, 61.5))
	if temp == 1:
		anim.play("Right")
	elif temp == -1 :
		anim.play("Left")

func _on_GiveMask_released():
	Global.maskJustGiven = false
