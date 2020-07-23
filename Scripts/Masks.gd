extends Node2D

onready var masks = get_children()
onready var infected = get_node("../../").infected

func set_life(no):
	if no <= 0:
		get_node("../TimeLeft/Timer").start()
		if infected == 0:
			var score = 0
			var entities = get_node("../../").container.get_children()
			var masksLeft=0
			for i in entities:
				if i.masked == true:
					if !i.revived:
						if !i.mskcheck:
							masksLeft+=1
							i.mskcheck = true
			masksLeft+=1
			score = pow(2, masksLeft)
			Global.Score += score
			get_node("../../").Level += 1
			get_node("../..").masks = 5
			get_node("../LevelUp").show()
			get_node("../Timer").start()
			get_node("../../").spawn(6)
			get_node("../MiniMap").spawn(6)
			pass
		else:
			var _n = get_tree().change_scene("res://Scenes/Game Over.tscn")
	for i in range(no):
		if i < 5:
			masks[i].show()
	for j in range (len(masks)-no):
		if j < 5:
			masks[j].hide()
	pass

func _process(_delta):
	infected = get_node("../../").infected
	set_life(get_node("../../").masks)


func _on_Timer_timeout():
	get_node("../LevelUp").hide()
	get_node("../Timer").stop()
