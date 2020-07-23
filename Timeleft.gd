extends Label

onready var infected = get_node("../../../").infected

func _process(delta):
	set_text(str(round(get_parent().get_node("Timer").time_left)))
	infected = get_node("../../../").infected

func _on_Timer_timeout():
	if infected == 0:
			var score = 0
			var entities = get_node("../../../").container.get_children()
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
			get_node("../../../").Level += 1
			get_node("../../..").masks = 5
			get_node("../../LevelUp").show()
			get_node("../../Timer").start()
			get_node("../../../").spawn(6)
			get_node("../../MiniMap").spawn(6)
	else:
		var _n = get_tree().change_scene("res://Scenes/Game Over.tscn")
