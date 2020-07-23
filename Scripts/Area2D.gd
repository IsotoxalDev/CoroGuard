extends Area2D

var pos = Vector2()
var gravityVal = 1
var maxPos = 0
var mskcheck = false
var infected = false
var masked = false
var nearPlayer = false
var revived = false
var once = true
var justgiven = false
onready var ground = get_parent().get_parent().Ground
onready var anim = $Sprite/AnimationPlayer
onready var maskButton = get_parent().get_parent().get_node("Player").get_node("Controls").get_child(0).get_node("GiveMask")

func _physics_process(_delta):
	ground = get_parent().get_parent().Ground
	if nearPlayer:
		#if Input.is_action_pressed("cure"):
		if !Global.maskJustGiven:
			if maskButton.is_pressed():
				#Global.masks-=1
				masked = true
				AudioManager.play("mask")
				get_node("../../").masks -= 1
				if infected:
					revived = true
				infected = false
				Global.maskJustGiven = true
	pos.y += gravityVal
	set_position(pos)

func _on_Entity_body_exited(body):
	if body.name == 'Ground':
		gravityVal = 1
	elif body.name == 'Player':
		nearPlayer = false

func _on_Entity_body_entered(body):
	if body.name == 'Ground':
		gravityVal = 0
	elif body.name == 'Player':
		nearPlayer = true
		

func _ready():
	randomize()
	var newpos = round(rand_range(-ground/2, ground/2))
	maxPos = round(rand_range(-ground/2, ground/2))
	pos.x = newpos
	pos.y=50
	infected = false
	set_position(pos)
	pass


func _on_Timer_timeout():
	if maxPos == get_position().x:
		maxPos = round(rand_range(-ground/2, ground/2))
	if (maxPos - get_position().x) < 0:
		pos.x -= 1
		if infected:
			if once:
				once = false
				anim.play("startInfectionLeft")
			else:
				if anim.get_current_animation() != "startInfectionLeft":
					anim.play("infectedLeft")
		elif masked:
			anim.play("maskedleft")
		else:
			anim.play("left")
	elif (maxPos - get_position().x) > 0:
		if infected:
			if once:
				anim.play("startInfectionRight")
				once = false
			elif not once:
				if anim.get_current_animation() != "startInfectionRight":
					anim.play("InfectedRight")
		elif masked:
			anim.play("maskedRight")
		else:
			anim.play("right")
		pos.x += 1


func _on_Entity_area_entered(area):
	if area.name != "Player":
		if !masked:
			if infected:
				if !area.masked:
					area.infected = true
				pass
	pass
